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
extern s32 InventoryScroll_TestUpperArrowHold(void *controller);
extern s32 InventoryScroll_PageUp(void *controller);
extern s32 InventoryScroll_TestLowerArrowHold(void *controller, s32 argument);
extern s32 InventoryScroll_PageDown(void *controller);
#ifdef __cplusplus
}
#endif

/*
 * Try InventoryScroll_TestUpperArrowHold first and, on success, run InventoryScroll_PageUp. Otherwise try
 * InventoryScroll_TestLowerArrowHold(controller, argument) and run InventoryScroll_PageDown on success. Return
 * 1 for either accepted action and 0 when both fail; follow-up return values are
 * ignored. All state effects occur through the controller callees.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov000_021fcca8(Overlay000ControllerActionAltState *state,
                         s32 argument)
{
    if (InventoryScroll_TestUpperArrowHold(state->controller_26c) != 0) {
        InventoryScroll_PageUp(state->controller_26c);
    } else if (InventoryScroll_TestLowerArrowHold(state->controller_26c, argument) != 0) {
        InventoryScroll_PageDown(state->controller_26c);
    } else {
        return 0;
    }
    return 1;
}
