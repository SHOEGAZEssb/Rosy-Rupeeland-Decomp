#include "tingle/actor_runtime_object_lists.h"
#include "tingle/heap.h"

/* Construct animation resources from records and append them by category. */

#ifdef __cplusplus
extern "C" {
#endif
extern const u8 gActorRuntimeAnimationResourceListNodeAllocationTag[];
extern const u8 gActorRuntimeAnimationResourceAllocationTag[];
#ifdef __cplusplus
}
#endif

/*
 * Consume count consecutive three-resource records and pass each to the append helper
 * with category. A zero count returns immediately. Returns no value; payload
 * and list-node allocations are performed by the callee.
 */
void ActorRuntimeAnimationResourceLists_AppendRecords(
    ActorRuntimeAnimationResourceLists *self,
    const ActorRuntimeAnimationResourceRecord *records, u32 count,
    s16 category)
{
    u32 index;

    if (count == 0)
        return;
    for (index = 0; index < count; index++) {
        const ActorRuntimeAnimationResourceRecord *record = &records[index];
        ActorRuntimeAnimationResourceLists_AppendRecord(
            self, record->resource0, record->resource1, record->resource2,
            category);
    }
}

/*
 * Select the category-0/category-1/other list, allocate and construct a
 * 16-byte AnimationResource from the three resource pointers, set bit
 * 0x01000000 in the object at
 * payload offset 0x04's offset 0x28, then allocate and append a 12-byte node.
 * Returns no value; the original assumes both heap allocations succeed.
 */
void ActorRuntimeAnimationResourceLists_AppendRecord(
    ActorRuntimeAnimationResourceLists *self, void *resource0,
    void *resource1, void *resource2, s16 category)
{
    ActorRuntimeAnimationResourceList *list;
    ActorRuntimeOwnedNode *node;
    void *payload;
    u8 *object;

    if (category == 0)
        list = &self->category0;
    else if (category == 1)
        list = &self->category1;
    else
        list = &self->otherCategory;

    payload = Heap_Alloc(
        0x10, (const char *)gActorRuntimeAnimationResourceAllocationTag,
        4, &gHeapContext);
    if (payload != 0)
        payload = AnimationResource_Init(
            (AnimationResource *)payload, resource0, resource1, resource2);
    object = *(u8 **)((u8 *)payload + 4);
    *(u32 *)(object + 0x28) |= 0x01000000;

    node = (ActorRuntimeOwnedNode *)Heap_Alloc(
        0xc, (const char *)gActorRuntimeAnimationResourceListNodeAllocationTag, 4,
        &gHeapContext);
    if (node != 0) {
        node->next = 0;
        node->previous = 0;
        node->value = payload;
    }
    if (list->tail != 0) {
        list->tail->next = node;
        node->previous = list->tail;
    } else {
        list->head = node;
    }
    list->tail = node;
    list->count++;
}

/* Restore the payload-list vtable, clear nodes, free self, and return its address. */
ActorRuntimeAnimationResourceList *ActorRuntimeAnimationResourceList_DestroyAndFree(ActorRuntimeAnimationResourceList *self)
{
    self->vtable = gActorRuntimeAnimationResourceListVTable;
    ActorRuntimeAnimationResourceList_Clear(self);
    Heap_Free(self);
    return self;
}
