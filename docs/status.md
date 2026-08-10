# Project technical baseline

## Long-term objective

The project ultimately targets a native, cross-platform source recompilation,
with Windows as the first supported desktop target. Byte-matching the European
NDS ROM is the reference workflow used to validate reconstructed game logic; it
is not the final product. Native targets compile that canonical recovered game
code and replace only NitroSDK, ARM, and Nintendo DS hardware interfaces with
documented platform implementations. Parallel host rewrites of game behavior
are explicitly out of scope.

SDK boundaries are therefore part of the decompilation output, not incidental
details. When a function or subsystem is reconstructed, its documentation
should identify every relevant SDK call or hardware dependency, the observable
semantics required by the game, and the planned native replacement. The
current barrier register and documentation format are in
[native_port.md](native_port.md).

## Baseline

- The ROM extracts successfully without an ARM7 BIOS.
- `dsd rom build` reproduces every byte except offsets `0x6C-0x6D` and
  `0x15E-0x15F` in the NDS header.
- The first field is the retail secure-area CRC. Because the extracted ARM9 is
  already decrypted, `dsd` writes zero there. The second field is the header
  CRC covering the first field.
- `tools/patch_rom_header.py` restores the retail secure-area CRC and computes
  a valid header CRC. The unmodified `build/tingle.original.nds` then matches
  the target SHA-256.
- `ninja rom` performs a full Metrowerks link with configured reconstructed
  objects replacing their retail slices. dsd verifies ARM9, ITCM, DTCM, and
  all 647 overlays, and the resulting
  `build/tingle.recompiled.nds` matches the retail SHA-256 exactly.

## Code layout

- ARM9 load address: `0x02000000`
- ARM9 entry point: `0x02000800`
- ARM9 file size: `0x000F4178`
- ARM7 load and entry address: `0x02380000`
- ARM7 file size: `0x000289C0`
- ARM9 overlays: 647 (`ov000` through `ov646`)
- ARM7 overlays: none
- Nitro filesystem entries: 819
- SDK version word reported by the ROM: `0x03027530`

The matching toolchain is MWCCARM 3.0 build 114 and MWLDARM 2.0 build 82. See
[build.md](build.md) for local configuration, the comparison workflow, and
compiler-sensitive code-generation profiles.

## Confirmed Nitro SDK symbols

The built-in `dsd` signatures identify these initial ARM9 functions:

| Address | Symbol |
| --- | --- |
| `0x020B94A4` | `FS_UnloadOverlay` |
| `0x020B94F8` | `FS_LoadOverlay` |
| `0x020B9554` | `FS_StopOverlay` |
| `0x020B9674` | `FS_StartOverlay` |
| `0x020B9818` | `FS_LoadOverlayFile` |
| `0x020B98B8` | `FS_LoadOverlayInfo` |

Source-pattern analysis has also identified `MI_CpuCopy8` at `0x020B5984`,
`MI_UncompressLZ8` at `0x020B5ABC`, `MI_CompressLZ` at `0x020B5CE0`, and the
startup-facing OS, PXI, FS, and PM functions. See
[startup.md](startup.md) for their addresses, evidence, and the initial `main`
loop map.

## Analyzer exception

`dsd init` initially reports that calls in overlay 3 target no function at
`0x021FBAA0`. Inspection shows a normal ARM function at that address:

- prologue at `0x021FBAA0`: `stmdb sp!, {r3-r8,lr}`
- return at `0x021FBB28`: `bx lr`
- literal pool at `0x021FBB2C-0x021FBB33`

The function follows an embedded constant region, which caused `dsd` to mark
the rest of the overlay as `.rodata`. The checked-in configuration corrects
the boundary by extending `.text` to `0x021FBB34` and defining the function as
an ARM function of size `0x94`.

The initial configuration was generated with the conservative compatibility
option `--allow-unknown-function-calls`, then corrected manually as described
above.
