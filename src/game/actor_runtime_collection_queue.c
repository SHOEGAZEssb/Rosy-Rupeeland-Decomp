#include "tingle/actor_runtime_collection.h"
#include "tingle/heap.h"

/* Queue and dispatch actor-runtime values through the collection's owned list. */

#ifdef __cplusplus
extern "C" {
#endif
extern const u8 gActorRuntimeOwnedNodeAllocationTag[];
extern void *gGamePhaseRuntime;
extern void *GamePhaseRuntime_GetActorCollection(void *context, s32 index);
#ifdef __cplusplus
}
#endif

typedef void (*ActorRuntimeDispatchMethod)(void *object, s32 reason,
                                           void *value);
typedef void (*ActorRuntimeFinishMethod)(void *object, s32 reason);

/* Store an address-derived pending value at offset 0x134; returns no value. */
void ActorRuntimeCollection_SetPendingValue(ActorRuntimeCollection *self, u32 value)
{
    self->field_134 = value;
}

/*
 * Append field 0x134 to the owned queue when the queue has at most eight
 * entries and the field is nonzero. Returns no value; a 12-byte node may be
 * allocated through ActorRuntimeOwnedList_Append and no hardware is touched directly.
 */
void ActorRuntimeCollection_QueuePendingValue(ActorRuntimeCollection *self)
{
    if (self->ownedList.count > 8)
        return;
    if (self->field_134 == 0)
        return;
    ActorRuntimeOwnedList_Append(&self->ownedList, (void *)self->field_134);
}

/*
 * Allocate and append one 12-byte doubly linked node containing value. The
 * list head/tail/count are updated and the allocator is assumed to succeed,
 * matching the original control flow. Returns no value; Heap_Alloc is the only
 * runtime side effect.
 */
void ActorRuntimeOwnedList_Append(ActorRuntimeOwnedList *list, void *value)
{
    ActorRuntimeOwnedNode *node =
        (ActorRuntimeOwnedNode *)Heap_Alloc(
            0xc, (const char *)gActorRuntimeOwnedNodeAllocationTag,
            4, &gHeapContext);

    if (node != 0) {
        node->next = 0;
        node->previous = 0;
        node->value = value;
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

/* Append value when the owned queue contains at most eight entries. */
void ActorRuntimeCollection_QueueValue(ActorRuntimeCollection *self, void *value)
{
    if (self->ownedList.count > 8)
        return;
    ActorRuntimeOwnedList_Append(&self->ownedList, value);
}

/*
 * Pop the queue tail, dispatch its value to the runtime object obtained from
 * context index 1 using virtual methods 0xac and 0x78 with reason 4, and
 * return 1. An empty queue returns 0. The node is freed before dispatch; the
 * external context and virtual method effects are not yet fully recovered.
 */
s32 ActorRuntimeCollection_DispatchQueuedValue(ActorRuntimeCollection *self)
{
    ActorRuntimeOwnedNode *node;
    void *runtimeObject;
    void *value;
    void **vtable;

    if (self->ownedList.count == 0)
        return 0;

    runtimeObject = *(void **)((u8 *)GamePhaseRuntime_GetActorCollection(gGamePhaseRuntime, 1) + 8);
    node = self->ownedList.tail;
    value = node->value;
    self->ownedList.tail = node->previous;
    if (node->previous != 0)
        node->previous->next = 0;
    else
        self->ownedList.head = 0;
    if (node != 0)
        Heap_Free(node);

    self->ownedList.count--;
    if (self->ownedList.count == 0)
        ActorRuntimeOwnedList_Clear(&self->ownedList);

    vtable = *(void ***)runtimeObject;
    ((ActorRuntimeDispatchMethod)vtable[0xac / 4])(runtimeObject, 4, value);
    vtable = *(void ***)runtimeObject;
    ((ActorRuntimeFinishMethod)vtable[0x78 / 4])(runtimeObject, 4);
    return 1;
}

/*
 * Return 1 when a nonempty queue does not contain value, otherwise return 0.
 * Performs a read-only pointer comparison and has no SDK or hardware effects.
 */
s32 ActorRuntimeCollection_IsQueuedValueMissing(const ActorRuntimeCollection *self, const void *value)
{
    const ActorRuntimeOwnedNode *node;
    s32 found = 0;

    if (self->ownedList.count == 0)
        return 0;
    for (node = self->ownedList.head; node != 0; node = node->next) {
        if (value == node->value)
            found = 1;
    }
    return found == 0;
}

/* Return selection flag bit 1 OR queue-nonempty bit 0 without changing state. */
u32 ActorRuntimeCollection_GetBusyState(const ActorRuntimeCollection *self)
{
    return (self->flags & 2) | (self->ownedList.count != 0);
}
