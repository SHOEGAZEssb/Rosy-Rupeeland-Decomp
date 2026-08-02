# Matching build

## Local prerequisites

The verified proprietary tool versions are:

| Tool | Version |
| --- | --- |
| `mwccarm.exe` | 3.0 build 114 |
| `mwldarm.exe` | 2.0 build 82 |
| `mwasmarm.exe` | 1.0 build 20 |

They are not part of the repository. `tools/configure.ps1` accepts explicit
`-Mwccarm`, `-Mwldarm`, `-DsdExe`, `-ObjdiffExe`, and `-PythonExe` arguments.
It also reads `MWCCARM`, `MWLDARM`, `MWCCARM_ROOT`, `DSD_EXE`, `OBJDIFF_EXE`,
and `PYTHON_EXE`. Resolved paths are stored only in ignored build output.

The compiler's harmless missing-`MWCIncludes` warning and the linker's
missing-`MWLibraries` warning are expected because the project supplies its
include path and object inputs explicitly.

## Metrowerks compiler result

The exact code-generation flags are:

```text
-proc arm946e -O4 -inline on,noauto -ipa file -interworking -lang c
```

These flags compile `src/system/mt19937.c`. The `-ipa file` option is
essential. With the recovered reference-style C,
the same command without it reaches `94.454544%` for `.text`; adding it makes
all four functions byte-exact. `-O3` and `-O4` generate the same non-IPA code.
The compiler default and explicit `-opt space` are indistinguishable for this
unit, while `-opt speed` produces different code and is not the retail setting
for this file.

The current best compiler candidate for `src/system/input.c` differs only in
using `-O3`:

```text
-proc arm946e -O3 -inline on,noauto -ipa file -interworking -lang c
```

Compared with `-O4`, this leaves the exact `PAD_Read` and instruction-matched
`UpdateSystemFrame` results unchanged while improving `UpdateKeyState` from
`89.592590%` to `91.092590%`. The input `.text` aggregate improves from
`96.294120%` to `96.823530%`. Treat `-O3` as the best current per-unit
candidate rather than a confirmed original setting until the remaining
function is exact.

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
ninja input    # input objects plus the current informational match report
ninja archive  # MWLDARM static-library smoke test
ninja match    # both object diffs, raw slices, archive, and MT exactness gate
```

Machine-readable comparisons are `build/reports/mt19937.json` and
`build/reports/input.json`; their concise summaries have matching `.txt`
names. All build artifacts are ignored.

`objdiff.json` is generated from the dsd configuration and covers the full
ARM9/overlay layout. It includes both reconstructed units and invokes
`ninja match` when objdiff requests a rebuild.

## Incremental reconstruction

Unassigned ranges remain in dsd-generated `_dsd_gap@...` objects. A new source
file is introduced by assigning its original `.text`, data, and BSS ranges in
the corresponding `delinks.txt`. Until it is ready for the full link, dsd's
original relocation-aware object remains the linkable slice and objdiff target.
Once a translation unit is complete, its delink entry can be marked `complete`
so the generated LCF selects the reconstructed object. This preserves exact
original slices while allowing C/C++ objects to replace them one unit at a
time.

An optional GCC/devkitARM build can later use the same source/object graph, but
it must use separate output paths and is not part of the matching baseline.
