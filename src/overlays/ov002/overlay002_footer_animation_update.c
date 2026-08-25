#include "tingle/types.h"

/*
 * Overlay 2 footer animation update. This recovered helper advances the footer
 * transition, applies its output to a resource context, and restores glyphs.
 */

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

typedef struct Overlay002FooterAnimationUpdateState {
    u8 field_000[0x10];
    void *resourceA_010;
    u8 field_014[0x68];
    void *footer_07c;
    void *footer_080;
    u8 field_084[0x14];
    u8 animation_098[1];
} Overlay002FooterAnimationUpdateState;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02091c7c(void *animation, s32 channel);
extern s32 func_02091cf0(void *animation);
extern void GraphicsSpriteState_SetAnimationIndex(void *sprite, u8 value);
#ifdef __cplusplus
}
#endif

/*
 * Advance animation_098 channel one. Write zero and the returned animation
 * value to resourceA_010 offsets +0x18/+0x1C. If func_02091cf0 reports the
 * animation incomplete, return zero. On completion, restore footer glyphs
 * 0x1F/0x20 and return one. The callees own animation/sprite effects; this
 * routine performs no direct hardware access.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 Overlay002_UpdateFooterAnimation(Overlay002FooterAnimationUpdateState *state)
{
    s32 value = func_02091c7c(state->animation_098, 1);

    FIELD(s32, state->resourceA_010, 0x18) = 0;
    FIELD(s32, state->resourceA_010, 0x1c) = value;
    if (func_02091cf0(state->animation_098) == 0) {
        return 0;
    }
    GraphicsSpriteState_SetAnimationIndex(state->footer_07c, 0x1f);
    GraphicsSpriteState_SetAnimationIndex(state->footer_080, 0x20);
    return 1;
}
