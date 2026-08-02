# Debug menu

## Identification

The class beginning at `0x0200113C` implements the retail ROM's internal debug
menu. Its update routine references the embedded build date at `0x020D3BF0`,
the `sdk:%d-%d-%d` format string at `0x020D3C2C`, and a selectable list of 13
test or scene constructors.

The factory at `0x02001558` allocates `0x28` bytes and calls
`DebugMenu_Init`. The object consists of the common `0x24`-byte scene base
followed by a signed selection index:

| Offset | Size | Field |
| --- | ---: | --- |
| `0x00` | 4 | vtable pointer |
| `0x04` | `0x20` | common scene fields |
| `0x24` | 4 | selected debug-menu entry |

## Reconstructed unit

`src/system/debug_menu.c` owns the complete menu code at
`0x0200113C-0x02001588` and the three-entry vtable at
`0x020D3BC4-0x020D3BD0`:

| Address | Symbol | Size | Match |
| --- | --- | ---: | ---: |
| `0x0200113C` | `DebugMenu_Init` | 40 bytes | `100.000000%` |
| `0x02001164` | `DebugMenu_Destroy` | 20 bytes | `100.000000%` |
| `0x02001178` | `DebugMenu_DestroyAndFree` | 28 bytes | `100.000000%` |
| `0x02001194` | `DebugMenu_Update` | 964 bytes | `99.170130%` |
| `0x02001558` | `DebugMenu_Create` | 48 bytes | `100.000000%` |
| `0x020D3BC4` | `gDebugMenuVTable` | 12 bytes | `100.000000%` |

The complete 1,100-byte `.text` section matches `99.272730%`; `.data` is
exact. Every function has the exact retail size. `ninja match` enforces exact
results for the constructor, both destructor variants, factory, and vtable.

## Update behavior and remaining mismatch

`DebugMenu_Update` draws the build date, timezone note, and SDK version;
changes the selection with newly pressed directional buttons; destroys the
menu when A is pressed; and allocates and initializes the selected test scene.
All 13 switch entries, including the no-op entry and the early-return entry,
are reconstructed.

Its only generated-code difference is instruction scheduling around the
virtual destructor call. Retail emits `mov r0, r4` immediately before loading
the vtable through `r0`; MWCCARM schedules the equivalent vtable load through
`r4` one instruction earlier. The remaining instructions, function size, and
relocations match.

The best matching flags for this unit are:

```text
-proc arm946e -O4 -inline off -ipa function -interworking -lang c
```
