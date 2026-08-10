# Native recompilation

## Objective

The native target is a source recompilation of *Freshly-Picked Tingle's Rosy
Rupeeland*, in the same broad sense that Ship of Harkinian recompiles recovered
game code around replacement platform services. Reconstructed game-owned C and
C++ must remain the implementation of game behavior. The host target supplies
compatible operating-system, SDK, hardware, and data-access boundaries.

This is not a clone, a scene-by-scene rewrite, an emulator, or a runtime ARM
interpreter. A native-only function must not reproduce a recovered scene,
state machine, actor constructor, script, or transition merely to approximate
what the retail game does. When game behavior cannot yet compile, the native
runtime stops at that dependency until the canonical recovered implementation
and its required boundaries are ready.

The matching NDS build remains the behavioral oracle and must continue to
coexist with the native target:

```text
Canonical reconstructed game code
|- MATCHING build
|  `- NitroSDK, ARM code, NDS memory map, and NDS linker layout
`- Native recompilation
   |- SDK and hardware compatibility interfaces
   |- host platform backend
   `- user-supplied retail data provider
```

The native build reads copyrighted assets from a user-supplied ROM or extracted
NitroFS tree. ROM contents, proprietary SDK files, and retail executable code
remain outside version control.

## Canonical-code rule

There should be one game implementation under `src/`, shared by matching and
native builds. Use conditional compilation only where the two targets genuinely
need different boundary code, such as:

- a matching-only assembly body paired with portable recovered C;
- a NitroSDK or memory-mapped hardware call paired with a native adapter;
- an overlay linker registration paired with native static registration;
- a fixed-address global paired with native-owned storage; or
- a platform entry point, event loop, renderer, audio device, filesystem, or
  persistence backend.

Do not add a parallel `native_` version of game logic. Host code may validate
inputs more defensively at an external boundary, but valid retail inputs must
retain recovered ordering, timing, numeric behavior, ownership, and side
effects.

Before compiling a recovered unit natively, consult the
[compiler-sensitive function inventory](compiler_sensitive.md). Matching-only
instruction schedules are not required on the host, but the behavior and
ordering documented there are.

## SDK and hardware barriers

A barrier is a dependency that prevents canonical recovered code from compiling
or behaving correctly on the host. Typical barriers include NitroSDK calls,
memory-mapped registers, cache/DMA operations, interrupt context, ARM assembly,
PXI communication, and fixed NDS addresses.

For each barrier, establish:

- the recovered game callers;
- the NDS dependency and its observable contract;
- units, timing, callback context, failure behavior, and ownership;
- a narrow native replacement point;
- a comparison against the matching build; and
- whether the boundary is identified, specified, implemented, or verified.

Replacing a boundary does not authorize replacing its callers. For example,
the native renderer should implement the effects of palette, tile, OAM, and 3D
commands issued by recovered graphics code; it should not draw a title screen
by independently reading title assets and inventing the scene lifecycle.

## ABI and data layout

The NDS program uses 32-bit pointers, ARM EABI conventions, fixed-size handles,
and structures whose serialized or shared layouts often include pointers. A
64-bit host compiler changes those layouts. Broadly linking game code before
choosing an ABI strategy would silently invalidate field offsets, allocation
sizes, save data, overlay records, and script-visible objects.

The native recompilation must therefore classify structures as one of:

- runtime-native objects whose pointer-bearing layout may be adapted together
  with every recovered user;
- fixed retail-format records that require explicit-width handles or a decoded
  host representation at the boundary; or
- serialized/resource data that must retain its byte-exact NDS layout.

Using a 32-bit host build may reduce early pointer-width differences, but it
does not solve fixed addresses, function-pointer identity, alignment, or
hardware semantics. Using a 64-bit build requires deliberate type adaptation.
Neither choice should be hidden behind duplicated byte-image simulations of
game objects. The ABI strategy must be settled before the first substantial
recovered subsystem is added to the native link.

## Overlays and executable code

Retail overlays are a code-organization and lifetime mechanism, not native
plugins. Recovered overlay sources should be compiled for the host and
registered statically or through a generated native table. Native code must not
load an ARM overlay image, treat an ARM callback address as callable, parse an
ARM instruction template as a substitute for its source, or construct a scene
from overlay metadata independently of the recovered engine.

Overlay-local initialized data may be extracted or generated as a build asset
while it remains unreconstructed, provided executable bytes are never run and
the provenance is explicit. The end state is compiled recovered code plus
retail data, not a mixture of native code and interpreted retail programs.

## Retail data and formats

`TingleNativeData` is the current data-provider boundary. It exposes safe
relative NitroFS file reads from either a user ROM or an extracted tree. ROM
mode validates FNT and FAT ranges; directory mode accepts either an extraction
root containing `files/` or the `files/` directory itself. Returned buffers are
caller-owned. The provider deliberately exposes no ARM9 or overlay executable
image API.

Nintendo LZ8/LZ10 is part of both resource loading and save compatibility.
The native memory-interface layer provides the recovered `MI_UncompressLZ8`
symbol plus a size-checked form for host-controlled I/O. Other resource-format
knowledge should be connected to canonical loaders and graphics calls rather
than used to build separate host scenes.

## Current native foundation

The retained Windows foundation consists of:

- a Win32 window and two-screen XRGB8888 presentation surface;
- a monotonic 60 Hz frame boundary;
- keyboard and mouse mapping into raw active-high DS key and touch samples;
- ROM/extracted-NitroFS data access; and
- native Nintendo LZ8/LZ10 decompression.

`tingle_native` is currently a process-shell and boundary smoke test. It opens
the data source and platform loop, but intentionally executes no substitute
game scene. Its framebuffer remains blank until recovered startup code is
linked. A blank shell is more accurate than a hand-authored screen that appears
to be progress toward recompilation while bypassing the game implementation.

## Barrier register

| Area | Required native boundary | Status |
| --- | --- | --- |
| Process and frame timing | Window lifecycle, monotonic clock, frame scheduling | implemented |
| Input | Host key/touch sampling; canonical recovered edge/repeat logic | partial |
| Retail files | ROM or extracted NitroFS provider | implemented |
| Memory-interface compression | LZ8/LZ10 decompression; compression still required for saves | partial |
| Heap and C/C++ runtime | Alignment, tags, ownership, constructors, global lifetime | identified |
| ABI and fixed globals | Pointer-width policy, fixed-address replacement, layout classification | unresolved |
| Overlays | Host compilation and generated static registration | identified |
| 2D graphics | BG, palette, VRAM-transfer, OAM, brightness, and display semantics | identified |
| 3D graphics | Geometry commands, matrices, textures, lighting, and render submission | identified |
| Audio | ARM7 sound services, command queues, formats, mixer, and sequencing | unmapped |
| Save data | Backup device API, exact serialization, compression, and persistence | identified |
| ARM7/PXI | Host services for each game-visible message protocol | unmapped |
| Power management | Suspend/focus policy and game-visible lid/card state | identified |

This table is only an index. Durable subsystem contracts belong in the
narrowest relevant source comments or existing subsystem document.

## Recompilation sequence

1. Choose and document the host ABI/data-layout strategy.
2. Add native build selection for portable bodies already present beside
   matching-only assembly.
3. Link a minimal slice of canonical startup code and satisfy its heap,
   memory, global-storage, and SDK dependencies with narrow adapters.
4. Generate native registrations for the recovered overlays needed by the
   retail boot path.
5. Execute the recovered main loop and `GamePhase_Bootstrap`; do not reproduce
   their state machines in the platform shell.
6. Implement graphics calls as renderer boundaries until the recovered splash
   and title phases render through their real scripts, actors, and resources.
7. Continue subsystem by subsystem through input, audio, saving, and gameplay,
   comparing valid state and visible behavior with the matching NDS build.

The title screen is reached only when canonical boot, phase, script, actor, and
graphics code produces it through native boundaries. Rendering the same assets
from a separate host state machine does not satisfy that milestone.

## Build and validation

Configure and build the current Windows foundation with a Windows CMake
toolchain:

```text
cmake -S . -B build/native -DBUILD_TESTING=ON
cmake --build build/native --config Release
ctest --test-dir build/native --output-on-failure
```

Supply retail data with either provider:

```text
build/native/tingle_native.exe --rom path/to/game.nds
build/native/tingle_native.exe --data path/to/extracted/root
```

When run from the repository root without arguments, the shell tries
`build/source-rom`. This default is a local convenience, not a source or build
dependency.

Every native change should have boundary-focused unit tests. Any edit to
canonical reconstructed code must also run its matching target. Before a batch
that changes decompiled code or NDS linkage is considered complete, `ninja rom`
must pass all module checks and the expected retail SHA-256 guardrail.
