#include "tingle/heap.h"

/* Provide the signed-16 bounds-center deleting destructor from its vtable. */

/* Free the supplied allocation and return its now-dangling former address. */
void *S16BoundsCenter_DestroyAndFree(void *object)
{
    Heap_Free(object);
    return object;
}
