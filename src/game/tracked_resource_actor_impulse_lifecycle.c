#include "tingle/types.h"

/* Constructors forward the borrowed spawn descriptor through every base. */

/* Recovered lifecycle wrappers for an impulse-oriented tracked-resource actor variant. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *TrackedResourceActor_Init(void *actor, const void *descriptor);
extern void *TrackedResourceActor_Destroy(void *actor);
extern void Heap_Free(void *allocation);
extern u32 gTrackedResourceActorImpulseVtable[];
#ifdef __cplusplus
}
#endif

/*
 * Input is variant storage. Constructs the tracked-resource base, installs
 * vtable gTrackedResourceActorImpulseVtable, and returns the same storage. Engine-owned fields may
 * be initialized; no direct hardware access occurs.
 */
void *TrackedResourceActorImpulse_InitBase(void *actor, const void *descriptor)
{
    TrackedResourceActor_Init(actor, descriptor);
    *(u32 **)actor = gTrackedResourceActorImpulseVtable;
    return actor;
}

/*
 * Input is a variant instance. Runs tracked-resource base teardown and returns
 * the instance without freeing it. Engine resources may be released.
 */
void *TrackedResourceActorImpulse_DestroyComplete(void *actor)
{
    TrackedResourceActor_Destroy(actor);
    return actor;
}

/*
 * Input is a heap-allocated variant instance. Runs base teardown, frees the
 * allocation, and returns its former address, which must not be dereferenced.
 */
void *TrackedResourceActorImpulse_DestroyAndFree(void *actor)
{
    TrackedResourceActor_Destroy(actor);
    Heap_Free(actor);
    return actor;
}

/*
 * Input is a variant instance. This second recovered non-freeing teardown runs
 * the same base cleanup as TrackedResourceActorImpulse_DestroyComplete and returns the instance; its distinct
 * call-site role is not confirmed. No direct hardware access occurs.
 */
void *TrackedResourceActorImpulse_Destroy(void *actor)
{
    TrackedResourceActor_Destroy(actor);
    return actor;
}
