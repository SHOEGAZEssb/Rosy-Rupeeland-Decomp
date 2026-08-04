#include "tingle/actor_motion.h"
#include "tingle/heap.h"

/*
 * Lifecycle for the first recovered ActorMotion subclass. It adds a signed
 * frame countdown and radius used to jitter an actor-derived destination.
 */

extern const void *data_020d43d4[];

/* Construct the base motion object, install this vtable, clear jitter fields, and return self. */
ActorMotionJitter *func_02009790(ActorMotionJitter *self)
{
    func_02008f90(&self->base);
    self->base.vtable = data_020d43d4;
    self->remainingFrames = 0;
    self->radius = 0;
    return self;
}

/* Run the base non-deleting destructor and return this derived object. */
ActorMotionJitter *func_020097bc(ActorMotionJitter *self)
{
    func_020090a0(&self->base);
    return self;
}

/* Run the base destructor, free the allocation, and return its old address. */
ActorMotionJitter *func_020097d0(ActorMotionJitter *self)
{
    func_020090a0(&self->base);
    Heap_Free(self);
    return self;
}
