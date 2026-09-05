#include "tingle/types.h"

/* Constructors forward the borrowed spawn descriptor through every base. */

/* Recovered lifecycle wrappers for a timed tracked-resource actor variant. */

#ifdef __cplusplus
extern "C" {
#endif
extern void *TrackedResourceActor_Init(void *actor, const void *descriptor);
extern void *TrackedResourceActor_Destroy(void *actor);
extern void Heap_Free(void *allocation);
extern u32 gTrackedResourceActorType26Vtable[];
#ifdef __cplusplus
}
#endif

#define FIELD(type, object, offset) (*(type *)((u8 *)(object) + (offset)))

/*
 * Input is variant storage. Constructs the tracked-resource base, installs
 * vtable gTrackedResourceActorType26Vtable, clears halfword 0x200, and returns the same storage.
 * Engine-owned fields may be initialized; no direct hardware access occurs.
 */
void *TrackedResourceActorType26_Init(void *actor, const void *descriptor)
{
    TrackedResourceActor_Init(actor, descriptor);
    *(u32 **)actor = gTrackedResourceActorType26Vtable;
    FIELD(u16, actor, 0x200) = 0;
    return actor;
}

/*
 * Input is a timed-variant instance. Runs tracked-resource base teardown and
 * returns the instance without freeing it. Engine resources may be released.
 */
void *TrackedResourceActorType26_DestroyComplete(void *actor)
{
    TrackedResourceActor_Destroy(actor);
    return actor;
}

/*
 * Input is a heap-allocated timed-variant instance. Runs base teardown, frees
 * the allocation, and returns its former address, which must not be
 * dereferenced. No direct hardware access occurs.
 */
void *TrackedResourceActorType26_DestroyAndFree(void *actor)
{
    TrackedResourceActor_Destroy(actor);
    Heap_Free(actor);
    return actor;
}
