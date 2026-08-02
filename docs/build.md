# Matching build

## Local prerequisites

The verified proprietary tool versions are:

| Tool | Version |
| --- | --- |
| `mwccarm.exe` | 3.0 build 114 |
| `mwldarm.exe` | 2.0 build 82 |
| `mwasmarm.exe` | 1.0 build 20 |

They are not part of the repository. `tools/configure.ps1` accepts explicit
`-Mwccarm`, `-Mwldarm`, `-Mwasmarm`, `-DsdExe`, `-ObjdiffExe`, and
`-PythonExe` arguments. It also reads `MWCCARM`, `MWLDARM`, `MWASMARM`,
`MWCCARM_ROOT`, `DSD_EXE`, `OBJDIFF_EXE`, and `PYTHON_EXE`. Resolved paths are
stored only in ignored build output.

The compiler's harmless missing-`MWCIncludes` warning and the linker's
missing-`MWLibraries` warning are expected because the project supplies its
include path and object inputs explicitly.

## Metrowerks compiler result

The exact code-generation flags are:

```text
-proc arm946e -O4 -inline on,noauto -ipa file -interworking -Cpp_exceptions off -lang c
```

These flags compile `src/system/mt19937.c`. The `-ipa file` option is
essential. With the recovered reference-style C,
the same command without it reaches `94.454544%` for `.text`; adding it makes
all four functions byte-exact. `-O3` and `-O4` generate the same non-IPA code.
The compiler default and explicit `-opt space` are indistinguishable for this
unit, while `-opt speed` produces different code and is not the retail setting
for this file.

`src/system/input.c` uses `-O3` and defines `MATCHING`:

```text
-proc arm946e -O3 -inline on,noauto -ipa file -interworking -DMATCHING -lang c
```

`PAD_Read` and `UpdateSystemFrame` are generated from C. MWCCARM could not be
shaped to reproduce the retail register allocation for `UpdateKeyState`, so
the readable C implementation is retained under `#ifndef MATCHING` and the
matching build assembles `asm/system/input_update.s` with MWASMARM 1.0 build
20. A partial MWLDARM link combines both inputs into the replacement object.
Its standalone objdiff score is `99.444440%` because that partial link changes
relocation associations; the final linked ARM9 bytes are exact.

`src/system/debug_menu.c` uses:

```text
-proc arm946e -O4 -inline off -ipa function -interworking -lang c++
```

The constructor, destructor variants, 964-byte update, factory, 1,100-byte
`.text`, and 12-byte `.data` vtable are all byte-exact. C++ mode is required to
reproduce the original deleting-expression code generation.

`src/system/game_work.c` uses `-O4`, disables inlining, and enables per-file
IPA. Three functions compile directly to their retail bytes. The readable
`GameWork_Init` C differs only in one scratch-register allocation, so the
matching definition uses an inline assembly fallback while retaining the C for
portable builds. Its backward branches are emitted as exact ARM words because
MWCC otherwise adds fallthrough branches to labels inside the inline assembly
function. The final linked 956-byte text range, 40-byte data block, and four-byte
BSS slot are exact.

The remaining NitroSDK make flags for instruction set, debug information,
diagnostics, character signedness, and language compatibility do not alter the
owned bytes. The checked-in build keeps the smallest proven code-generation
set.

## Target slices

`config/arm9/delinks.txt` assigns these original sections to
`src/system/mt19937.c`:

| Section | Address range | Size |
| --- | --- | ---: |
| `.text` | `0x0200234C-0x02002638` | `0x2EC` |
| `.rodata` | `0x020C35F0-0x020C3600` | `0x10` |
| `.data` | `0x020D3D10-0x020D3D1C` | `0x0C` |
| `.bss` | `0x020F43EC-0x020F4DAC` | `0x9C0` |

dsd turns those noncontiguous slices and their relocations into
`build/decomp/delinks/src/system/mt19937.o`. Ninja also extracts raw code under
`build/reference` and checks these hashes:

