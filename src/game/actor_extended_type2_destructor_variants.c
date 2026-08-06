#include "tingle/heap.h"
#include "tingle/types.h"

/* Expose the deleting and duplicate non-deleting extended type-two destructors. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_0203e298(void *self);
#ifdef __cplusplus
}
#endif

/*
 * Perform the complete teardown documented for func_0203e298, then free self
 * and return its original pointer value. Heap, optional child, helper, vector,
 * and base actor state is released. The matching fallback retains the expanded
 * retail destructor body rather than this portable delegation.
 */
void *func_0203e3b4(void *self)
{
    func_0203e298(self);
    Heap_Free(self);
    return self;
}

/*
 * Perform and return the same non-deleting teardown as func_0203e298. The
 * retail binary duplicates that function body; the matching fallback preserves
 * it while this portable implementation uses the documented equivalent.
 */
void *func_0203e494(void *self)
{
    return func_0203e298(self);
}
