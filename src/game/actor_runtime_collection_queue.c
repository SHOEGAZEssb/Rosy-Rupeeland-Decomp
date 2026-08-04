#include "tingle/actor_runtime_collection.h"
#include "tingle/heap.h"

/* Queue and dispatch actor-runtime values through the collection's owned list. */

#ifdef __cplusplus
extern "C" {
#endif
extern const u8 data_020d43fc[];
extern void *data_021052fc;
extern void *func_02007f0c(void *context, s32 index);
#ifdef __cplusplus
}
#endif

typedef void (*ActorRuntimeDispatchMethod)(void *object, s32 reason,
                                           void *value);
typedef void (*ActorRuntimeFinishMethod)(void *object, s32 reason);

/* Store an address-derived pending value at offset 0x134; returns no value. */
void func_0200b0d0(ActorRuntimeCollection *self, u32 value)
{
    self->field_134 = value;
}

/*
 * Append field 0x134 to the owned queue when the queue has at most eight
 * entries and the field is nonzero. Returns no value; a 12-byte node may be
 * allocated through func_0200b100 and no hardware is touched directly.
 */
void func_0200b0d8(ActorRuntimeCollection *self)
{
    if (self->ownedList.count > 8)
        return;
    if (self->field_134 == 0)
        return;
    func_0200b100(&self->ownedList, (void *)self->field_134);
}

/*
 * Allocate and append one 12-byte doubly linked node containing value. The
 * list head/tail/count are updated and the allocator is assumed to succeed,
 * matching the original control flow. Returns no value; Heap_Alloc is the only
 * runtime side effect.
 */
void func_0200b100(ActorRuntimeOwnedList *list, void *value)
{
    ActorRuntimeOwnedNode *node =
        (ActorRuntimeOwnedNode *)Heap_Alloc(0xc, (const char *)data_020d43fc,
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
void func_0200b164(ActorRuntimeCollection *self, void *value)
{
    if (self->ownedList.count > 8)
        return;
    func_0200b100(&self->ownedList, value);
}

/*
 * Pop the queue tail, dispatch its value to the runtime object obtained from
 * context index 1 using virtual methods 0xac and 0x78 with reason 4, and
 * return 1. An empty queue returns 0. The node is freed before dispatch; the
 * external context and virtual method effects are not yet fully recovered.
 */
s32 func_0200b180(ActorRuntimeCollection *self)
{
    ActorRuntimeOwnedNode *node;
    void *runtimeObject;
    void *value;
    void **vtable;

    if (self->ownedList.count == 0)
        return 0;

    runtimeObject = *(void **)((u8 *)func_02007f0c(data_021052fc, 1) + 8);
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
        func_0200ae4c(&self->ownedList);

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
s32 func_0200b23c(const ActorRuntimeCollection *self, const void *value)
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
u32 func_0200b294(const ActorRuntimeCollection *self)
{
    return (self->flags & 2) | (self->ownedList.count != 0);
}
