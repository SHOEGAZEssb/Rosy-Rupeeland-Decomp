#include "tingle/actor_collection.h"

/*
 * Drain the actor collection's deferred-removal queue when its processing flag
 * is set. Each queued actor is removed from collection bookkeeping, destroyed
 * and freed through vtable offset 0x04, and cleared from the queue slot.
 */

/*
 * Return immediately when the removal-queue processing flag is clear.
 * Otherwise scan slots below slotLimit; for every queued actor, unregister it,
 * destroy and free it, and clear the queue entry. The flag itself is not
 * cleared by this routine.
 */
void ActorCollection_DrainRemovalQueue(ActorCollection *self)
{
    s32 i;

    if (!(self->flags & ACTOR_COLLECTION_PROCESS_REMOVAL_QUEUE_FLAG))
        return;
    for (i = 0; i < self->slotLimit; i++) {
        ActorCollectionActor *actor = self->removalQueue[i];
        if (actor) {
            ActorCollection_UnregisterActor(self, actor);
            if (actor)
                actor->vtable->destroyAndFree(actor);
            self->removalQueue[i] = 0;
        }
    }
}
