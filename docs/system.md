# System and input module

## Global state

The DTCM object at `0x027E0088` begins with system flags and contains four pad
records. Each `PadState` is `0x16` bytes:

| Offset | Size | Field |
| --- | --- | --- |
| `0x00` | 2 | Currently held keys |
| `0x02` | 2 | Newly pressed keys |
| `0x04` | 2 | Newly released keys |
| `0x06` | 2 | Initial presses and key-repeat events |
| `0x08` | 1 | Initial repeat delay; initialized to 20 frames |
| `0x09` | 1 | Subsequent repeat interval; initialized to 4 frames |
| `0x0A` | 12 | One repeat countdown per supported key bit |

`UpdateKeyState` at `0x02001064` updates one of these records. The main loop
uses state 0 for physical controls and state 1 for filtered or remapped game
input. Its readable reconstructed implementation is in `src/system/input.c`;
the matching build uses `asm/system/input_update.s` where MWCCARM's register
allocation differs.

## Per-frame system update

`UpdateSystemFrame` at `0x02000F10`:

1. updates VCOUNT-derived frame timing;
2. waits for VBlank;
3. increments the global frame counter;
4. reads the pad and updates state 0;
5. recognizes the L+R+Start+Select soft-reset chord (`0x030C`); and
6. enters `PM_GoSleepMode` when the lid-close bit is set.

The sleep wake-up mask is `0x0C`, which combines cover-open and card events.

## Matching trap

The matching build combines compiler output with the assembly implementation
of `UpdateKeyState` through a partial MWLDARM link. Objdiff compares relocation
associations as well as instruction bytes, so that intermediate object can
report differences which disappear in the final ARM9 link. Use `ninja rom` as
the authoritative check for this unit.

## Random-number generator

The block at `0x0200234C-0x02002638` is the standard 32-bit MT19937 reference
implementation, exposing `init_genrand`, `init_by_array`, `genrand_int32`, and
the game's `InitRandom` wrapper.

The state contains 624 words at `0x020F43EC`; its index is initialized to 625
at `0x020D3D10`, followed by the two-word `mag01` table at `0x020D3D14`.
`InitRandom` uses the four-word reference seed at `0x020C35F0`:
`{0x123, 0x234, 0x345, 0x456}`.
