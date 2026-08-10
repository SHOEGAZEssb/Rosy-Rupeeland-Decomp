#include "tingle/types.h"

/*
 * Overlay 2 numeric display update. This recovered helper maps an integer to
 * seven digit sprites and controls two additional magnitude indicators.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay002ValueDisplayState {
    u8 field_000[0x18];
    void *digit_018[7];
    u8 field_034[0x38];
    void *millionIndicator_06c;
    void *thousandIndicator_070;
    u8 field_074[0x1c];
    s32 enabled_090;
} Overlay002ValueDisplayState;

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteState_SetAnimationIndex(void *sprite, u8 digit);
#ifdef __cplusplus
}
#endif

/*
 * Hide both magnitude indicators first. If enabled_090 is zero, hide all seven
 * digit sprites and return. Otherwise reveal both indicators for values at
 * least 1,000,000, or only the thousand indicator for values at least 1,000.
 * Extract seven decimal digits using descending divisors from 10,000,000,
 * suppress leading zero sprites except the final position, and pass each shown
 * digit to GraphicsSpriteState_SetAnimationIndex. Returns no value; sprite flags and glyph state change.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov002_021fba1c(Overlay002ValueDisplayState *state, s32 value)
{
    s32 divisor;
    s32 i;
    s32 started;

    FIELD(u16, state->millionIndicator_06c, 0x24) |= 4;
    FIELD(u16, state->thousandIndicator_070, 0x24) |= 4;
    if (state->enabled_090 == 0) {
        for (i = 0; i < 7; i++) {
            FIELD(u16, state->digit_018[i], 0x24) |= 4;
        }
        return;
    }
    if (value >= 1000000) {
        FIELD(u16, state->millionIndicator_06c, 0x24) &= ~4;
        FIELD(u16, state->thousandIndicator_070, 0x24) &= ~4;
    } else if (value >= 1000) {
        FIELD(u16, state->thousandIndicator_070, 0x24) &= ~4;
    }
    divisor = 10000000;
    started = 0;
    for (i = 0; i < 7; i++) {
        s32 remainder = value % divisor;
        s32 digit;

        divisor /= 10;
        digit = remainder / divisor;
        if (digit != 0 || started != 0 || i == 6) {
            FIELD(u16, state->digit_018[i], 0x24) &= ~4;
            GraphicsSpriteState_SetAnimationIndex(state->digit_018[i], (u8)digit);
            started = 1;
        } else {
            FIELD(u16, state->digit_018[i], 0x24) |= 4;
        }
    }
}
