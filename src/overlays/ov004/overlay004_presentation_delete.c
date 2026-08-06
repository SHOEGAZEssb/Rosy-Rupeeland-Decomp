#include "tingle/types.h"

/*
 * Overlay 4 deleting destruction. This recovered entry point performs the
 * presentation teardown and then frees the object allocation itself.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_ov004_021fb868(void *state);
extern void Heap_Free(void *allocation);
#ifdef __cplusplus
}
#endif

/*
 * Invoke the documented non-deleting destructor for state, pass state to
 * Heap_Free, and return the original pointer. The matching implementation
 * expands the destructor body inline as emitted by the original compiler.
 * Resource/sound cleanup and heap effects occur through those callees.
 */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov004_021fb8e4(void *state)
{
    func_ov004_021fb868(state);
    Heap_Free(state);
    return state;
}
