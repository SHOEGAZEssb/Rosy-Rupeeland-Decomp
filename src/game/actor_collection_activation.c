#include "tingle/actor_collection.h"

/*
 * Prune inactive actors and populate the collection's deferred-removal queue.
 * The routines also migrate a reserved type-seven actor into the ordinary
 * slot range while preserving relationship notifications.
 */

/*
 * Destroy the reserved slot-one actor when its has-target flag is clear, then
 * scan ordinary slots 2..slotLimit-1 and destroy each actor whose ordinary
 * retain-during-prune flag is clear. Reserved slot zero is never examined.
 * Removal updates relationships before the actor is destroyed and freed.
 */
void ActorCollection_DestroyUnretainedActors(ActorCollection *self)
{
    ActorCollectionActor *actor;
    s32 i;

    if (self->reservedTypeSevenActor &&
        !(((ActorCollectionType7ActorView *)self->reservedTypeSevenActor)
              ->targetStateFlags & ACTOR_COLLECTION_TYPE_SEVEN_HAS_TARGET_FLAG)) {
        actor = self->actors[ACTOR_COLLECTION_TYPE_SEVEN_SLOT];
        ActorCollection_UnregisterActor(self, actor);
        if (actor)
            actor->vtable->destroyAndFree(actor);
    }
    for (i = ACTOR_COLLECTION_FIRST_ORDINARY_SLOT; i < self->slotLimit; i++) {
        actor = self->actors[i];
        if (actor && !(actor->runtimeFlags &
                       ACTOR_COLLECTION_ORDINARY_RETAIN_DURING_PRUNE_FLAG)) {
            ActorCollection_UnregisterActor(self, actor);
            if (actor)
                actor->vtable->destroyAndFree(actor);
        }
    }
}

/*
 * If actor is the reserved type-seven actor, notify every related actor for
 * slot one, clear those matrix bytes, re-register actor into the ordinary
 * range, and clear the old reserved slot/pointer. Then publish actor in the
 * removal queue at its signed byte slot and set the queue-processing flag.
 */
void ActorCollection_QueueActorForRemoval(ActorCollection *self,
                                          ActorCollectionActor *actor)
{
    s32 i;

    if (actor->type == ACTOR_COLLECTION_RESERVED_TYPE_SEVEN &&
        self->reservedTypeSevenActor == actor) {
        for (i = 0; i < ACTOR_COLLECTION_SLOT_COUNT; i++) {
            if (self->actors[i] &&
                ActorPairStateMatrix_IsTracked(&self->pairStateMatrix,
                                               ACTOR_COLLECTION_TYPE_SEVEN_SLOT, i))
                ActorCollection_DispatchPairEnded(
                    (ActorPairCollection *)self,
                    (ActorPairActor *)self->actors[i],
                    (ActorPairActor *)actor);
            ActorPairStateMatrix_ClearPair(&self->pairStateMatrix,
                                           ACTOR_COLLECTION_TYPE_SEVEN_SLOT, i);
        }
        ActorCollection_RegisterActor(self, actor);
        self->actors[ACTOR_COLLECTION_TYPE_SEVEN_SLOT] = 0;
        self->reservedTypeSevenActor = 0;
    }
    self->removalQueue[actor->collectionSlot] = actor;
    self->flags |= ACTOR_COLLECTION_PROCESS_REMOVAL_QUEUE_FLAG;
}

/*
 * Publish every registered actor whose groupId equals group into its same
 * removal-queue slot. If at least one actor matched, set the queue-processing
 * flag.
 */
void ActorCollection_QueueGroupForRemoval(ActorCollection *self, s32 groupId)
{
    s32 i;
    s32 matches = 0;

    for (i = 0; i < self->slotLimit; i++) {
        ActorCollectionActor *actor = self->actors[i];
        if (actor && actor->groupId == groupId) {
            self->removalQueue[i] = actor;
            matches++;
        }
    }
    if (matches)
        self->flags |= ACTOR_COLLECTION_PROCESS_REMOVAL_QUEUE_FLAG;
}
