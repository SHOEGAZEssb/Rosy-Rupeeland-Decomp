#include "tingle/types.h"

/* Constructors forward the borrowed spawn descriptor through every base. */

/* Recovered lifecycle wrappers for an animation-sequenced impulse actor subclass. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *TrackedResourceActorImpulse_InitBase(void *actor, const void *descriptor);
extern void *TrackedResourceActor_Destroy(void *actor);
extern void Heap_Free(void *allocation);
extern u32 gTrackedResourceActorType27Vtable[];
#ifdef __cplusplus
}
#endif

/*
 * Input is subclass storage. Constructs the impulse-oriented parent through
 * TrackedResourceActorImpulse_InitBase, installs vtable gTrackedResourceActorType27Vtable, and returns the same storage.
 * Engine-owned fields may be initialized; no direct hardware access occurs.
 */
void *TrackedResourceActorType27_Init(void *actor, const void *descriptor)
{
    TrackedResourceActorImpulse_InitBase(actor, descriptor);
    *(u32 **)actor = gTrackedResourceActorType27Vtable;
    return actor;
}

/*
 * Input is a sequence-subclass instance. Runs tracked-resource base teardown
 * TrackedResourceActor_Destroy and returns the instance without freeing it. The direct base
 * call rather than an address-derived parent destructor is confirmed.
 */
void *TrackedResourceActorType27_DestroyComplete(void *actor)
{
    TrackedResourceActor_Destroy(actor);
    return actor;
}

/*
 * Input is a heap-allocated sequence-subclass instance. Runs tracked-resource
 * base teardown, frees the allocation, and returns its former address, which
 * must not be dereferenced. No direct hardware access occurs.
 */
void *TrackedResourceActorType27_DestroyAndFree(void *actor)
{
    TrackedResourceActor_Destroy(actor);
    Heap_Free(actor);
    return actor;
}
