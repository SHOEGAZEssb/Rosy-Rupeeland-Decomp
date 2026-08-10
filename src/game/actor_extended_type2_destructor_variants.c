#include "tingle/heap.h"
#include "tingle/types.h"

/* Expose the deleting and duplicate non-deleting extended type-two destructors. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *ActorExtendedType2_DestroyComplete(void *self);
#ifdef __cplusplus
}
#endif

/*
 * Perform the complete teardown documented for ActorExtendedType2_DestroyComplete, then free self
 * and return its original pointer value. Heap, optional child, helper, vector,
 * and base actor state is released. The matching fallback retains the expanded
 * retail destructor body rather than this portable delegation.
 */
void *ActorExtendedType2_DestroyAndFree(void *self)
{
    ActorExtendedType2_DestroyComplete(self);
    Heap_Free(self);
    return self;
}

/*
 * Perform and return the same non-deleting teardown as ActorExtendedType2_DestroyComplete. The
 * retail binary duplicates that function body; the matching fallback preserves
 * it while this portable implementation uses the documented equivalent.
 */
void *ActorExtendedType2_Destroy(void *self)
{
    return ActorExtendedType2_DestroyComplete(self);
}
