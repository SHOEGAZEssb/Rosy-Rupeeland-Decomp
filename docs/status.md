# Project status

## Baseline

- The ROM extracts successfully without an ARM7 BIOS.
- `dsd rom build` reproduces every byte except offsets `0x6C-0x6D` and
  `0x15E-0x15F` in the NDS header.
- The first field is the retail secure-area CRC. Because the extracted ARM9 is
  already decrypted, `dsd` writes zero there. The second field is the header
  CRC covering the first field.
- `tools/patch_rom_header.py` restores the retail secure-area CRC and computes
  a valid header CRC. The unmodified rebuild then matches the target SHA-256.

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

The matching toolchain is MWCCARM 3.0 build 114 and MWLDARM 2.0 build 82. The
first exact game-owned unit uses:

```text
-proc arm946e -O4 -inline on,noauto -ipa file -interworking -lang c
```

See [build.md](build.md) for local configuration, the comparison workflow, and
the optimization variants tested.

## Matching progress

`src/system/mt19937.c` is isolated as a relocation-aware dsd object and is
byte-exact:

| Item | Target size | Match |
| --- | ---: | ---: |
| `.text` | 748 bytes | `100.000000%` |
| `.rodata` | 16 bytes | `100.000000%` |
| `.data` | 12 bytes | `100.000000%` |
| `.bss` | 2,496 bytes | `100.000000%` |
| `init_genrand` | 84 bytes | `100.000000%` |
| `init_by_array` | 272 bytes | `100.000000%` |
| `genrand_int32` | 344 bytes | `100.000000%` |
| `InitRandom` | 48 bytes | `100.000000%` |

`ninja match` rebuilds this result and fails if any owned section or function
falls below an exact match.

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

Source-pattern analysis has also identified the startup-facing OS, PXI, FS,
and PM functions. See [startup.md](startup.md) for their addresses, evidence,
and the initial `main` loop map.

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
