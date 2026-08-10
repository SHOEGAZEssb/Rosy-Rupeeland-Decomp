#include "tingle/types.h"

/*
 * Overlay 0 presentation close/reset helper. The recovered routine optionally
 * schedules a fixed owner animation, then resets the presentation, sprite
 * owner, and secondary embedded resource regardless of that option.
 */

typedef struct Overlay000PresentationState {
    void *owner_00;
    void *spriteOwner_04;
    u8 resource_08[0x0c];
    u8 resource_14[0x0c];
    u8 rendererState_20[0x24];
    void *presentation_44;
} Overlay000PresentationState;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02071f38(void *resource);
extern void GraphicsSpriteGroup_Clear(void *owner);
extern void GraphicsSpriteCanvas_FillRect(void *owner, s32 value1, s32 value2, s32 value3,
                          s32 value4, s32 value5);
extern void func_02093998(void *presentation);
extern void func_020939d8(void *presentation);
#ifdef __cplusplus
}
#endif

/*
 * If startAnimation is nonzero, notify presentation_44 and submit the fixed
 * parameter tuple (0x5C,0x34,0xDC,0x54,0) to owner_00. Then reset
 * presentation_44, spriteOwner_04, and resource_14. Returns nothing; helper
 * calls mutate presentation and graphics state without direct hardware access.
 */
#ifdef __cplusplus
extern "C"
#endif
void func_ov000_021fb890(Overlay000PresentationState *state,
                         s32 startAnimation)
{
    if (startAnimation != 0) {
        func_020939d8(state->presentation_44);
        GraphicsSpriteCanvas_FillRect(state->owner_00, 0x5c, 0x34, 0xdc, 0x54, 0);
    }
    func_02093998(state->presentation_44);
    GraphicsSpriteGroup_Clear(state->spriteOwner_04);
    func_02071f38(state->resource_14);
}
