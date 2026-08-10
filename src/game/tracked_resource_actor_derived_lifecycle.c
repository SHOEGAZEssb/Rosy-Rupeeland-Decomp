#include "tingle/types.h"

/* Recovered construction and destruction wrappers for a tracked-resource actor subclass. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *TrackedResourceActor_Init(void *actor);
extern void *TrackedResourceActor_Destroy(void *actor);
extern void Heap_Free(void *allocation);
extern u32 gTrackedResourceActorType21Vtable[];
#ifdef __cplusplus
}
#endif

/*
 * Input is subclass storage. Constructs the tracked-resource base, installs
 * vtable gTrackedResourceActorType21Vtable, and returns the same storage. Engine-owned fields may
 * be initialized; no direct hardware access occurs.
 */
void *TrackedResourceActorType21_InitBase(void *actor)
{
    TrackedResourceActor_Init(actor);
    *(u32 **)actor = gTrackedResourceActorType21Vtable;
    return actor;
}

/*
 * Input is subclass storage. This second recovered construction entry performs
 * the same base construction and vtable installation as TrackedResourceActorType21_InitBase; the
 * distinct call-site role is not yet known. Returns the supplied storage.
 */
void *TrackedResourceActorType21_Init(void *actor)
{
    TrackedResourceActor_Init(actor);
    *(u32 **)actor = gTrackedResourceActorType21Vtable;
    return actor;
}

/*
 * Input is a subclass instance. Runs the tracked-resource base teardown and
 * returns the same instance without freeing it. Engine-owned resources may be
 * released; no direct hardware access occurs.
 */
void *TrackedResourceActorType21_DestroyComplete(void *actor)
{
    TrackedResourceActor_Destroy(actor);
    return actor;
}

/*
 * Input is a heap-allocated subclass instance. Runs base teardown, frees the
 * allocation through Heap_Free, and returns the original address value. The
 * returned pointer is not safe to dereference after this call.
 */
void *TrackedResourceActorType21_DestroyAndFree(void *actor)
{
    TrackedResourceActor_Destroy(actor);
    Heap_Free(actor);
    return actor;
}

/*
 * Input is a subclass instance. Runs the same non-freeing base teardown as
 * TrackedResourceActorType21_DestroyComplete and returns the instance; its distinct call-site role remains
 * unconfirmed. No direct hardware access occurs.
 */
void *TrackedResourceActorType21_Destroy(void *actor)
{
    TrackedResourceActor_Destroy(actor);
    return actor;
}
