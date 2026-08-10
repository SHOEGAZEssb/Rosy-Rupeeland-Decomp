#include "tingle/types.h"

/*
 * Overlay 2 icon hit testing. This recovered helper searches fourteen icon
 * sprites for a supplied point and confirms a hit after a two-pixel Y nudge.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay002IconHitState {
    u8 field_000[0x34];
    void *icon_034[14];
    u8 field_06c[0x0c];
    void *control_078;
    u8 field_07c[0x10];
    s32 selectedIndex_08c;
    u8 field_090[0x04];
    s32 phase_094;
} Overlay002IconHitState;

typedef struct Overlay002PointInput {
    u32 field_00;
    s32 x_04;
    s32 y_08;
} Overlay002PointInput;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02073aa8(void *sprite, s32 x, s32 y);
extern void GraphicsSpriteState_SetAnimationIndex(void *sprite, u8 value);
#ifdef __cplusplus
}
#endif

/*
 * Test the input coordinates against icons in index order. On a first hit,
 * increment that sprite's signed Y halfword at +0x2E by two and retest. A
 * confirmed second hit stores the index, sets phase_094 to four, and changes
 * control_078 to value 0x1C for indices zero through ten, then returns the
 * index. If the shifted retest fails, restore Y and stop; if no confirmed hit
 * exists, return -1. X is rewritten unchanged alongside each Y adjustment,
 * matching the original access pattern. Sprite effects occur through memory
 * and GraphicsSpriteState_SetAnimationIndex; there is no direct hardware access.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov002_021fbb68(Overlay002IconHitState *state,
                         const Overlay002PointInput *input)
{
    s32 i;

    for (i = 0; i < 14; i++) {
        void *sprite = state->icon_034[i];
        s16 x;
        s16 y;

        if (func_02073aa8(sprite, input->x_04, input->y_08) == 0) {
            continue;
        }
        x = FIELD(s16, sprite, 0x2c);
        y = FIELD(s16, sprite, 0x2e);
        FIELD(u16, sprite, 0x2c) = x;
        FIELD(u16, sprite, 0x2e) = y + 2;
        if (func_02073aa8(sprite, input->x_04, input->y_08) != 0) {
            state->selectedIndex_08c = i;
            state->phase_094 = 4;
            switch (state->selectedIndex_08c) {
            case 0: case 1: case 2: case 3: case 4: case 5:
            case 6: case 7: case 8: case 9: case 10:
                GraphicsSpriteState_SetAnimationIndex(state->control_078, 0x1c);
                break;
            }
            return i;
        }
        x = FIELD(s16, sprite, 0x2c);
        y = FIELD(s16, sprite, 0x2e);
        FIELD(u16, sprite, 0x2c) = x;
        FIELD(u16, sprite, 0x2e) = y - 2;
        break;
    }
    return -1;
}
