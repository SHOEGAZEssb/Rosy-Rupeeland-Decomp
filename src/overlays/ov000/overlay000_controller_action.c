#include "tingle/types.h"

/*
 * Overlay 0 controller action handling. This recovered helper attempts a
 * primary action, then an argument-driven fallback, with shared sound feedback.
 */

typedef struct Overlay000ControllerActionState {
    u8 field_000[0x26c];
    void *controller_26c;
} Overlay000ControllerActionState;

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
 * on channel 0 only when it returns zero. If the primary action fails, try
 * func_02094600(controller, argument), using func_02093e58 for the equivalent
 * sound gate. Return 1 for either accepted action and 0 when both fail. Sound
 * playback is the only confirmed external effect beyond controller state.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov000_021fcc18(Overlay000ControllerActionState *state, s32 argument)
{
    if (func_020945c8(state->controller_26c) != 0) {
        if (func_02093e3c(state->controller_26c) == 0) {
            Sound_Play(gSoundContext, 0, 0x16);
        }
    } else if (func_02094600(state->controller_26c, argument) != 0) {
        if (func_02093e58(state->controller_26c) == 0) {
            Sound_Play(gSoundContext, 0, 0x16);
        }
    } else {
        return 0;
    }
    return 1;
}
