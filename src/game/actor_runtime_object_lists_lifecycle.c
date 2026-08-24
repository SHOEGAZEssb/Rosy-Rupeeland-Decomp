#include "tingle/actor_runtime_object_lists.h"
#include "tingle/heap.h"

/* Initialize and destroy three categorized animation-resource ownership lists. */

#ifdef __cplusplus
extern "C" {
#endif
extern void ActorRuntimeAnimationResourceLists_ClearCategory1(ActorRuntimeAnimationResourceLists *self);
extern void ActorRuntimeAnimationResourceLists_ClearOtherCategory(ActorRuntimeAnimationResourceLists *self);
#ifdef __cplusplus
}
#endif

typedef void *(*ActorRuntimePayloadDeleteMethod)(void *payload);

/* Initialize the manager vtable and all three empty resource lists; return self. */
ActorRuntimeAnimationResourceLists *ActorRuntimeAnimationResourceLists_Init(ActorRuntimeAnimationResourceLists *self)
{
    self->vtable = gActorRuntimeAnimationResourceListsVTable;
    ActorRuntimeAnimationResourceList_Init(&self->category0);
    ActorRuntimeAnimationResourceList_Init(&self->category1);
    ActorRuntimeAnimationResourceList_Init(&self->otherCategory);
    return self;
}

/* Initialize an empty animation-resource list with its vtable and return self. */
ActorRuntimeAnimationResourceList *ActorRuntimeAnimationResourceList_Init(ActorRuntimeAnimationResourceList *self)
{
    self->vtable = gActorRuntimeAnimationResourceListVTable;
    self->head = 0;
    self->tail = 0;
    self->count = 0;
    return self;
}

/* Restore the list vtable, clear owned nodes, and return self without freeing. */
ActorRuntimeAnimationResourceList *ActorRuntimeAnimationResourceList_Destroy(ActorRuntimeAnimationResourceList *self)
{
    self->vtable = gActorRuntimeAnimationResourceListVTable;
    ActorRuntimeAnimationResourceList_Clear(self);
    return self;
}

/*
 * Free every node reachable from head, then clear head/tail/count. Payloads are
 * not destroyed here. Returns no value; Heap_Free is the only runtime effect.
 */
void ActorRuntimeAnimationResourceList_Clear(ActorRuntimeAnimationResourceList *self)
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
 * Run category-1, other-category, and category-0 cleanup, then restore and
 * clear all list bases in reverse order. Returns self without freeing it; the
 * category semantics remain unconfirmed.
 */
ActorRuntimeAnimationResourceLists *ActorRuntimeAnimationResourceLists_Destroy(ActorRuntimeAnimationResourceLists *self)
{
    self->vtable = gActorRuntimeAnimationResourceListsVTable;
    ActorRuntimeAnimationResourceLists_ClearCategory1(self);
    ActorRuntimeAnimationResourceLists_ClearOtherCategory(self);
    ActorRuntimeAnimationResourceLists_ClearCategory0(self);
    self->otherCategory.vtable = gActorRuntimeAnimationResourceListVTable;
    ActorRuntimeAnimationResourceList_Clear(&self->otherCategory);
    self->category1.vtable = gActorRuntimeAnimationResourceListVTable;
    ActorRuntimeAnimationResourceList_Clear(&self->category1);
    self->category0.vtable = gActorRuntimeAnimationResourceListVTable;
    ActorRuntimeAnimationResourceList_Clear(&self->category0);
    return self;
}

/* Perform ActorRuntimeAnimationResourceLists_Destroy's teardown, free self, and return its old address. */
ActorRuntimeAnimationResourceLists *ActorRuntimeAnimationResourceLists_DestroyAndFree(ActorRuntimeAnimationResourceLists *self)
{
    ActorRuntimeAnimationResourceLists_Destroy(self);
    Heap_Free(self);
    return self;
}

/*
 * If category 0 is nonempty, invoke each resource's deleting virtual
 * method at vtable offset 0x04, then clear its nodes. Returns no value; payload
 * and node allocations are released through virtual calls and Heap_Free.
 */
void ActorRuntimeAnimationResourceLists_ClearCategory0(ActorRuntimeAnimationResourceLists *self)
{
    ActorRuntimeOwnedNode *node;

    if (self->category0.count == 0)
        return;
    for (node = self->category0.head; node != 0; node = node->next) {
        if (node->value != 0) {
            void **vtable = *(void ***)node->value;
            ((ActorRuntimePayloadDeleteMethod)vtable[1])(node->value);
        }
    }
    ActorRuntimeAnimationResourceList_Clear(&self->category0);
}
