#include "tingle/actor_runtime_collection.h"
#include "tingle/heap.h"

/* Destroy three address-distinct owned-list variants used by actor runtime code. */

#ifdef __cplusplus
extern "C" {
#endif
extern const u8 data_020d4468[];
#ifdef __cplusplus
}
#endif

/*
 * Restore the base list vtable, clear all owned nodes, free self, and return
 * its old address. Heap_Free is the only SDK/runtime effect.
 */
ActorRuntimeOwnedList *func_0200bac4(ActorRuntimeOwnedList *self)
{
    self->vtable = data_020d4468;
    ActorRuntimeOwnedList_Clear(self);
    Heap_Free(self);
    return self;
}

/*
 * Destroy and free a second address-distinct list variant using the same base
 * behavior as func_0200bac4; returns the old self address.
 */
ActorRuntimeOwnedList *func_0200baec(ActorRuntimeOwnedList *self)
{
    self->vtable = data_020d4468;
    ActorRuntimeOwnedList_Clear(self);
    Heap_Free(self);
    return self;
}

/* Restore the base vtable, clear owned nodes, and return self without freeing. */
ActorRuntimeOwnedList *func_0200bb14(ActorRuntimeOwnedList *self)
{
    self->vtable = data_020d4468;
    ActorRuntimeOwnedList_Clear(self);
    return self;
}
