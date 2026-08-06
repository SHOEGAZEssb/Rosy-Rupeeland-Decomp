#include "tingle/heap.h"

/* Recovered destructor variants for the table-configured extended actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_0203e494(void *actor);
#ifdef __cplusplus
}
#endif

/* Invoke base destructor func_0203e494 and return self; actor state is torn down. */
void *func_02044698(void *self)
{
    func_0203e494(self);
    return self;
}

/*
 * Invoke base destructor func_0203e494, free self, and return the original
 * pointer value. Actor storage becomes invalid after the heap operation.
 */
void *func_020446ac(void *self)
{
    func_0203e494(self);
    Heap_Free(self);
    return self;
}
