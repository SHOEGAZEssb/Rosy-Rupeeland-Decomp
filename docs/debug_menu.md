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

## Update behavior

`DebugMenu_Update` draws the build date, timezone note, and SDK version;
changes the selection with newly pressed directional buttons; destroys the
menu when A is pressed; and allocates and initializes the selected test scene.
The switch has 13 entries, including one no-op entry and one entry that returns
immediately after launching its scene.

## Matching trap

This source requires C++ mode and per-function IPA:

```text
-proc arm946e -O4 -inline off -ipa function -interworking -lang c++
```

The update destroys the menu through a C++ delete expression after the virtual
destructor call. Expressing it as an ordinary C-style destructor/free sequence
changes the compiler's instruction scheduling.
