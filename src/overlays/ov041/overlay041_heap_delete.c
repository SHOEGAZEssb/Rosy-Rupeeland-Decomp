#include "tingle/types.h"

/*
 * Overlay 41 heap-deleting destructor wrapper. This recovered helper releases
 * an object through the shared heap API while preserving the original pointer
 * as its return value.
 */

extern "C" void Heap_Free(void *);

/*
 * Free object through Heap_Free and return the same pointer value. The pointed
 * storage becomes invalid; no hardware or other SDK state is changed directly.
 */
extern "C" void *func_ov041_02201058(void *object)
{
    Heap_Free(object);
    return object;
}
