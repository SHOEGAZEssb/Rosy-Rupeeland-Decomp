#include "tingle/types.h"

/*
 * Overlay 1 grid-step handling. This recovered helper polls the row controller
 * and validates transient state after a successful step.
 */

typedef struct Overlay001GridStepState {
    u8 field_000[0x1bc];
    void *controller_1bc;
} Overlay001GridStepState;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02094758(void *controller);
extern void func_ov001_021fc1b8(Overlay001GridStepState *state);
#ifdef __cplusplus
}
#endif

/*
 * Poll controller_1BC. Return 0 immediately when no step completes; otherwise
 * validate transient state and return 1. Controller/presentation effects occur
 * through callees, with no direct hardware access here.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov001_021fc214(Overlay001GridStepState *state)
{
    if (!func_02094758(state->controller_1bc)) {
        return 0;
    }
    func_ov001_021fc1b8(state);
    return 1;
}
