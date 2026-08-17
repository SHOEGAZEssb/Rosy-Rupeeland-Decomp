#include "tingle/types.h"

/*
 * Overlay 0 controller query forwarding. This recovered helper exposes one
 * controller result through the containing grid state.
 */

typedef struct Overlay000ControllerQueryState {
    u8 field_000[0x26c];
    void *controller_26c;
} Overlay000ControllerQueryState;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 InventoryScroll_UpdateInterpolation(void *controller);
#ifdef __cplusplus
}
#endif

/*
 * Pass controller_26c to InventoryScroll_UpdateInterpolation and return its result unchanged. The
 * meaning and side effects of that controller operation are not yet confirmed;
 * this wrapper performs no other state change or direct hardware access.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov000_021fc450(Overlay000ControllerQueryState *state)
{
    return InventoryScroll_UpdateInterpolation(state->controller_26c);
}
