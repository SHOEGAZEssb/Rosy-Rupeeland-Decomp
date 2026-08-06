#include "tingle/types.h"

/*
 * Overlay 1 controller-query forwarding. This recovered helper exposes one row
 * controller result through the containing grid state.
 */

typedef struct Overlay001ControllerQueryState {
    u8 field_000[0x1bc];
    void *controller_1bc;
} Overlay001ControllerQueryState;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02093ffc(void *controller);
#ifdef __cplusplus
}
#endif

/*
 * Pass controller_1BC to func_02093ffc and return its result unchanged. The
 * query meaning and callee effects remain unconfirmed; this wrapper changes no
 * other state and performs no direct hardware access.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov001_021fc240(Overlay001ControllerQueryState *state)
{
    return func_02093ffc(state->controller_1bc);
}
