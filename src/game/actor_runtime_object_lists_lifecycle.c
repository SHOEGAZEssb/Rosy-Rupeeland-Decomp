#include "tingle/actor_runtime_object_lists.h"
#include "tingle/heap.h"

/* Initialize and destroy a manager owning three actor-runtime payload lists. */

#ifdef __cplusplus
extern "C" {
#endif
extern const u8 data_020d44f0[];
extern const u8 data_020d4500[];
extern void func_0200bd10(ActorRuntimeObjectLists *self);
extern void func_0200bd6c(ActorRuntimeObjectLists *self);
#ifdef __cplusplus
}
#endif

typedef void *(*ActorRuntimePayloadDeleteMethod)(void *payload);

/* Initialize the manager vtable and all three empty payload lists; return self. */
ActorRuntimeObjectLists *func_0200bb34(ActorRuntimeObjectLists *self)
{
    self->vtable = data_020d4500;
    func_0200bb68(&self->first);
    func_0200bb68(&self->second);
    func_0200bb68(&self->third);
    return self;
}

/* Initialize an empty payload list with its recovered vtable and return self. */
ActorRuntimePayloadList *func_0200bb68(ActorRuntimePayloadList *self)
{
    self->vtable = data_020d44f0;
    self->head = 0;
    self->tail = 0;
    self->count = 0;
    return self;
}

/* Restore the list vtable, clear owned nodes, and return self without freeing. */
ActorRuntimePayloadList *func_0200bb88(ActorRuntimePayloadList *self)
{
    self->vtable = data_020d44f0;
    func_0200bba8(self);
    return self;
}

/*
 * Free every node reachable from head, then clear head/tail/count. Payloads are
 * not destroyed here. Returns no value; Heap_Free is the only runtime effect.
 */
void func_0200bba8(ActorRuntimePayloadList *self)
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
ActorRuntimeObjectLists *func_0200bbe8(ActorRuntimeObjectLists *self)
{
    self->vtable = data_020d4500;
    func_0200bd10(self);
    func_0200bd6c(self);
    func_0200bcb8(self);
    self->third.vtable = data_020d44f0;
    func_0200bba8(&self->third);
    self->second.vtable = data_020d44f0;
    func_0200bba8(&self->second);
    self->first.vtable = data_020d44f0;
    func_0200bba8(&self->first);
    return self;
}

/* Perform func_0200bbe8's teardown, free self, and return its old address. */
ActorRuntimeObjectLists *func_0200bc4c(ActorRuntimeObjectLists *self)
{
    func_0200bbe8(self);
    Heap_Free(self);
    return self;
}

/*
 * If the first list is nonempty, invoke each nonnull payload's deleting virtual
 * method at vtable offset 0x04, then clear its nodes. Returns no value; payload
 * and node allocations are released through virtual calls and Heap_Free.
 */
void func_0200bcb8(ActorRuntimeObjectLists *self)
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
    func_0200bba8(&self->first);
}
