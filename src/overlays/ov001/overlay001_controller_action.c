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
extern s32 func_020945c8(void *controller);
extern s32 func_02093e3c(void *controller);
extern s32 func_02094600(void *controller, s32 argument);
extern s32 func_02093e58(void *controller);
extern void Sound_Play(void *context, s32 channel, s32 soundId);
#ifdef __cplusplus
}
#endif

/*
 * Try func_020945c8 first. On success, run func_02093e3c and play sound 0x16
 * on channel zero only when it returns zero. If the primary action fails, try
 * func_02094600(controller, argument), using func_02093e58 for the equivalent
 * sound gate. Return one for either accepted action and zero when both fail.
 * Sound playback is the only confirmed external effect beyond controller state.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov001_021fcb60(Overlay001ControllerActionState *state, s32 argument)
{
    if (func_020945c8(state->controller_1bc) != 0) {
        if (func_02093e3c(state->controller_1bc) == 0) {
            Sound_Play(gSoundContext, 0, 0x16);
        }
    } else if (func_02094600(state->controller_1bc, argument) != 0) {
        if (func_02093e58(state->controller_1bc) == 0) {
            Sound_Play(gSoundContext, 0, 0x16);
        }
    } else {
        return 0;
    }
    return 1;
}
