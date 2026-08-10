# Native cross-platform port

## Objective

The end goal is a native, cross-platform version of *Freshly-Picked Tingle's
Rosy Rupeeland*. Windows is the first target, but the architecture should also
support Linux, macOS, and other suitable platforms without changing game-owned
logic. It should execute reconstructed game code directly on the host; it is
not intended to embed a Nintendo DS emulator or run the rebuilt NDS ROM.

The matching NDS build remains essential as a behavioral oracle. It establishes
whether reconstructed code preserves retail behavior before that code is moved
behind portable interfaces. The matching and native targets should coexist:

```text
Reconstructed game code
|- NDS matching platform layer
`- Portable native platform interfaces
   |- Windows backend
   |- Linux backend
   `- macOS backend
```

The native build should obtain copyrighted game data from a user-supplied ROM
or an extracted local data directory. ROM contents, SDK files, and proprietary
build tools must remain outside version control.

## SDK barrier documentation

A **barrier** is any dependency that prevents reconstructed game-owned code
from compiling or behaving correctly on a normal native host. This includes
direct NitroSDK calls, memory-mapped hardware access, ARM-specific code,
cross-processor communication, and assumptions about the NDS runtime or memory
layout. Platform-neutral interfaces should contain the game-visible contract;
operating-system-specific code should remain confined to small backends.

Before moving a reconstructed unit to a host compiler, consult the consolidated
[compiler-sensitive function inventory](compiler_sensitive.md). It identifies
matching-only ARM bodies, C++ lifetime forms, and the ordering or ownership
constraints that must survive even though their retail instruction sequences do
not.

For each reconstructed module, record barriers alongside its behavioral
documentation. Each barrier entry should capture:

| Field | Meaning |
| --- | --- |
| Game caller | Reconstructed function or subsystem using the dependency |
| NDS dependency | NitroSDK symbol, hardware register, ARM operation, or ABI assumption |
| Required semantics | Observable behavior the game actually depends upon |
| Data and ownership | Relevant structures, buffers, lifetimes, and thread/interrupt context |
| Native replacement | Proposed portable interface and required platform backends |
| Validation | How behavior can be compared with the matching NDS build |
| Status | `unmapped`, `identified`, `specified`, `implemented`, or `verified` |

Do not treat an SDK symbol name alone as sufficient documentation. The native
port needs its contract: timing, error behavior, callback context, units,
buffer layout, and any ordering assumptions visible to the game.

## Barrier register

The broad barriers currently known are:

| Area | NDS-side dependencies | Native-port requirement | Status |
| --- | --- | --- | --- |
| Main loop and timing | VBlank waits, VCOUNT, OS timing and interrupts | Host clock, deterministic frame scheduler, and event loop | implemented |
| Input | Key registers, `PAD_Read`, touch input | Keyboard/controller/mouse mapping with DS-compatible edge and repeat behavior | implemented |
| Graphics | 2D/3D engines, VRAM banks, GX/G2 commands, display capture | PC renderer reproducing both DS screens and resource semantics | identified |
| Audio | ARM7 sound services, command queues, Nitro sound formats | Host mixer and sequencer with decoded game resources | unmapped |
| Files and resources | NitroFS/FS calls and archive formats | ROM-backed or extracted-data virtual filesystem | implemented |
| Overlays | `FS_LoadOverlay`, `FS_StartOverlay`, unload lifecycle | Static registration or host-side scene/module lifecycle | identified |
| Power management | `PM_GoSleepMode`, lid and card events | Window focus/suspend policy with compatible game-visible state | identified |
| ARM7/PXI services | Cross-processor messages and ARM7-owned hardware | Host services replacing each message protocol | unmapped |
| Save data | GameWork raw/LZ serialization, cartridge backup APIs, and device constraints | Compatible persistent save storage, codec, and validation | identified |
| Memory/runtime | Fixed addresses, arenas, caches, DMA, fixed-point and ARM ABI assumptions | Portable allocation, transfer, numeric, and serialization layers | identified |

The first implemented memory/runtime contract is a fixed-layout native game-work
image and its 32-byte default-name copy, described in
[game_work.md](game_work.md). Its reset and flag storage preserve retail byte
offsets without embedding host pointers. The embedded state initialized through
`0x02027F94`/`0x02027BD4` remains unmapped.

The adjacent [game-work flag accessors](game_flags.md) are already portable C
and require no platform adapter. Their only external contract is a valid
`GameWork` object and an unchecked flag index in the range `0-3071`.

This table is an index, not a substitute for module-level contracts. Update it
as barriers are discovered or eliminated, and link detailed subsystem notes
from the relevant area.

## Porting milestones

1. Continue the matching reconstruction while naming game-owned types,
   functions, resources, and SDK boundaries.
2. Define narrow portable interfaces for timing, input, files, overlays,
   rendering, audio, persistence, and other discovered barriers.
3. Build a Windows harness that creates a dual-screen window, drives the frame
   loop, accepts host input, and reads assets from user-supplied game data.
   Implement Windows first without embedding Windows-only assumptions in game
   or platform-interface code.
