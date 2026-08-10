#include "tingle/types.h"

/*
 * Overlay 2 footer animation start. This recovered helper selects two footer
 * glyphs and starts the presentation's embedded animation state.
 */

typedef struct Overlay002FooterAnimationState {
    u8 field_000[0x7c];
    void *footer_07c;
    void *footer_080;
    u8 field_084[0x14];
    u8 animation_098[1];
} Overlay002FooterAnimationState;

#ifdef __cplusplus
extern "C" {
#endif
extern void GraphicsSpriteState_SetAnimationIndex(void *sprite, u8 value);
extern void func_02091bac(void *animation, s32 mode, s32 duration, s32 start,
                          s32 end);
#ifdef __cplusplus
}
#endif

/*
 * Set footer sprites at +0x7C and +0x80 to glyph values 0x1A and 0x1B, then
 * call func_02091bac for animation_098 with arguments (1, 0x18, 0, 0x10).
 * Returns no value. Sprite and animation effects occur through the callees;
 * the precise animation mode semantics remain unconfirmed.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov002_021fbdc0(Overlay002FooterAnimationState *state)
{
    GraphicsSpriteState_SetAnimationIndex(state->footer_07c, 0x1a);
    GraphicsSpriteState_SetAnimationIndex(state->footer_080, 0x1b);
    func_02091bac(state->animation_098, 1, 0x18, 0, 0x10);
}
