#include "tingle/types.h"

/* Constructors forward the borrowed spawn descriptor through every base. */

/* Recovered lifecycle wrappers for an orientation-driven tracked-resource actor variant. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *TrackedResourceActor_Init(void *actor, const void *descriptor);
extern void *TrackedResourceActor_Destroy(void *actor);
extern void Heap_Free(void *allocation);
extern u32 gTrackedResourceActorType28Vtable[];
#ifdef __cplusplus
}
#endif

/*
 * Input is variant storage. Constructs the tracked-resource base, installs
 * vtable gTrackedResourceActorType28Vtable, and returns the storage. Engine fields may be initialized.
 */
void *TrackedResourceActorType28_InitBase(void *actor, const void *descriptor)
{
    TrackedResourceActor_Init(actor, descriptor);
    *(u32 **)actor = gTrackedResourceActorType28Vtable;
    return actor;
}

/*
 * Input is variant storage. This second construction entry performs the same
 * base construction and vtable installation as TrackedResourceActorType28_InitBase; its distinct
 * call-site role is unknown. Returns the supplied storage.
 */
void *TrackedResourceActorType28_Init(void *actor, const void *descriptor)
{
    TrackedResourceActor_Init(actor, descriptor);
    *(u32 **)actor = gTrackedResourceActorType28Vtable;
    return actor;
}

/*
 * Input is a variant instance. Runs tracked-resource base teardown and returns
 * the instance without freeing it. Engine resources may be released.
 */
void *TrackedResourceActorType28_DestroyComplete(void *actor)
{
    TrackedResourceActor_Destroy(actor);
    return actor;
}

/*
 * Input is a heap-allocated variant instance. Runs base teardown, frees the
 * allocation, and returns its former address, which must not be dereferenced.
 */
void *TrackedResourceActorType28_DestroyAndFree(void *actor)
{
    TrackedResourceActor_Destroy(actor);
    Heap_Free(actor);
    return actor;
}

/*
 * Input is a variant instance. This second non-freeing teardown runs the same
 * base cleanup as TrackedResourceActorType28_DestroyComplete and returns the instance; its separate role is
 * unconfirmed. These lifecycle wrappers do not directly access hardware.
 */
void *TrackedResourceActorType28_Destroy(void *actor)
{
    TrackedResourceActor_Destroy(actor);
    return actor;
}
