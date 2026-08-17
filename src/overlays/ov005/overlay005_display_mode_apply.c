#include "tingle/types.h"

/*
 * Overlay 5 display-mode application. This recovered callback conditionally
 * submits cached graphics state and updates the sub-engine display mode.
 */

typedef struct Overlay005DisplayModeState {
    u8 field_000[0x20];
    u32 field_020_0_9 : 10;
    s32 applyDisplayMode_020_10 : 1;
    u32 field_020_11_31 : 21;
    u8 field_024[0x28];
    u32 subMode_04c;
    u8 field_050[0x34];
    u16 cachedValue_084;
} Overlay005DisplayModeState;

#ifdef __cplusplus
extern "C" {
#endif
extern void TitlePalette_SetSubBackdrop(u16 value);
#ifdef __cplusplus
}
#endif

/*
 * If the signed one-bit flag at +0x20 bit 10 is set, call TitlePalette_SetSubBackdrop with
 * cachedValue_084, then replace bits 8..12 of sub DISPCNT 0x04001000 with
 * subMode_04c shifted left eight bits. Return zero in all cases. The original
 * assumes subMode_04c fits five bits and does not mask it before shifting;
 * MMIO effects and preservation of all other existing register bits are confirmed.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov005_021fc794(Overlay005DisplayModeState *state)
{
    if (state->applyDisplayMode_020_10) {
        volatile u32 *subDispcnt = (volatile u32 *)0x04001000;

        TitlePalette_SetSubBackdrop(state->cachedValue_084);
        *subDispcnt = (*subDispcnt & ~0x1f00) | (state->subMode_04c << 8);
    }
    return 0;
}
