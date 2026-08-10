#include "tingle/types.h"

/*
 * Prune inactive actors and populate the collection's deferred-removal queue.
 * The routines also migrate a reserved type-seven actor into the ordinary
 * slot range while preserving relationship notifications.
 */
typedef struct CollectionActor CollectionActor;
typedef struct CollectionActorVTable {
    void *field_00;
    void (*destroy_04)(CollectionActor *self);
} CollectionActorVTable;
struct CollectionActor {
    CollectionActorVTable *vtable_00;
    u8 field_04[0x44];
    s8 slot_48;
    u8 field_49[4];
    u8 type_4d;
    u8 field_4e[2];
    s16 group_50;
    u8 field_52[0x7e];
    u32 flags_0d0;
    u8 field_0d4[0x194];
    u32 flags_268;
};
typedef struct ActorCollectionActivation {
    CollectionActor *actors_0000[128];
    void *relations_0200[5][128];
    CollectionActor *removalQueue_0c00[128];
    u8 field_0e00[0x2074];
    s32 slotLimit_2e74;
    u32 flags_2e78;
    CollectionActor *specialActor_2e7c;
    CollectionActor *secondaryActor_2e80;
} ActorCollectionActivation;

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorCollection_RegisterActor(ActorCollectionActivation *, CollectionActor *);
extern void ActorCollection_UnregisterActor(ActorCollectionActivation *, CollectionActor *);
extern u8 ActorPairMatrix_Get(const u8 *, s32, s32);
extern void ActorPairMatrix_Clear(u8 *, s32, s32);
extern void func_0202ec74(ActorCollectionActivation *, CollectionActor *,
                          CollectionActor *);
#ifdef __cplusplus
}
#endif

/*
 * Destroy the reserved slot-one actor when flags_268 bit 0x10 is clear, then
 * scan ordinary slots 2..slotLimit_2e74-1 and destroy each actor whose
 * flags_0d0 bit 0x100000 is clear. Reserved slot zero is never examined.
 * Removal updates relationships before the actor's vtable destructor runs.
 */
void func_0202d3cc(ActorCollectionActivation *self)
{
    CollectionActor *actor;
    s32 i;

    if (self->secondaryActor_2e80 &&
        !(self->secondaryActor_2e80->flags_268 & 0x10)) {
        actor = self->actors_0000[1];
        ActorCollection_UnregisterActor(self, actor);
        if (actor)
            actor->vtable_00->destroy_04(actor);
    }
    for (i = 2; i < self->slotLimit_2e74; i++) {
        actor = self->actors_0000[i];
        if (actor && !(actor->flags_0d0 & 0x100000)) {
            ActorCollection_UnregisterActor(self, actor);
            if (actor)
                actor->vtable_00->destroy_04(actor);
        }
    }
}

/*
 * If actor is the reserved type-seven actor, notify every related actor for
 * slot one, clear those matrix bytes, re-register actor into the ordinary
 * range, and clear the old reserved slot/pointer. Then publish actor in
 * removalQueue_0c00 at its signed byte slot and set flags_2e78 bit zero.
 */
void ActorCollection_QueueActorForRemoval(ActorCollectionActivation *self, CollectionActor *actor)
{
    s32 i;

    if (actor->type_4d == 7 && self->secondaryActor_2e80 == actor) {
        for (i = 0; i < 128; i++) {
            if (self->actors_0000[i] &&
                ActorPairMatrix_Get((u8 *)self + 0x0e34, 1, i))
                func_0202ec74(self, self->actors_0000[i], actor);
            ActorPairMatrix_Clear((u8 *)self + 0x0e34, 1, i);
        }
        ActorCollection_RegisterActor(self, actor);
        self->actors_0000[1] = 0;
        self->secondaryActor_2e80 = 0;
    }
    self->removalQueue_0c00[actor->slot_48] = actor;
    self->flags_2e78 |= 1;
}

/*
 * Publish every registered actor whose group_50 equals group into its same
 * removal-queue slot. If at least one actor matched, set flags_2e78 bit zero.
 */
void ActorCollection_QueueGroupForRemoval(ActorCollectionActivation *self, s32 group)
{
    s32 i;
    s32 matches = 0;

    for (i = 0; i < self->slotLimit_2e74; i++) {
        CollectionActor *actor = self->actors_0000[i];
        if (actor && actor->group_50 == group) {
            self->removalQueue_0c00[i] = actor;
            matches++;
        }
    }
    if (matches)
        self->flags_2e78 |= 1;
}
