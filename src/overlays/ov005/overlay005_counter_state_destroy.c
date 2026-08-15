#include "tingle/types.h"

/*
 * Overlay 5 counter-state destruction. This recovered wrapper restores the
 * local descriptor and delegates teardown to the inherited implementation.
 */

typedef struct Overlay005CounterState {
    const void *descriptor_000;
} Overlay005CounterState;

#ifdef __cplusplus
extern "C" {
#endif
extern const u8 data_ov005_021fcab0[];
extern void PresentationList_DeleteAll(void *state);
#ifdef __cplusplus
}
#endif

/*
 * Install data_ov005_021fcab0 at +0x00, call PresentationList_DeleteAll(state), and return
 * state. All observable teardown and ownership effects are delegated to that
 * callee; this wrapper performs no direct hardware access.
 */
#ifdef __cplusplus
extern "C"
#endif
Overlay005CounterState *func_ov005_021fb84c(Overlay005CounterState *state)
{
    state->descriptor_000 = data_ov005_021fcab0;
    PresentationList_DeleteAll(state);
    return state;
}
