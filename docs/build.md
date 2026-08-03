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

## Code-generation profiles and traps

The MT19937 source uses:

```text
-proc arm946e -O4 -inline on,noauto -ipa file -interworking -Cpp_exceptions off -lang c
```

The `-ipa file` option is essential for the recovered reference-style C;
without it MWCC uses a different instruction schedule. `-O3` and `-O4`
generate the same non-IPA code. The compiler default and explicit `-opt space`
are indistinguishable here, while `-opt speed` produces different code.

`src/system/input.c` uses `-O3` and defines `MATCHING`:

```text
-proc arm946e -O3 -inline on,noauto -ipa file -interworking -DMATCHING -lang c
```

`PAD_Read` and `UpdateSystemFrame` are generated from C. MWCCARM could not be
shaped to reproduce the retail register allocation for `UpdateKeyState`, so
the readable C implementation is retained under `#ifndef MATCHING` and the
matching build assembles `asm/system/input_update.s` with MWASMARM 1.0 build
20. A partial MWLDARM link combines both inputs into the replacement object.
That partial link changes relocation associations, so its standalone objdiff
result can differ even when the final linked ARM9 bytes match.

`src/system/debug_menu.c` uses:

```text
-proc arm946e -O4 -inline off -ipa function -interworking -lang c++
```

C++ mode is required to reproduce the original deleting-expression code
generation in the update routine.

`src/system/game_work.c` uses `-O4`, disables inlining, and enables per-file
IPA. The readable `GameWork_Init` C differs in one scratch-register allocation,
so the matching definition uses an inline-assembly fallback while retaining the
C for portable builds. Its backward branches are emitted as exact ARM words
because MWCC otherwise adds fallthrough branches to labels inside the inline
assembly function.

The complete cross-module inventory of matching fallbacks and C++ lifetime
forms, including the behavior a host implementation must preserve, is in
[compiler_sensitive.md](compiler_sensitive.md).

The remaining NitroSDK make flags for instruction set, debug information,
diagnostics, character signedness, and language compatibility do not alter the
owned bytes. The checked-in build keeps the smallest proven code-generation
set. Exact source-to-ROM ownership ranges live in `config/arm9/delinks.txt`,
and generated comparison details live under `build/reports`.

## Commands and artifacts

```powershell
.\tools\configure.ps1
ninja match    # compile replacements and run configured object-level gates
ninja rom      # full source-backed link, module verification, and NDS rebuild
```

Machine-readable comparisons and their concise text summaries are generated
under `build/reports`. All build artifacts are ignored. Reports for partially
linked objects or hand-encoded inline-assembly branches may contain metadata
differences; `ninja rom` verifies the authoritative linked bytes.

`objdiff.json` is generated from the dsd configuration and covers the full
ARM9/overlay layout. It includes all reconstructed units and invokes
`ninja match` when objdiff requests a rebuild.

## Source-backed ROM link

`ninja rom` generates `build/decomp/arm9.lcf` and the original object response
file with dsd. `tools/prepare_link_objects.ps1` then applies the explicit
entries in `config/arm9/link_replacements.txt`, replacing selected original
delink objects with their reconstructed counterparts.

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
