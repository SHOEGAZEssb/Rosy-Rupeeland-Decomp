#include "tingle/actor_runtime_object_lists.h"
#include "tingle/heap.h"

/* Construct payload objects from triples and append them to one of three lists. */

#ifdef __cplusplus
extern "C" {
#endif
extern const u8 gActorRuntimePayloadListNodeAllocationTag[];
extern const u8 gActorRuntimePayloadAnimationResourceAllocationTag[];
extern void *AnimationResource_Init(void *allocation, u32 first, u32 second, u32 third);
#ifdef __cplusplus
}
#endif

/*
 * Consume count consecutive three-word records and pass each to ActorRuntimeObjectLists_AddRecord
 * with category. A zero count returns immediately. Returns no value; payload
 * and list-node allocations are performed by the callee.
 */
void ActorRuntimeObjectLists_AddRecords(ActorRuntimeObjectLists *self, const u32 *triples,
                   u32 count, s16 category)
{
    u32 index;

    if (count == 0)
        return;
    for (index = 0; index < count; index++) {
        const u32 *record = triples + index * 3;
        ActorRuntimeObjectLists_AddRecord(self, record[0], record[1], record[2], category);
    }
}

/*
 * Select first/second/third list for category 0/1/other, allocate and construct
 * a 16-byte payload from the three values, set bit 0x01000000 in the object at
 * payload offset 0x04's offset 0x28, then allocate and append a 12-byte node.
 * Returns no value; the original assumes both heap allocations succeed.
 */
void ActorRuntimeObjectLists_AddRecord(ActorRuntimeObjectLists *self, u32 first, u32 second,
                   u32 third, s16 category)
{
    ActorRuntimePayloadList *list;
    ActorRuntimeOwnedNode *node;
    void *payload;
    u8 *object;

    if (category == 0)
        list = &self->first;
    else if (category == 1)
        list = &self->second;
    else
        list = &self->third;

    payload = Heap_Alloc(
        0x10, (const char *)gActorRuntimePayloadAnimationResourceAllocationTag,
        4, &gHeapContext);
    if (payload != 0)
        payload = AnimationResource_Init(payload, first, second, third);
    object = *(u8 **)((u8 *)payload + 4);
    *(u32 *)(object + 0x28) |= 0x01000000;

    node = (ActorRuntimeOwnedNode *)Heap_Alloc(
        0xc, (const char *)gActorRuntimePayloadListNodeAllocationTag, 4,
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
ActorRuntimePayloadList *ActorRuntimePayloadList_DestroyAndFree(ActorRuntimePayloadList *self)
{
    extern const u8 data_020d44f0[];

    self->vtable = data_020d44f0;
    ActorRuntimePayloadList_Clear(self);
    Heap_Free(self);
    return self;
}
