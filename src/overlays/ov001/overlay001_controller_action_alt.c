#include "tingle/types.h"

/*
 * Overlay 1 alternate controller action handling. This recovered helper tries
 * a second primary/fallback action pair and runs the corresponding follow-up.
 */

typedef struct Overlay001ControllerActionAltState {
    u8 field_000[0x1bc];
    void *controller_1bc;
} Overlay001ControllerActionAltState;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02094638(void *controller, const void *point);
extern s32 func_02093e3c(void *controller);
extern s32 func_02094668(void *controller, const void *point);
extern s32 func_02093e58(void *controller);
#ifdef __cplusplus
}
#endif

/*
 * Try func_02094638 with the borrowed touch point first and, on success, run
 * func_02093e3c. Otherwise try func_02094668 with that point and run
 * func_02093e58 on success. Return
 * one for either accepted action and zero when both fail; follow-up return
 * values are ignored. All observable state effects occur through the callees.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov001_021fcbf0(Overlay001ControllerActionAltState *state,
                         const void *point)
{
    if (func_02094638(state->controller_1bc, point) != 0) {
        func_02093e3c(state->controller_1bc);
    } else if (func_02094668(state->controller_1bc, point) != 0) {
        func_02093e58(state->controller_1bc);
    } else {
        return 0;
    }
    return 1;
}
