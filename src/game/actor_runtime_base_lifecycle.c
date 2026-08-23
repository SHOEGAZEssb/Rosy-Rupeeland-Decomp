#include "tingle/heap.h"
#include "tingle/types.h"

/* Release derived runtime actor attachments, resources, and value objects. */
typedef struct RuntimeActorLifecycle RuntimeActorLifecycle;
typedef struct ActorInteractionIcon ActorInteractionIcon;
typedef struct RuntimeActorLifecycleVTable {
    u8 field_00[0xbc];
    void (*releasePrimaryRenderAttachment_bc)(RuntimeActorLifecycle *);
} RuntimeActorLifecycleVTable;

struct RuntimeActorLifecycle {
    RuntimeActorLifecycleVTable *vtable_00;
    u8 field_04[0xa4];
    void *auxiliaryRenderAttachment_a8;
    u8 field_ac[0x134];
    ActorInteractionIcon *interactionIcon_1e0;
};

extern u8 data_020df040[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Actor_ReleaseSecondaryRenderAttachment(RuntimeActorLifecycle *);
extern void *Actor_GetOwningCollection(RuntimeActorLifecycle *);
extern void *ActorCollection_GetSpriteGroup(void *);
extern void GraphicsSpriteGroup_ReleaseState(void *, void *);
extern ActorInteractionIcon *ActorInteractionIcon_Destroy(ActorInteractionIcon *);
extern void VecFx32Stepper_Destroy(void *);
extern void GamePhaseActorScriptVm_Destroy(void *);
extern void VecFx32Object_Destroy(void *);
extern void *func_02030e08(void *);
#ifdef __cplusplus
}
#endif

static RuntimeActorLifecycle *destroyRuntimeActor(RuntimeActorLifecycle *self)
{
    void *auxiliaryAttachment;
    ActorInteractionIcon *interactionIcon;

    self->vtable_00 = (RuntimeActorLifecycleVTable *)data_020df040;
    self->vtable_00->releasePrimaryRenderAttachment_bc(self);
    Actor_ReleaseSecondaryRenderAttachment(self);
    auxiliaryAttachment = self->auxiliaryRenderAttachment_a8;
    if (auxiliaryAttachment)
        GraphicsSpriteGroup_ReleaseState(
            ActorCollection_GetSpriteGroup(Actor_GetOwningCollection(self)),
            auxiliaryAttachment);
    interactionIcon = self->interactionIcon_1e0;
    if (interactionIcon) {
        ActorInteractionIcon_Destroy(interactionIcon);
        Heap_Free(interactionIcon);
    }
    VecFx32Stepper_Destroy((u8 *)self + 0x198);
    GamePhaseActorScriptVm_Destroy((u8 *)self + 0xec);
    VecFx32Object_Destroy((u8 *)self + 0xb0);
    VecFx32Object_Destroy((u8 *)self + 0x98);
    VecFx32Object_Destroy((u8 *)self + 0x88);
    VecFx32Object_Destroy((u8 *)self + 0x78);
    func_02030e08(self);
    return self;
}

/*
 * Restore vtable data_020df040, invoke its offset-0xbc cleanup, release the
 * offset-0x58 attachment, unregister offset +0xa8, destroy/free the optional
 * interaction icon +0x1e0, then destroy resources +0x198/+0xec, vectors
 * +0xb0/+0x98/+0x88/+0x78, and the common base. Return self without freeing it.
 */
RuntimeActorLifecycle *func_020311bc(RuntimeActorLifecycle *self)
{
    return destroyRuntimeActor(self);
}

/*
 * Perform the full derived/base teardown, free self through Heap_Free, and
 * return its former address. The returned pointer no longer owns live storage.
 */
RuntimeActorLifecycle *func_02031260(RuntimeActorLifecycle *self)
{
    destroyRuntimeActor(self);
    Heap_Free(self);
    return self;
}

/*
 * Perform the same non-freeing teardown as func_020311bc. This separate
 * address-derived entry point returns self and preserves retail dispatch use.
 */
RuntimeActorLifecycle *func_0203130c(RuntimeActorLifecycle *self)
{
    return destroyRuntimeActor(self);
}

/*
 * Base actor vtable slot +0x10 ignores its borrowed actor and spawn descriptor,
 * changes no state, and returns no value.
 */
void Actor_InitializeFromDescriptorNoOp(void *actor, const void *descriptor)
{
    (void)actor;
    (void)descriptor;
}
