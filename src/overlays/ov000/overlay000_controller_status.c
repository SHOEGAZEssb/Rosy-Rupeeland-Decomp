#include "tingle/types.h"

/*
 * Overlay 0 controller-status forwarding. This recovered helper exposes the
 * final controller result used by clients of the grid subsystem.
 */

typedef struct Overlay000ControllerStatusState {
    u8 field_000[0x26c];
    void *controller_26c;
} Overlay000ControllerStatusState;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 InventoryScroll_TestMarkerHit(void *controller);
#ifdef __cplusplus
}
#endif

/*
 * Pass controller_26c to InventoryScroll_TestMarkerHit and return its result unchanged. The
 * exact status meaning and callee side effects remain unconfirmed; this wrapper
 * changes no other state and performs no direct hardware access.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov000_021fccfc(Overlay000ControllerStatusState *state)
{
    return InventoryScroll_TestMarkerHit(state->controller_26c);
}
