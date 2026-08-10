#include "tingle/types.h"

/* Recovered lifecycle wrappers for a second tracked-resource actor variant. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *TrackedResourceActor_Init(void *actor);
extern void *TrackedResourceActor_Destroy(void *actor);
extern void TrackedResourceActorType22And25_CleanupSubtype19(void *actor);
extern void Heap_Free(void *allocation);
extern u32 gTrackedResourceActorType22And25Vtable[];
#ifdef __cplusplus
}
#endif

/*
 * Input is variant storage. Constructs the tracked-resource base, installs
 * vtable gTrackedResourceActorType22And25Vtable, and returns the same storage. Engine fields may change;
 * no direct hardware access occurs.
 */
void *TrackedResourceActorType22And25_Init(void *actor)
{
    TrackedResourceActor_Init(actor);
    *(u32 **)actor = gTrackedResourceActorType22And25Vtable;
    return actor;
}

/*
 * Input is a variant instance. Reinstalls its vtable, runs variant cleanup
 * TrackedResourceActorType22And25_CleanupSubtype19 and tracked-resource base teardown, then returns the instance
 * without freeing it. Cleanup can release engine resources.
 */
void *TrackedResourceActorType22And25_DestroyComplete(void *actor)
{
    *(u32 **)actor = gTrackedResourceActorType22And25Vtable;
    TrackedResourceActorType22And25_CleanupSubtype19(actor);
    TrackedResourceActor_Destroy(actor);
    return actor;
}

/*
 * Input is a heap-allocated variant instance. Performs the same variant and
 * base cleanup as TrackedResourceActorType22And25_DestroyComplete, frees the allocation, and returns its former
 * address. The result must not be dereferenced; no hardware is accessed here.
 */
void *TrackedResourceActorType22And25_DestroyAndFree(void *actor)
{
    *(u32 **)actor = gTrackedResourceActorType22And25Vtable;
    TrackedResourceActorType22And25_CleanupSubtype19(actor);
    TrackedResourceActor_Destroy(actor);
    Heap_Free(actor);
    return actor;
}
