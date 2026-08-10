#include "tingle/types.h"

/*
 * Drain the actor collection's deferred-removal queue when its dirty flag is
 * set. Each queued actor is removed from collection bookkeeping, destroyed
 * through vtable offset 0x04, and cleared from the queue slot.
 */
typedef struct DrainActor DrainActor;
typedef struct DrainActorVTable {
    void *field_00;
    void (*destroy_04)(DrainActor *self);
} DrainActorVTable;
struct DrainActor {
    DrainActorVTable *vtable_00;
};
typedef struct ActorCollectionActiveDrain {
    DrainActor *actors_0000[128];
    u8 field_0200[0xa00];
    DrainActor *removalQueue_0c00[128];
    u8 field_0e00[0x2074];
    s32 slotLimit_2e74;
    u32 flags_2e78;
} ActorCollectionActiveDrain;

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorCollection_UnregisterActor(ActorCollectionActiveDrain *, DrainActor *);
#ifdef __cplusplus
}
#endif

/*
 * Return immediately when flags_2e78 bit zero is clear. Otherwise scan active
 * slots below slotLimit_2e74; for every nonnull entry, remove it, invoke its
 * destructor when nonnull, and clear the active entry. The flag itself is not
 * cleared by this routine.
 */
void ActorCollection_DrainRemovalQueue(ActorCollectionActiveDrain *self)
{
    s32 i;

    if (!(self->flags_2e78 & 1))
        return;
    for (i = 0; i < self->slotLimit_2e74; i++) {
        DrainActor *actor = self->removalQueue_0c00[i];
        if (actor) {
            ActorCollection_UnregisterActor(self, actor);
            if (actor)
                actor->vtable_00->destroy_04(actor);
            self->removalQueue_0c00[i] = 0;
        }
    }
}
