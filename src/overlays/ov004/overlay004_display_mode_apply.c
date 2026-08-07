#include "tingle/types.h"

/*
 * Overlay 4 display-mode application. This recovered helper conditionally
 * copies two stored five-bit mode values into the main and sub DS DISPCNT
 * registers.
 */

typedef struct Overlay004DisplayModeState {
    u8 field_000[0x20];
    u32 field_020_0_9 : 10;
    s32 applyDisplayMode_020_10 : 1;
    u32 field_020_11_31 : 21;
    u8 field_024[0x24];
    u32 mainMode_048;
    u32 subMode_04c;
} Overlay004DisplayModeState;

/*
 * If the signed one-bit flag at +0x20 bit 10 is set, replace DISPCNT bits
 * 8..12 at 0x04000000 and
 * 0x04001000 with mainMode_048 and subMode_04c respectively, preserving all
 * other register bits. Return zero in every case. The stored modes are
 * assumed by the original code to fit five bits; no software mask is applied
 * before shifting, so wider values would also affect higher DISPCNT bits.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov004_021fc8fc(Overlay004DisplayModeState *state)
{
    if (state->applyDisplayMode_020_10) {
        volatile u32 *mainDispcnt = (volatile u32 *)0x04000000;
        volatile u32 *subDispcnt = (volatile u32 *)0x04001000;

        *mainDispcnt = (*mainDispcnt & ~0x1f00) | (state->mainMode_048 << 8);
        *subDispcnt = (*subDispcnt & ~0x1f00) | (state->subMode_04c << 8);
    }
    return 0;
}
