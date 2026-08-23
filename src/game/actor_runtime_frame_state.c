#include "tingle/actor.h"

/* Snapshot and reset transient actor state at frame boundaries. */

/*
 * Copy byte 0xd4 to 0xd5, word 0xc8 to 0xcc, halfwords 0xd6/0xda to 0xd8/0xdc,
 * and mask word 0xd0 with 0x801f37ee. Returns no value and calls no hardware or
 * SDK services.
 */
void Actor_SnapshotTransientState(Actor *self)
{
    self->previousDirection = self->direction;
    *(u32 *)((u8 *)self + 0xcc) = *(u32 *)((u8 *)self + 0xc8);
    self->runtimeFlags &= 0x801f37ee;
    self->previousState = self->state;
    self->previousSubstate = self->substate;
}

/*
 * Clear transient contact bytes 0x49-0x4b and mirror actor flag 0x2000 into
 * flag 0x4000, preserving all other flag bits. Returns no value.
 */
void Actor_ClearTransientContactState(Actor *self)
{
    u32 flags;

    self->contactEdges =
        self->pairStateBytes[0] = self->pairStateBytes[1] = 0;
    flags = self->flags;
    if (flags & 0x2000)
        flags |= 0x4000;
    else
        flags &= ~0x4000;
    self->flags = flags;
}

/* Mark that this actor's update callback has started in the current pass. */
void Actor_MarkFrameUpdateStarted(Actor *self)
{
    self->flags |= ACTOR_FRAME_UPDATE_STARTED_FLAG;
}
