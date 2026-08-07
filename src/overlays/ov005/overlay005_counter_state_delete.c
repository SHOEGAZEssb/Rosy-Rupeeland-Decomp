#include "tingle/types.h"

/*
 * Overlay 5 counter-state deletion. This recovered deleting destructor restores
 * the local descriptor, delegates teardown, and frees the counter object.
 */

typedef struct Overlay005CounterState {
    const void *descriptor_000;
} Overlay005CounterState;

#ifdef __cplusplus
extern "C" {
#endif
extern const u8 data_ov005_021fcab0[];
extern void func_02095308(void *state);
extern void Heap_Free(void *memory);
#ifdef __cplusplus
}
#endif

/*
 * Install data_ov005_021fcab0 at +0x00, invoke func_02095308(state), pass
 * state to Heap_Free, and return the original pointer. Teardown and allocator
 * effects are delegated; no direct hardware access occurs.
 */
#ifdef __cplusplus
extern "C"
#endif
Overlay005CounterState *func_ov005_021fc8b0(Overlay005CounterState *state)
{
    state->descriptor_000 = data_ov005_021fcab0;
    func_02095308(state);
    Heap_Free(state);
    return state;
}
