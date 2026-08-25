#include "tingle/types.h"

/*
 * Overlay 2 selected-icon release. This recovered helper refreshes the numeric
 * display and reverses the hit-test routine's two-pixel icon displacement.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay002SelectedIconReleaseState {
    u8 field_000[0x34];
    void *icon_034[14];
    u8 field_06c[0x1c];
    s32 value_088;
    s32 selectedIndex_08c;
} Overlay002SelectedIconReleaseState;

#ifdef __cplusplus
extern "C" {
#endif
extern void Overlay002_SetDisplayedValue(Overlay002SelectedIconReleaseState *state,
                                 s32 value);
#ifdef __cplusplus
}
#endif

/*
 * Redisplay value_088, then load icon_034[selectedIndex_08c] and subtract two
 * from its signed Y halfword at +0x2E. Its X halfword at +0x2C is rewritten
 * unchanged to preserve the original access pattern. Returns no value; sprite
 * and display state are mutated, with no direct hardware access.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov002_021fbd64(Overlay002SelectedIconReleaseState *state)
{
    void *sprite;
    s16 x;
    s16 y;

    Overlay002_SetDisplayedValue(state, state->value_088);
    sprite = state->icon_034[state->selectedIndex_08c];
    y = FIELD(s16, sprite, 0x2e);
    x = FIELD(s16, sprite, 0x2c);
    FIELD(u16, sprite, 0x2c) = x;
    FIELD(u16, sprite, 0x2e) = y - 2;
}
