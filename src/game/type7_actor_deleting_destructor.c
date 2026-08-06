#include "tingle/heap.h"

/* Recovered deleting-destructor form for the type-seven actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *func_02045724(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Perform the complete type-seven teardown documented by func_02045724, free
 * self through Heap_Free, and return the original pointer value. The retail
 * implementation spells out the teardown rather than calling func_02045724.
 * Actor storage becomes invalid and all state effects of func_02045724 occur.
 */
void *func_02045878(void *self)
{
    func_02045724(self);
    Heap_Free(self);
    return self;
}
