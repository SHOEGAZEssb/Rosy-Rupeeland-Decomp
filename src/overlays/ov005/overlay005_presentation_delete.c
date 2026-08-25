#include "tingle/types.h"

/*
 * Overlay 5 presentation deletion. This recovered deleting destructor performs
 * the complete presentation teardown and then frees the presentation object.
 */

#ifdef __cplusplus
extern "C" {
#endif
extern void *Overlay005_Presentation_Destroy(void *state);
extern void Heap_Free(void *memory);
#ifdef __cplusplus
}
#endif

/*
 * Apply the documented non-deleting teardown in Overlay005_Presentation_Destroy, including
 * controller/context/scene/resource release and sub-display restoration, then
 * pass state to Heap_Free and return the original pointer. The matching code
 * expands that teardown inline; this portable form expresses the equivalent
 * ownership boundary and performs no additional hardware access itself.
 */
#ifdef __cplusplus
extern "C"
#endif
void *Overlay005_Presentation_Delete(void *state)
{
    Overlay005_Presentation_Destroy(state);
    Heap_Free(state);
    return state;
}
