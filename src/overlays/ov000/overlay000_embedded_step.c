#include "tingle/types.h"

/*
 * Overlay 0 embedded-state step handling. This recovered helper polls the
 * state embedded at offset 0x270 and validates transient grid state on success.
 */

typedef struct Overlay000EmbeddedStepState {
    u8 field_000[0x270];
    u8 embedded_270[1];
} Overlay000EmbeddedStepState;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 func_02093bdc(void *embeddedState);
extern void func_ov000_021fc3c0(Overlay000EmbeddedStepState *state);
#ifdef __cplusplus
}
#endif

/*
 * Poll the embedded object at state+0x270. Return 0 if it has not completed a
 * step; otherwise validate the owner's transient record and return 1. Any
 * presentation-state effects belong to the callees; hardware is not accessed
 * directly.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov000_021fc4fc(Overlay000EmbeddedStepState *state)
{
    if (!func_02093bdc(state->embedded_270)) {
        return 0;
    }
    func_ov000_021fc3c0(state);
    return 1;
}