4. Run an early reconstructed scene, with the debug menu as a useful candidate
   for exercising text, input, allocation, and scene transitions.
5. Move gameplay systems across incrementally and compare state and visible
   behavior against the matching NDS build.
6. Replace every remaining SDK or hardware barrier required by normal gameplay,
   then validate complete playthrough, saving, audio, rendering, and timing.

Code that exists solely to initialize Nintendo DS hardware or implement an SDK
internally does not need a literal native translation. Its game-visible
contract must still be understood and documented before native platform layers
can replace it safely.

## Initial Windows harness

The `tingle_native` CMake target creates a resizable window whose client area
contains the two 256-by-192 DS screens stacked vertically. The portable loop
receives active-high held, pressed, released, and repeated masks plus
bottom-screen mouse coordinates. Repeat events use the recovered per-key
timing: the initial press, again after 20 held frames, and then every four
frames. The Windows mapping is Z/A, X/B, Backspace/Select, Enter/Start, arrow
keys/D-pad, Q/L, and W/R. A monotonic host clock maintains a 60 Hz frame
boundary; a long stall resets accumulated timing debt instead of running an
unbounded catch-up loop.

Configure and build this target with a Windows CMake toolchain:

```text
cmake -S . -B build/native
cmake --build build/native --config Release
```

The harness runs a portable presentation model of the recovered hidden debug
menu. Its directional priority, unusual 13-entry wrapping, horizontal column
toggle, and A-button activation order match `DebugMenu_Update`. The menu uses a
host-owned XRGB8888 software canvas and bitmap font; the original DS debug-text
renderer is not reused. Entry zero opens the recovered phase selector, including
its three 90-phase pages, wrapping 10-by-9 grid, exact touch bounds, and
16-frame transition. The selected 0x58-byte phase metadata record is read from
the ARM9 image and decoded into host scalars. Its primary and secondary overlay
IDs at offsets `0x1C`/`0x20` are loaded, and callback offsets `0x24`/`0x28` are
validated as addresses inside their respective DS code ranges. The ARM
callbacks are verified generated templates: their actor descriptor lists,
runtime data, callback data, work storage, and secondary region table are
translated to validated overlay-relative records. Descriptor kinds are checked
against the recovered 1-9 factory range, and signed selector offset `0x50`
determines initial eligibility. Confirmed common descriptor fields--kind,
subtype, byte bounds, signed position, flags, selector, retained value, and the
raw reference at `0x58`--are copied into host-owned scalar records. The full
`0x64` bytes are retained alongside those scalars for constructor fields whose
meaning is still offset-derived. Synthetic startup descriptors reproduce the
confirmed initializer bytes rather than inventing a host-only layout. The
recovered factory's kind/subtype matrix and its two ARM9 selector tables
then resolve every record to a retail allocation size and a type-local
constructor route. Constructors themselves remain behind the native runtime
boundary. The native phase scaffold allocates a host-owned byte image of that
size for each initially eligible descriptor and applies the recovered common
geometry initializer, including fixed-point positions, byte bounds, raw NDS
vtable identities, and descriptor value `0x52`. The category-one bootstrap,
category-two bootstrap, and the common type-three actor added once per category
are built in their recovered order before each overlay list. Derived
constructors are not yet represented. The phase-start
companion also follows its recovered shared-state timing: it
sets GameWork flag `0x3F3`, advances states zero and one together on its first
update, then clears optional flag `0x386` and its own flag on the next update.
The covered-scene virtual updates and screen fades at those states remain
platform boundaries. The phase boundary presents these partial actors in a
normalized spawn-map
diagnostic, colored by the primary or secondary category. It is an inspection
view of recovered descriptor positions, not a substitute for the game's camera,
tilemap, sprite, or 3D render paths. Fourteen 32-byte zero
secondary images are omitted by the phase table; the decoder still represents
such an image as an empty registration when read directly. The callbacks
remain addresses and are never called as host function pointers.
Execution then stops at the large phase-runtime construction boundary. Other menu entries likewise
report their selected scene boundary until their graphics, sound, heap, and
overlay dependencies have native implementations.

Supply game data from either a user-owned ROM or an extracted ROM root:

```text
build/native/tingle_native.exe --rom path/to/game.nds
build/native/tingle_native.exe --data path/to/extracted/root
```

An extracted root uses `files/` for NitroFS, `arm9/arm9.bin` for fixed program
data, and `arm9/arm9.yaml` for its ARM9 base address. Passing the `files/`
directory directly remains supported for NitroFS-only work. ROM reads resolve
paths through validated FNT/FAT ranges and ARM9 reads through validated header
offsets; directory reads reject absolute paths and dot traversal. Returned
buffers are always owned by the caller, giving reconstructed loaders one
consistent native contract.

ARM9 overlays use the same provider. ROM mode validates the 32-byte overlay
table record and FAT extent; extracted mode reads the corresponding metadata
and binary under `arm9_overlays/`. Uncompressed code is copied into owned
storage with zero-filled BSS and its DS load/constructor addresses retained as
metadata. Compressed images are rejected until a native decoder is specified.
