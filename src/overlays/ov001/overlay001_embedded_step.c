#include "tingle/types.h"

/*
 * Overlay 1 embedded-state step handling. This recovered helper polls the
 * column controller at offset 0x1C0 and validates transient state on success.
 */

typedef struct Overlay001EmbeddedStepState {
    u8 field_000[0x1c0];
    u8 embedded_1c0[1];
} Overlay001EmbeddedStepState;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 IndexedSelectionController_AdvanceTransition(void *embeddedState);
extern void func_ov001_021fc1b8(Overlay001EmbeddedStepState *state);
#ifdef __cplusplus
}
#endif

/*
 * Poll the embedded object at state+0x1C0. Return 0 if no step completed;
 * otherwise validate the owner's transient record and return 1. Any state
 * effects occur through callees; no hardware is accessed directly.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov001_021fc2e4(Overlay001EmbeddedStepState *state)
{
    if (!IndexedSelectionController_AdvanceTransition(state->embedded_1c0)) {
        return 0;
    }
    func_ov001_021fc1b8(state);
    return 1;
}
