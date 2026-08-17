#include "tingle/types.h"

/*
 * Overlay 1 controller-status forwarding. This recovered helper exposes the
 * final controller result used by clients of the grid subsystem.
 */

typedef struct Overlay001ControllerStatusState {
    u8 field_000[0x1bc];
    void *controller_1bc;
} Overlay001ControllerStatusState;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02094698(void *controller, const void *point);
#ifdef __cplusplus
}
#endif

/*
 * Pass controller_1bc and the borrowed touch point to func_02094698 and return
 * its result unchanged. The exact status meaning and callee side effects remain
 * unconfirmed; this wrapper changes no other state and performs no direct
 * hardware access.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov001_021fcc44(Overlay001ControllerStatusState *state,
                         const void *point)
{
    return func_02094698(state->controller_1bc, point);
}
