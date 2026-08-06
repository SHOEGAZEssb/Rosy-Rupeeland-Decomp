#include "tingle/types.h"

/*
 * Overlay 0 grid-step handling. This recovered helper polls the grid
 * controller and validates transient state after a successful step.
 */

typedef struct Overlay000GridStepState {
    u8 field_000[0x26c];
    void *controller_26c;
} Overlay000GridStepState;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02094758(void *controller);
extern void func_ov000_021fc3c0(Overlay000GridStepState *state);
#ifdef __cplusplus
}
#endif

/*
 * Poll controller_26c. Return FALSE immediately when it reports no completed
 * step; otherwise validate the state's attached transient record and return
 * TRUE. Any presentation-state effects occur in the two callees, with no
 * direct hardware access here.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov000_021fc424(Overlay000GridStepState *state)
{
    if (!func_02094758(state->controller_26c)) {
        return 0;
    }
    func_ov000_021fc3c0(state);
    return 1;
}
