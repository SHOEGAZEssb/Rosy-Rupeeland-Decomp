#include "tingle/actor_motion.h"
#include "tingle/heap.h"

/*
 * Lifecycle for an ActorMotion subclass whose update publishes coordinates to
 * GameWork. It adds no recovered fields beyond the 0x64-byte base object.
 */

extern const void *gActorMotionGameWorkVTable[];

/* Construct the base object, install the GameWork-updating vtable, and return self. */
ActorMotion *ActorMotionGameWork_Init(ActorMotion *self)
{
    ActorMotion_Init(self);
    self->vtable = gActorMotionGameWorkVTable;
    return self;
}

/* Run the base non-deleting destructor and return self. */
ActorMotion *ActorMotionGameWork_Destroy(ActorMotion *self)
{
    ActorMotion_DestroyBase(self);
    return self;
}

/* Run the base destructor, free the allocation, and return its old address. */
ActorMotion *ActorMotionGameWork_DestroyAndFree(ActorMotion *self)
{
    ActorMotion_DestroyBase(self);
    Heap_Free(self);
    return self;
}
