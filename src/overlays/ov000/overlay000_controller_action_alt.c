#include "tingle/types.h"

/*
 * Overlay 0 alternate controller action handling. This recovered helper tries
 * a second primary/fallback action pair and runs their corresponding follow-up.
 */

typedef struct Overlay000ControllerActionAltState {
    u8 field_000[0x26c];
    void *controller_26c;
} Overlay000ControllerActionAltState;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02094638(void *controller);
extern s32 func_02093e3c(void *controller);
extern s32 func_02094668(void *controller, s32 argument);
extern s32 func_02093e58(void *controller);
#ifdef __cplusplus
}
#endif

/*
 * Try func_02094638 first and, on success, run func_02093e3c. Otherwise try
 * func_02094668(controller, argument) and run func_02093e58 on success. Return
 * 1 for either accepted action and 0 when both fail; follow-up return values are
 * ignored. All state effects occur through the controller callees.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov000_021fcca8(Overlay000ControllerActionAltState *state,
                         s32 argument)
{
    if (func_02094638(state->controller_26c) != 0) {
        func_02093e3c(state->controller_26c);
    } else if (func_02094668(state->controller_26c, argument) != 0) {
        func_02093e58(state->controller_26c);
    } else {
        return 0;
    }
    return 1;
}
