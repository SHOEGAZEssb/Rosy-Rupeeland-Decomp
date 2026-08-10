#include "tingle/types.h"

/*
 * Overlay 1 presentation close/reset. This recovered helper optionally starts
 * a fixed animation, then resets the presentation and associated resources.
 */

typedef struct Overlay001PresentationCloseState {
    void *owner_00;
    void *spriteOwner_04;
    u8 resource_08[0x0c];
    u8 resource_14[0x0c];
    u8 rendererState_20[0x24];
    void *presentation_44;
} Overlay001PresentationCloseState;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02071f38(void *resource);
extern void func_02074058(void *owner);
extern void GraphicsSpriteCanvas_FillRect(void *owner, s32 first, s32 second, s32 third,
                          s32 fourth, s32 fifth);
extern void func_02093998(void *presentation);
extern void func_020939d8(void *presentation);
#ifdef __cplusplus
}
#endif

/*
 * If startAnimation is nonzero, notify presentation_44 and submit tuple
 * (0x5C,0x38,0xDC,0x58,0) to owner_00. Then reset presentation_44,
 * spriteOwner_04, and resource_14 unconditionally. Returns no value; graphics
 * and presentation effects occur through callees, not direct hardware access.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov001_021fb81c(Overlay001PresentationCloseState *state,
                         s32 startAnimation)
{
    if (startAnimation != 0) {
        func_020939d8(state->presentation_44);
        GraphicsSpriteCanvas_FillRect(state->owner_00, 0x5c, 0x38, 0xdc, 0x58, 0);
    }
    func_02093998(state->presentation_44);
    func_02074058(state->spriteOwner_04);
    func_02071f38(state->resource_14);
}
