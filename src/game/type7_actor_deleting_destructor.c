#include "tingle/heap.h"

/* Recovered deleting-destructor form for the type-seven actor. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *Type7Actor_Destroy(void *actor);
#ifdef __cplusplus
}
#endif

/*
 * Perform the complete type-seven teardown documented by Type7Actor_Destroy,
 * free self through Heap_Free, and return the original pointer value. The
 * retail implementation spells out the teardown rather than calling
 * Type7Actor_Destroy. Actor storage becomes invalid and all state effects of
 * Type7Actor_Destroy occur.
 */
void *Type7Actor_DestroyAndFree(void *self)
{
    Type7Actor_Destroy(self);
    Heap_Free(self);
    return self;
}
