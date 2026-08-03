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
| Main loop and timing | VBlank waits, VCOUNT, OS timing and interrupts | Host clock, deterministic frame scheduler, and event loop | identified |
| Input | Key registers, `PAD_Read`, touch input | Keyboard/controller/mouse mapping with DS-compatible edge and repeat behavior | identified |
| Graphics | 2D/3D engines, VRAM banks, GX/G2 commands, display capture | PC renderer reproducing both DS screens and resource semantics | unmapped |
| Audio | ARM7 sound services, command queues, Nitro sound formats | Host mixer and sequencer with decoded game resources | unmapped |
| Files and resources | NitroFS/FS calls and archive formats | ROM-backed or extracted-data virtual filesystem | identified |
| Overlays | `FS_LoadOverlay`, `FS_StartOverlay`, unload lifecycle | Static registration or host-side scene/module lifecycle | identified |
| Power management | `PM_GoSleepMode`, lid and card events | Window focus/suspend policy with compatible game-visible state | identified |
| ARM7/PXI services | Cross-processor messages and ARM7-owned hardware | Host services replacing each message protocol | unmapped |
| Save data | GameWork raw/LZ serialization, cartridge backup APIs, and device constraints | Compatible persistent save storage, codec, and validation | identified |
| Memory/runtime | Fixed addresses, arenas, caches, DMA, fixed-point and ARM ABI assumptions | Portable allocation, transfer, numeric, and serialization layers | unmapped |

The first detailed memory/runtime contract is the game-work allocator and
32-byte `MI_CpuCopy8` use in [game_work.md](game_work.md). Its heap alignment and
lifetime requirements are identified; the embedded state initialized through
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
