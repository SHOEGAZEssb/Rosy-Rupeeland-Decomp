#include "tingle/types.h"

/* Type-32 tracked actor: a sprite-free record effect dispatched on its update. */
extern u32 gTrackedResourceActorType32Vtable[];
extern u8 gActorRuntimeCollection[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *TrackedResourceActor_Init(void *actor);
extern void *TrackedResourceActor_Destroy(void *actor);
extern void Heap_Free(void *allocation);
extern void VecFx32Object_SetComponents(void *value, s32 x, s32 y, s32 z);
extern s32 ActorRuntimeCollection_GetPendingAttachmentFlag(const void *state);
extern void TrackedResourceActor_ScanNeighborhoodAndApplyRecordEffect(void *actor);
extern void *Actor_GetOwningCollection(void *actor);
extern void ActorCollection_QueueActorForRemoval(void *collection, void *actor);
extern void TrackedResourceActor_EmitRecordEffects(void *actor);
extern void TrackedResourceActor_DispatchTargetInteraction(void *actor, void *target);
#ifdef __cplusplus
}
#endif

/* Construct the tracked-resource base, install the type-32 vtable, and return
 * caller-owned actor storage. Base construction initializes owned resources. */
void *TrackedResourceActorType32_Init(void *actor)
{
    TrackedResourceActor_Init(actor);
    *(u32 **)actor = gTrackedResourceActorType32Vtable;
    return actor;
}

/* Release tracked-resource ownership without freeing actor storage; return it. */
void *TrackedResourceActorType32_Destroy(void *actor)
{
    TrackedResourceActor_Destroy(actor);
    return actor;
}

/* Tear down and free the actor; the returned former address is not usable. */
void *TrackedResourceActorType32_DestroyAndFree(void *actor)
{
    TrackedResourceActor_Destroy(actor);
    Heap_Free(actor);
    return actor;
}

/* The type-32 resource hook clears both sprite pointers without allocating a
 * presentation. It is invoked during base construction, before ownership. */
void TrackedResourceActorType32_ClearSpriteResources(void *actor)
{
    *(void **)((u8 *)actor + 0x1ec) = 0;
    *(void **)((u8 *)actor + 0x54) = 0;
}

/* Retain the borrowed effect record, clear the motion vector, and set flag 2.
 * Any extra virtual-call argument is unused; no resource is allocated. */
void TrackedResourceActorType32_SetRecord(void *actor, const void *record)
{
    u8 *self = (u8 *)actor;
    *(const void **)(self + 0x1fc) = record;
    VecFx32Object_SetComponents(self + 0x38, 0, 0, 0);
    *(u32 *)(self + 0x14) |= 2;
}

/* Invoke virtual effect-dispatch slot 0xc4 with a null target for this tick. */
void TrackedResourceActorType32_Update(void *actor)
{
    typedef void (*Dispatch)(void *, void *);
    Dispatch dispatch = *(Dispatch *)(*(u8 **)actor + 0xc4);
    dispatch(actor, 0);
}

/* Apply the record's neighborhood effect unless an attachment is pending,
 * queue actor removal, emit record effects, and forward the supplied target.
 * Removal is deferred to the collection; the actor remains live during calls. */
void TrackedResourceActorType32_DispatchEffect(void *actor, void *target)
{
    if (ActorRuntimeCollection_GetPendingAttachmentFlag(gActorRuntimeCollection) == 0)
        TrackedResourceActor_ScanNeighborhoodAndApplyRecordEffect(actor);
    ActorCollection_QueueActorForRemoval(Actor_GetOwningCollection(actor), actor);
    TrackedResourceActor_EmitRecordEffects(actor);
    TrackedResourceActor_DispatchTargetInteraction(actor, target);
}
