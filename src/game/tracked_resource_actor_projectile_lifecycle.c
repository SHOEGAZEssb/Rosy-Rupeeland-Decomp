#include "tingle/types.h"

/* Recovered lifecycle wrappers for a projectile-like tracked-resource actor variant. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *TrackedResourceActor_Init(void *actor);
extern void *TrackedResourceActor_Destroy(void *actor);
extern void Heap_Free(void *allocation);
extern u32 data_020e2f7c[];
#ifdef __cplusplus
}
#endif

/*
 * Input is variant storage. Constructs the tracked-resource base, installs
 * vtable data_020e2f7c, and returns the same storage. Engine-owned fields may
 * be initialized; hardware is not accessed directly.
 */
void *func_0205135c(void *actor)
{
    TrackedResourceActor_Init(actor);
    *(u32 **)actor = data_020e2f7c;
    return actor;
}

/*
 * Input is a variant instance. Runs tracked-resource base teardown and returns
 * the same instance without freeing it. Engine resources may be released.
 */
void *func_0205137c(void *actor)
{
    TrackedResourceActor_Destroy(actor);
    return actor;
}

/*
 * Input is a heap-allocated variant instance. Runs base teardown, frees the
 * allocation, and returns its former address. The result must not be
 * dereferenced; no direct hardware access occurs.
 */
void *func_02051390(void *actor)
{
    TrackedResourceActor_Destroy(actor);
    Heap_Free(actor);
    return actor;
}
