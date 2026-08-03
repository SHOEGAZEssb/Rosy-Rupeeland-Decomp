# Game work state

## Identification

The block at `0x02001588-0x02001944` owns the game's global work-state
singleton. `GameWork_Create` allocates `0x5F14` bytes with the heap tag `GMWK`,
initializes it, and stores the pointer at `0x020F3780`. Calls throughout ARM9
and the overlays use that pointer as a common game-state root.

The initializer copies the UTF-16 default name `デバッグ` ("debug") into the
state. This name and the `GMWK` tag occupy the 40-byte data block at
`0x020D3C4C-0x020D3C74`.

The singleton's bit-level API is described in [game_flags.md](game_flags.md).

## Known layout

The header gives names only to structure that the initializer establishes with
direct evidence. Important fixed-capacity areas include:

| Offset | Shape | Initialization |
| --- | --- | --- |
| `0x0010` | 16 UTF-16 code units | default debug name |
| `0x004C` | 256 halfwords | cleared, then selected defaults assigned |
| `0x03CC` | 2 banks of 128 pointers | cleared by `GameWork_ClearPointerBank` |
| `0x0FE8` | 18 records of `0x328` bytes | two 50-entry pointer banks per record |
| `0x48BC` | 200 eight-byte entries | cleared |
| `0x4F00` | 120 three-halfword entries | cleared |
| `0x51F0` | 256 twelve-byte packed entries | cleared |
| `0x5E14` | 30 halfword pairs | cleared |

Offsets without corroborated behavior retain `unknown` or value-oriented names.
Later users should refine those names rather than treating this initial layout
as semantic proof.

## Matching trap

The readable C for `GameWork_Init` reproduces the retail control flow and
offsets but causes MWCC to exchange the `r2` and `r12` scratch registers. The
matching build therefore retains that C for portable builds and selects an
inline-assembly fallback for the retail build.

MWCC adds fallthrough branches to labels inside an inline-assembly function,
so backward branches in the fallback are emitted as exact ARM words. Objdiff
classifies those words as data and also associates an aggregate-data relocation
differently. The final ARM9 link performed by `ninja rom`, rather than the
standalone object score, is authoritative for this function.

## Native-port boundaries

`GameWork_Create` calls the game heap wrapper with a size, tag, four-byte
alignment, and heap context. A native build needs an allocator with compatible
alignment and lifetime behavior; it does not need fixed NDS addresses.

`GameWork_Init` calls NitroSDK `MI_CpuCopy8` for a 32-byte name copy. For this
caller, the required semantics are exactly overlap-independent byte copying;
the native implementation can use the platform memory-copy primitive. The two
calls at `0x02027F94` and `0x02027BD4` initialize the embedded state at `0x5DF0`,
but their subsystem is not yet identified and remains a pending boundary.

Validation is the linked ARM9 check performed by `ninja rom`, followed by the
retail ROM SHA-256 gate.
