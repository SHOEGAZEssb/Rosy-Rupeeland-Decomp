#include "tingle/actor_collection.h"

/*
 * Register and remove actors from the 128-slot collection. Actor types one
 * and seven have reserved slots/pointers, while ordinary actors use slots
 * 2..127. A packed upper-triangular byte matrix tracks pair relationships that
 * trigger an address-derived unlink callback during removal.
 */

/*
 * Install type-one actors in reserved slot zero and type-seven actors with
 * runtimeId equal to one in reserved slot one when vacant.
 * Otherwise reject duplicates, place the actor in the first empty ordinary
 * slot, increment actorCount, store the byte-sized slot index on the actor,
 * and extend slotLimit when necessary. Capacity exhaustion is not handled by
 * the recovered code and is assumed impossible.
 */
void ActorCollection_RegisterActor(ActorCollection *self,
                                   ActorCollectionActor *actor)
{
    s32 i;
    s32 freeIndex = -1;
    ActorCollectionActor **freeSlot = 0;

    if (actor->type == ACTOR_COLLECTION_RESERVED_TYPE_ONE) {
        actor->collectionSlot = ACTOR_COLLECTION_TYPE_ONE_SLOT;
        self->actors[ACTOR_COLLECTION_TYPE_ONE_SLOT] = actor;
        self->reservedTypeOneActor = actor;
        return;
    }
    if (actor->type == ACTOR_COLLECTION_RESERVED_TYPE_SEVEN &&
        actor->runtimeId == ACTOR_COLLECTION_TYPE_SEVEN_RESERVED_RUNTIME_ID &&
        self->reservedTypeSevenActor == 0) {
        actor->collectionSlot = ACTOR_COLLECTION_TYPE_SEVEN_SLOT;
        self->actors[ACTOR_COLLECTION_TYPE_SEVEN_SLOT] = actor;
        self->reservedTypeSevenActor = actor;
        return;
    }
    for (i = ACTOR_COLLECTION_FIRST_ORDINARY_SLOT;
         i < ACTOR_COLLECTION_SLOT_COUNT; i++) {
        if (self->actors[i] == actor)
            return;
        if (freeSlot == 0 && self->actors[i] == 0) {
            freeIndex = i;
            freeSlot = &self->actors[i];
        }
    }
    self->actorCount++;
    /* A full collection reaches this null write in the retail control flow. */
    *freeSlot = actor;
    actor->collectionSlot = (s8)freeIndex;
    if (self->slotLimit < freeIndex + 1)
        self->slotLimit = freeIndex + 1;
}

/*
 * Remove actor from its reserved or searched slot. Clear its removalQueue
 * entry, decrement the actor count, notify every remaining related actor
 * through ActorCollection_DispatchPairEnded, clear every matrix edge involving
 * the removed slot, and finally clear the actor slot. A missing actor causes
 * no state change.
 */
void ActorCollection_UnregisterActor(ActorCollection *self,
                                     ActorCollectionActor *actor)
{
    s32 index = -1;
    s32 i;

    if (actor->type == ACTOR_COLLECTION_RESERVED_TYPE_ONE) {
        self->reservedTypeOneActor = 0;
        index = ACTOR_COLLECTION_TYPE_ONE_SLOT;
    } else if (actor->type == ACTOR_COLLECTION_RESERVED_TYPE_SEVEN &&
               self->reservedTypeSevenActor == actor) {
        self->reservedTypeSevenActor = 0;
        index = ACTOR_COLLECTION_TYPE_SEVEN_SLOT;
    } else {
        for (i = 0; i < self->slotLimit; i++)
            if (self->actors[i] == actor)
                index = i;
    }
    if (index == -1)
        return;
    self->removalQueue[index] = 0;
    self->actorCount--;
    for (i = 0; i < ACTOR_COLLECTION_SLOT_COUNT; i++) {
        if (self->actors[i] &&
            ActorPairStateMatrix_IsTracked(&self->pairStateMatrix, index, i))
            ActorCollection_DispatchPairEnded(
                (ActorPairCollection *)self,
                (ActorPairActor *)self->actors[i],
                (ActorPairActor *)actor);
        ActorPairStateMatrix_ClearPair(&self->pairStateMatrix, index, i);
    }
    self->actors[index] = 0;
}

/*
 * Return the relationship byte for an unordered pair of slot indices. The
 * larger index is stored within a row selected by the smaller index. The
 * pre-column base is n*128 - n*(n+1)/2, so adding column n locates the first
 * stored entry in row n and all 128 rows occupy exactly 0x2040 bytes.
 */
u8 ActorPairStateMatrix_IsTracked(const ActorPairStateMatrix *matrix,
                                  s32 firstSlot, s32 secondSlot)
{
    s32 swap;
    if (secondSlot > firstSlot) {
        swap = firstSlot;
        firstSlot = secondSlot;
        secondSlot = swap;
    }
    return matrix->entries[firstSlot + secondSlot * ACTOR_PAIR_SLOT_COUNT -
                           secondSlot * (secondSlot + 1) / 2];
}

/* Clear the relationship byte for an unordered pair using the same packed index. */
void ActorPairStateMatrix_ClearPair(ActorPairStateMatrix *matrix,
                                    s32 firstSlot, s32 secondSlot)
{
    s32 swap;
    if (secondSlot > firstSlot) {
        swap = firstSlot;
        firstSlot = secondSlot;
        secondSlot = swap;
    }
    matrix->entries[firstSlot + secondSlot * ACTOR_PAIR_SLOT_COUNT -
                    secondSlot * (secondSlot + 1) / 2] = 0;
}

/* Remove and destroy actor. actor must be nonnull because unregistration reads
 * its type before the retail function's redundant destructor guard. */
void ActorCollection_UnregisterAndDestroyActor(ActorCollection *self,
                                               ActorCollectionActor *actor)
{
    ActorCollection_UnregisterActor(self, actor);
    if (actor)
        actor->vtable->destroyAndFree(actor);
}

/* Remove and destroy every nonnull actor encountered across all 128 slots. */
void ActorCollection_UnregisterAndDestroyAllActors(ActorCollection *self)
{
    s32 i;
    for (i = 0; i < ACTOR_COLLECTION_SLOT_COUNT; i++) {
        ActorCollectionActor *actor = self->actors[i];
        if (actor) {
            ActorCollection_UnregisterActor(self, actor);
            if (actor)
                actor->vtable->destroyAndFree(actor);
        }
    }
}
