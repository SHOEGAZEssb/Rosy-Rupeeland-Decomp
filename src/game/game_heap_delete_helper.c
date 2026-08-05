#include "tingle/heap.h"

/* Provide the recovered deleting helper referenced by a nearby game-object vtable. */

/* Free the supplied allocation and return its former address. */
void *func_0201b24c(void *object)
{
    Heap_Free(object);
    return object;
}
