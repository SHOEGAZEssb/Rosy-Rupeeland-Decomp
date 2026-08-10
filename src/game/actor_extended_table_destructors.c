#include "tingle/heap.h"

/* Recovered destructor variants for the table-configured extended actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *ActorExtendedType2_Destroy(void *actor);
#ifdef __cplusplus
}
#endif

/* Invoke base destructor ActorExtendedType2_Destroy and return self; actor state is torn down. */
void *func_02044698(void *self)
{
    ActorExtendedType2_Destroy(self);
    return self;
}

/*
 * Invoke base destructor ActorExtendedType2_Destroy, free self, and return the original
 * pointer value. Actor storage becomes invalid after the heap operation.
 */
void *func_020446ac(void *self)
{
    ActorExtendedType2_Destroy(self);
    Heap_Free(self);
    return self;
}
