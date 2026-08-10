#include "tingle/actor_motion.h"
#include "tingle/heap.h"

/*
 * Lifecycle for an ActorMotion subclass whose update publishes coordinates to
 * GameWork. It adds no recovered fields beyond the 0x64-byte base object.
 */

extern const void *data_020d43e4[];

/* Construct the base object, install the GameWork-updating vtable, and return self. */
ActorMotion *func_020099dc(ActorMotion *self)
{
    ActorMotion_Init(self);
    self->vtable = data_020d43e4;
    return self;
}

/* Run the base non-deleting destructor and return self. */
ActorMotion *func_020099fc(ActorMotion *self)
{
    ActorMotion_DestroyBase(self);
    return self;
}

/* Run the base destructor, free the allocation, and return its old address. */
ActorMotion *func_02009a10(ActorMotion *self)
{
    ActorMotion_DestroyBase(self);
    Heap_Free(self);
    return self;
}
