#include "tingle/actor_runtime_object_lists.h"
#include "tingle/heap.h"

/* Initialize and destroy a manager owning three actor-runtime payload lists. */

#ifdef __cplusplus
extern "C" {
#endif
extern const u8 data_020d44f0[];
extern const u8 data_020d4500[];
extern void ActorRuntimeObjectLists_ClearSecond(ActorRuntimeObjectLists *self);
extern void ActorRuntimeObjectLists_ClearThird(ActorRuntimeObjectLists *self);
#ifdef __cplusplus
}
#endif

typedef void *(*ActorRuntimePayloadDeleteMethod)(void *payload);

/* Initialize the manager vtable and all three empty payload lists; return self. */
ActorRuntimeObjectLists *ActorRuntimeObjectLists_Init(ActorRuntimeObjectLists *self)
{
    self->vtable = data_020d4500;
    ActorRuntimePayloadList_Init(&self->first);
    ActorRuntimePayloadList_Init(&self->second);
    ActorRuntimePayloadList_Init(&self->third);
    return self;
}

/* Initialize an empty payload list with its recovered vtable and return self. */
ActorRuntimePayloadList *ActorRuntimePayloadList_Init(ActorRuntimePayloadList *self)
{
    self->vtable = data_020d44f0;
    self->head = 0;
    self->tail = 0;
    self->count = 0;
    return self;
}

/* Restore the list vtable, clear owned nodes, and return self without freeing. */
ActorRuntimePayloadList *ActorRuntimePayloadList_Destroy(ActorRuntimePayloadList *self)
{
    self->vtable = data_020d44f0;
    ActorRuntimePayloadList_Clear(self);
    return self;
}

/*
 * Free every node reachable from head, then clear head/tail/count. Payloads are
 * not destroyed here. Returns no value; Heap_Free is the only runtime effect.
 */
void ActorRuntimePayloadList_Clear(ActorRuntimePayloadList *self)
{
    ActorRuntimeOwnedNode *node = self->head;

    while (node != 0) {
        ActorRuntimeOwnedNode *next = node->next;
        if (node != 0)
            Heap_Free(node);
        node = next;
    }
    self->head = 0;
    self->tail = 0;
    self->count = 0;
}

/*
 * Run the second-, third-, and first-category cleanup methods, then restore and
 * clear all list bases in reverse order. Returns self without freeing it; the
 * category semantics remain unconfirmed.
 */
ActorRuntimeObjectLists *ActorRuntimeObjectLists_Destroy(ActorRuntimeObjectLists *self)
{
    self->vtable = data_020d4500;
    ActorRuntimeObjectLists_ClearSecond(self);
    ActorRuntimeObjectLists_ClearThird(self);
    ActorRuntimeObjectLists_ClearFirst(self);
    self->third.vtable = data_020d44f0;
    ActorRuntimePayloadList_Clear(&self->third);
    self->second.vtable = data_020d44f0;
    ActorRuntimePayloadList_Clear(&self->second);
    self->first.vtable = data_020d44f0;
    ActorRuntimePayloadList_Clear(&self->first);
    return self;
}

/* Perform ActorRuntimeObjectLists_Destroy's teardown, free self, and return its old address. */
ActorRuntimeObjectLists *ActorRuntimeObjectLists_DestroyAndFree(ActorRuntimeObjectLists *self)
{
    ActorRuntimeObjectLists_Destroy(self);
    Heap_Free(self);
    return self;
}

/*
 * If the first list is nonempty, invoke each nonnull payload's deleting virtual
 * method at vtable offset 0x04, then clear its nodes. Returns no value; payload
 * and node allocations are released through virtual calls and Heap_Free.
 */
void ActorRuntimeObjectLists_ClearFirst(ActorRuntimeObjectLists *self)
{
    ActorRuntimeOwnedNode *node;

    if (self->first.count == 0)
        return;
    for (node = self->first.head; node != 0; node = node->next) {
        if (node->value != 0) {
            void **vtable = *(void ***)node->value;
            ((ActorRuntimePayloadDeleteMethod)vtable[1])(node->value);
        }
    }
    ActorRuntimePayloadList_Clear(&self->first);
}
