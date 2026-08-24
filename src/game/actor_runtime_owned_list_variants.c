#include "tingle/actor_runtime_collection.h"
#include "tingle/heap.h"

/* Destroy three address-distinct owned-list variants used by actor runtime code. */

/*
 * Restore the base list vtable, clear all owned nodes, free self, and return
 * its old address. Heap_Free is the only SDK/runtime effect.
 */
ActorRuntimeOwnedList *ActorRuntimeOwnedList_DestroyAndFree(ActorRuntimeOwnedList *self)
{
    self->vtable = gActorRuntimeListBaseVTable;
    ActorRuntimeOwnedList_Clear(self);
    Heap_Free(self);
    return self;
}

/*
 * Destroy and free a second address-distinct list variant using the same base
 * behavior as ActorRuntimeOwnedList_DestroyAndFree; returns the old self address.
 */
ActorRuntimeOwnedList *ActorRuntimeListBase_DestroyAndFree(ActorRuntimeOwnedList *self)
{
    self->vtable = gActorRuntimeListBaseVTable;
    ActorRuntimeOwnedList_Clear(self);
    Heap_Free(self);
    return self;
}

/* Restore the base vtable, clear owned nodes, and return self without freeing. */
ActorRuntimeOwnedList *ActorRuntimeListBase_Destroy(ActorRuntimeOwnedList *self)
{
    self->vtable = gActorRuntimeListBaseVTable;
    ActorRuntimeOwnedList_Clear(self);
    return self;
}
