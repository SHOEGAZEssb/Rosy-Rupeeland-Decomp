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
OwnedPointerList *OwnedPointerList_Init(OwnedPointerList *list)
{
    list->vtable = &gOwnedPointerListVTable;
    list->head = 0;
    list->tail = 0;
    list->count = 0;
    return list;
}

/* Clear every owned node, retain the allocation, and restore the base vtable. */
OwnedPointerList *OwnedPointerList_Destroy(OwnedPointerList *list)
{
    list->vtable = &gOwnedPointerListVTable;
    OwnedPointerList_Clear(list);
    return list;
}

/*
 * Release the chain beginning at offset 0x04, then reset the list metadata.
 * Each allocation stores the next pointer in its first word; its remaining
 * payload and concrete type are not yet known.
 */
void OwnedPointerList_Clear(OwnedPointerList *list)
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
OwnedPointerList *OwnedPointerList_DestroyAndFree(OwnedPointerList *list)
{
    list->vtable = &gOwnedPointerListVTable;
    OwnedPointerList_Clear(list);
    Heap_Free(list);
    return list;
}
