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
extern s32 InventoryScroll_TestUpperArrowHold(void *controller, const void *point);
extern s32 InventoryScroll_PageUp(void *controller);
extern s32 InventoryScroll_TestLowerArrowHold(void *controller, const void *point);
extern s32 InventoryScroll_PageDown(void *controller);
#ifdef __cplusplus
}
#endif

/*
 * Try InventoryScroll_TestUpperArrowHold with the borrowed touch point first and, on success, run
 * InventoryScroll_PageUp. Otherwise try InventoryScroll_TestLowerArrowHold with that point and run
 * InventoryScroll_PageDown on success. Return
 * one for either accepted action and zero when both fail; follow-up return
 * values are ignored. All observable state effects occur through the callees.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov001_021fcbf0(Overlay001ControllerActionAltState *state,
                         const void *point)
{
    if (InventoryScroll_TestUpperArrowHold(state->controller_1bc, point) != 0) {
        InventoryScroll_PageUp(state->controller_1bc);
    } else if (InventoryScroll_TestLowerArrowHold(state->controller_1bc, point) != 0) {
        InventoryScroll_PageDown(state->controller_1bc);
    } else {
        return 0;
    }
    return 1;
}
