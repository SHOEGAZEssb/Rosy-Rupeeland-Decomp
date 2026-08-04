#include "tingle/owned_pointer_list.h"

/*
 * Owning singly linked-list base used by startup-created task collections.
 * The element layout beyond its leading next pointer remains unconfirmed;
 * clearing the list releases each complete allocation through the game heap.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void Heap_Free(void *allocation);

#ifdef __cplusplus
}
#endif

/* Initialize an empty list and install its two-entry destructor vtable. */
OwnedPointerList *func_02001d10(OwnedPointerList *list)
{
    list->vtable = &data_020d3ca0;
    list->head = 0;
    list->tail = 0;
    list->count = 0;
    return list;
}

/* Clear every owned node, retain the allocation, and restore the base vtable. */
OwnedPointerList *func_02001d30(OwnedPointerList *list)
{
    list->vtable = &data_020d3ca0;
    func_02001d50(list);
    return list;
}

/*
 * Release the chain beginning at offset 0x04, then reset the list metadata.
 * Each allocation stores the next pointer in its first word; its remaining
 * payload and concrete type are not yet known.
 */
void func_02001d50(OwnedPointerList *list)
{
    OwnedPointerListNode *node = list->head;

    while (node != 0) {
        OwnedPointerListNode *next = node->next;
        if (node != 0) {
            Heap_Free(node);
        }
        node = next;
    }

    list->head = 0;
    list->tail = 0;
    list->count = 0;
}

/* Clear a heap-owned list, release the list itself, and return its old address. */
OwnedPointerList *func_02001d90(OwnedPointerList *list)
{
    list->vtable = &data_020d3ca0;
    func_02001d50(list);
    Heap_Free(list);
    return list;
}
