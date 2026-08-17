#include "tingle/types.h"

/*
 * Overlay 1 controller-command handling. This recovered helper prepares the row
 * controller, submits a command, and validates transient state on acceptance.
 */

typedef struct Overlay001ControllerCommandState {
    u8 field_000[0x1bc];
    void *controller_1bc;
} Overlay001ControllerCommandState;

#ifdef __cplusplus
extern "C" {
#endif
extern void InventoryScroll_SaveOrigins(void *controller);
extern s32 InventoryScroll_UpdateMarkerDrag(void *controller, s32 command);
extern void func_ov001_021fc1b8(Overlay001ControllerCommandState *state);
#ifdef __cplusplus
}
#endif

/*
 * Prepare controller_1BC, submit command with InventoryScroll_UpdateMarkerDrag, and return 0 if it
 * is rejected. On acceptance, validate transient state and return 1. Controller
 * effects occur through callees; no hardware is accessed directly.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov001_021fc348(Overlay001ControllerCommandState *state, s32 command)
{
    InventoryScroll_SaveOrigins(state->controller_1bc);
    if (!InventoryScroll_UpdateMarkerDrag(state->controller_1bc, command)) {
        return 0;
    }
    func_ov001_021fc1b8(state);
    return 1;
}
