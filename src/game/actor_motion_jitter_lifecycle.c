#include "tingle/actor_motion.h"
#include "tingle/heap.h"

/*
 * Lifecycle for the first recovered ActorMotion subclass. It adds a signed
 * frame countdown and radius used to jitter an actor-derived destination.
 */

extern const void *gActorMotionJitterVTable[];

/* Construct the base motion object, install this vtable, clear jitter fields, and return self. */
ActorMotionJitter *ActorMotionJitter_Init(ActorMotionJitter *self)
{
    ActorMotion_Init(&self->base);
    self->base.vtable = gActorMotionJitterVTable;
    self->remainingFrames = 0;
    self->radius = 0;
    return self;
}

/* Run the base non-deleting destructor and return this derived object. */
ActorMotionJitter *ActorMotionJitter_Destroy(ActorMotionJitter *self)
{
    ActorMotion_DestroyBase(&self->base);
    return self;
}

/* Run the base destructor, free the allocation, and return its old address. */
ActorMotionJitter *ActorMotionJitter_DestroyAndFree(ActorMotionJitter *self)
{
    ActorMotion_DestroyBase(&self->base);
    Heap_Free(self);
    return self;
}
