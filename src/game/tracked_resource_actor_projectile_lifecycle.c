#include "tingle/types.h"

/* Constructors forward the borrowed spawn descriptor through every base. */

/* Recovered lifecycle wrappers for a projectile-like tracked-resource actor variant. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *TrackedResourceActor_Init(void *actor, const void *descriptor);
extern void *TrackedResourceActor_Destroy(void *actor);
extern void Heap_Free(void *allocation);
extern u32 gTrackedResourceActorType24Vtable[];
#ifdef __cplusplus
}
#endif

/*
 * Input is variant storage. Constructs the tracked-resource base, installs
 * vtable gTrackedResourceActorType24Vtable, and returns the same storage. Engine-owned fields may
 * be initialized; hardware is not accessed directly.
 */
void *TrackedResourceActorType24_Init(void *actor, const void *descriptor)
{
    TrackedResourceActor_Init(actor, descriptor);
    *(u32 **)actor = gTrackedResourceActorType24Vtable;
    return actor;
}

/*
 * Input is a variant instance. Runs tracked-resource base teardown and returns
 * the same instance without freeing it. Engine resources may be released.
 */
void *TrackedResourceActorType24_DestroyComplete(void *actor)
{
    TrackedResourceActor_Destroy(actor);
    return actor;
}

/*
 * Input is a heap-allocated variant instance. Runs base teardown, frees the
 * allocation, and returns its former address. The result must not be
 * dereferenced; no direct hardware access occurs.
 */
void *TrackedResourceActorType24_DestroyAndFree(void *actor)
{
    TrackedResourceActor_Destroy(actor);
    Heap_Free(actor);
    return actor;
}
