#include "tingle/types.h"

/*
 * Overlay 1 controller action handling. This recovered helper attempts a
 * primary action, then an argument-driven fallback, with shared sound feedback.
 */

typedef struct Overlay001ControllerActionState {
    u8 field_000[0x1bc];
    void *controller_1bc;
} Overlay001ControllerActionState;

#ifdef __cplusplus
extern "C" {
#endif
extern void *gSoundContext;
extern s32 InventoryScroll_TestUpperArrowPress(void *controller, const void *point);
extern s32 InventoryScroll_PageUp(void *controller);
extern s32 InventoryScroll_TestLowerArrowPress(void *controller, const void *point);
extern s32 InventoryScroll_PageDown(void *controller);
extern void Sound_Play(void *context, s32 channel, s32 soundId);
#ifdef __cplusplus
}
#endif

/*
 * Try InventoryScroll_TestUpperArrowPress with the borrowed touch point first. On success, run
 * InventoryScroll_PageUp and play sound 0x16 on channel zero only when it returns zero.
 * If the primary action fails, try InventoryScroll_TestLowerArrowPress with the same touch point,
 * using InventoryScroll_PageDown for the equivalent
 * sound gate. Return one for either accepted action and zero when both fail.
 * Sound playback is the only confirmed external effect beyond controller state.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov001_021fcb60(Overlay001ControllerActionState *state,
                         const void *point)
{
    if (InventoryScroll_TestUpperArrowPress(state->controller_1bc, point) != 0) {
        if (InventoryScroll_PageUp(state->controller_1bc) == 0) {
            Sound_Play(gSoundContext, 0, 0x16);
        }
    } else if (InventoryScroll_TestLowerArrowPress(state->controller_1bc, point) != 0) {
        if (InventoryScroll_PageDown(state->controller_1bc) == 0) {
            Sound_Play(gSoundContext, 0, 0x16);
        }
    } else {
        return 0;
    }
    return 1;
}
