#include "tingle/types.h"

/*
 * Overlay 0 controller command handling. This recovered helper prepares the
 * grid controller, submits one command value, and validates transient state
 * when the controller accepts it.
 */

typedef struct Overlay000ControllerCommandState {
    u8 field_000[0x26c];
    void *controller_26c;
} Overlay000ControllerCommandState;

#ifdef __cplusplus
extern "C" {
#endif
extern void InventoryScroll_SaveOrigins(void *controller);
extern s32 InventoryScroll_UpdateMarkerDrag(void *controller, s32 command);
extern void func_ov000_021fc3c0(Overlay000ControllerCommandState *state);
#ifdef __cplusplus
}
#endif

/*
 * Prepare controller_26c with InventoryScroll_SaveOrigins, submit command to InventoryScroll_UpdateMarkerDrag,
 * and return 0 if it is rejected. On acceptance, validate the owner's attached
 * transient record and return 1. The controller callees own any presentation
 * or input-state effects; this wrapper does not directly access hardware.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov000_021fc560(Overlay000ControllerCommandState *state, s32 command)
{
    InventoryScroll_SaveOrigins(state->controller_26c);
    if (!InventoryScroll_UpdateMarkerDrag(state->controller_26c, command)) {
        return 0;
    }
    func_ov000_021fc3c0(state);
    return 1;
}