| Slice | Range | SHA-256 |
| --- | --- | --- |
| Entire text | `0x0200234C-0x02002638` | `BB847ACB31A6B5F24FEAC97F6DE603E640B0BD4ED1C5810881D0FF3B0690C490` |
| `init_genrand` | `0x0200234C-0x020023A0` | `5C0F6F4135F440181ECA364E2767AD999F348155291FC3E49546D88820ACDF9D` |
| `init_by_array` | `0x020023A0-0x020024B0` | `5F441DF5770B57B1E589A228BEF01463349A6C21FA3EF81530FEFB44A9569068` |
| `genrand_int32` | `0x020024B0-0x02002608` | `DA52559E9777E8639125D2EA663B661063731F840D0949496B96D50BF015BF29` |
| `InitRandom` | `0x02002608-0x02002638` | `CA31A898643247A18E9478E592C819FE0446BF3B063F30211BB93DA7CDFF17E5` |

The input/system unit is the contiguous `.text` range
`0x02000ED8-0x0200113C` (`0x264` bytes). Its original relocation-aware object
is `build/decomp/delinks/src/system/input.o`; the reconstructed object is
`build/decomp/src/system/input.o`.

## Commands and artifacts

```powershell
.\tools\configure.ps1
ninja mt19937  # target delink object and reconstructed object
ninja input    # C/assembly input replacement plus object-level report
ninja debug_menu  # complete debug-menu unit and exact gate
ninja game_work   # global game-work unit and object report
ninja archive  # MWLDARM static-library smoke test
ninja match    # both object diffs, raw slices, archive, and MT exactness gate
ninja rom      # full source-backed link, module verification, and NDS rebuild
```

Machine-readable comparisons are `build/reports/mt19937.json`,
`build/reports/input.json`, `build/reports/debug_menu.json`, and
`build/reports/game_work.json`; their concise summaries have matching `.txt`
names. All build artifacts are ignored. The game-work object report is
non-authoritative for its hand-encoded branch mapping and aggregate-data
relocation; `ninja rom` verifies the linked bytes.

`objdiff.json` is generated from the dsd configuration and covers the full
ARM9/overlay layout. It includes all reconstructed units and invokes
`ninja match` when objdiff requests a rebuild.

## Source-backed ROM link

`ninja rom` generates `build/decomp/arm9.lcf` and the original object response
file with dsd. `tools/prepare_link_objects.ps1` then applies the explicit
entries in `config/arm9/link_replacements.txt`. The current manifest replaces
the original MT19937, input, debug-menu, and game-work delink objects with their
reconstructed counterparts.

MWLDARM links the full module graph with `-nodeadstrip`; this is required to
retain retail code that has no statically visible references. Before packing,
`dsd check modules --fail` verifies the ARM9, ITCM, DTCM, and every one of the
647 ARM9 overlays. `tools/build_recompiled_rom.ps1` stages the linked modules in
an ignored copy of the extracted ROM, rebuilds the NDS, fixes its header CRCs,
and enforces the retail SHA-256. The verified output is:

```text
build/tingle.recompiled.nds
72FE824D5FBA107BCE221EB85EEE4DA54295A9B1DFC47F5176ED7752A6F5006D
```

## Incremental reconstruction

Unassigned ranges remain in dsd-generated `_dsd_gap@...` objects. A new source
file is introduced by assigning its original `.text`, data, and BSS ranges in
the corresponding `delinks.txt`. Until it is byte-exact, dsd's original
relocation-aware object remains the linkable slice and objdiff target. Once a
translation unit is complete, its target-to-source substitution is added to
`config/arm9/link_replacements.txt`. This preserves exact original slices while
allowing C/C++ objects to replace them one unit at a time.

An optional GCC/devkitARM build can later use the same source/object graph, but
it must use separate output paths and is not part of the matching baseline.
