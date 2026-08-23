#include "tingle/actor_collection.h"

/*
 * Dispatch actor update callbacks from the collection's primary category and
 * from the complete slot array. These passes also clear the frame-update-started
 * flag before selected updates and route a few actor types through a shared
 * helper.
 */
#ifdef __cplusplus
extern "C" {
#endif
extern void ActorDerivedRuntime_UpdateFrame(Actor *);
#ifdef __cplusplus
}
#endif

/*
 * Visit every actor in category zero. Actors carrying flag 0x01000000 and
 * type one, two, or five are passed to ActorDerivedRuntime_UpdateFrame; all others receive the
 * virtual callback at vtable offset 0x1c. The routine returns no value, and
 * any observable changes are those performed by the selected callee.
 */
void ActorCollection_UpdateCategory0Actors(ActorCollection *self)
{
    s32 count = self->categoryCounts[0];
    s32 i;

    for (i = 0; i < count; i++) {
        Actor *actor = self->categories[0][i];

        if ((actor->flags & 0x01000000) &&
            (actor->type == 1 || actor->type == 2 || actor->type == 5))
            ActorDerivedRuntime_UpdateFrame(actor);
        else
            actor->vtable->updateFrame(actor);
    }
}

/*
 * Clear transient flag 0x80 on every category-zero actor. Actors lacking flag
 * 0x100 receive no callback. Of the remainder, types two and five use
 * ActorDerivedRuntime_UpdateFrame when flag 0x01000000 is set; type one and all
 * other cases use the frame-update callback. The routine returns no value.
 */
void ActorCollection_UpdateFlag100Category0Actors(ActorCollection *self)
{
    s32 count = self->categoryCounts[0];
    s32 i;

    for (i = 0; i < count; i++) {
        Actor *actor = self->categories[0][i];

        actor->flags &= ~ACTOR_FRAME_UPDATE_STARTED_FLAG;
        if (!(actor->flags & 0x100))
            continue;
        if ((actor->flags & 0x01000000) &&
            (actor->type == 2 || actor->type == 5))
            ActorDerivedRuntime_UpdateFrame(actor);
        else
            actor->vtable->updateFrame(actor);
    }
}

/*
 * Scan all registered slots up to offset 0x2e74, ignoring null entries. Clear
 * the frame-update-started flag on each actor and invoke its frame-update
 * callback only when actor flag 0x800 is set. The callback owns any further
 * state or SDK effects; this routine returns no value.
 */
void ActorCollection_UpdateFlag800Actors(ActorCollection *self)
{
    s32 i;

    for (i = 0; i < self->slotLimit; i++) {
        Actor *actor = self->actors[i];

        if (!actor)
            continue;
        actor->flags &= ~ACTOR_FRAME_UPDATE_STARTED_FLAG;
        if (actor->motionFlags & 0x800)
            actor->vtable->updateFrame(actor);
    }
}
