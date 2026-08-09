#include "tingle/types.h"

/*
 * Overlay 49 point deletion. The recovered deleting hook releases caller-
 * supplied storage through the game heap.
 */

extern "C" void Heap_Free(void *allocation);

/*
 * Free `object` and return its former address identity. Heap state changes;
 * the returned pointer must not be dereferenced and no hardware effect occurs.
 */
extern "C" void *func_ov049_0220d304(void *object)
{
    Heap_Free(object);
    return object;
}
