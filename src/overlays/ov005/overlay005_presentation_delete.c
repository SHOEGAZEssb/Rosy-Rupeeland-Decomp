#include "tingle/types.h"

/*
 * Overlay 5 presentation deletion. This recovered deleting destructor performs
 * the complete presentation teardown and then frees the presentation object.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_ov005_021fc110(void *state);
extern void Heap_Free(void *memory);
#ifdef __cplusplus
}
#endif

/*
 * Apply the documented non-deleting teardown in func_ov005_021fc110, including
 * controller/context/scene/resource release and sub-display restoration, then
 * pass state to Heap_Free and return the original pointer. The matching code
 * expands that teardown inline; this portable form expresses the equivalent
 * ownership boundary and performs no additional hardware access itself.
 */
#ifdef __cplusplus
extern "C"
#endif
void *func_ov005_021fc1c0(void *state)
{
    func_ov005_021fc110(state);
    Heap_Free(state);
    return state;
}
