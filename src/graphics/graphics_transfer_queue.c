#include "tingle/graphics_transfer_queue.h"

/*
 * Fixed-capacity queue used to stage graphics transfers. Recovered upload
 * producers and the VBlank consumer identify the four record values as object
 * VRAM transfer kind, borrowed source, byte destination offset, and byte size.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void __construct_array(void *array, u32 count, u32 elementSize,
                              void (*constructor)(void *),
                              void (*destructor)(void *));

#ifdef __cplusplus
}
#endif

/*
 * Initialize entry through the shared clearing routine and return it. Only the
 * supplied descriptor changes; there are no SDK or graphics-hardware effects.
 */
GraphicsTransferEntry *GraphicsTransferEntry_Init(
    GraphicsTransferEntry *entry)
{
    GraphicsTransferEntry_Clear(entry);
    return entry;
}

/*
 * No-op entry destructor used by the Metrowerks array runtime. It changes no
 * state, returns no value, and has no SDK or graphics-hardware effects.
 */
void GraphicsTransferEntry_Destroy(GraphicsTransferEntry *entry)
{
    (void)entry;
}

/*
 * Clear both list links and all four payload words in entry. The descriptor is
 * mutated in place; the function returns no value and performs no hardware I/O.
 */
void GraphicsTransferEntry_Clear(GraphicsTransferEntry *entry)
{
    entry->nextOrFreeNext = 0;
    entry->previousOrFreePrevious = 0;
    entry->source = 0;
    entry->transferKind = 0;
    entry->destinationOffsetBytes = 0;
    entry->sizeBytes = 0;
}

/*
 * Construct all 128 transfer descriptors and reset queue to an empty FIFO with
 * a full free list. The initialized queue is returned; only the compiler array
 * runtime is called and no transfer is submitted.
 */
GraphicsTransferQueue *GraphicsTransferQueue_Init(
    GraphicsTransferQueue *queue)
{
    __construct_array(
        queue->entries, GRAPHICS_TRANSFER_QUEUE_CAPACITY,
        sizeof(GraphicsTransferEntry),
        (void (*)(void *))GraphicsTransferEntry_Init,
        (void (*)(void *))GraphicsTransferEntry_Destroy);
    GraphicsTransferQueue_Reset(queue);
    return queue;
}

/*
 * Clear every descriptor, empty the active FIFO, reset count, and rebuild the
 * free list through nextOrFreeNext. This discards queued transfers without
 * performing them and returns no value; source ownership remains with callers.
 */
#ifndef MATCHING
void GraphicsTransferQueue_Reset(GraphicsTransferQueue *queue)
{
    s32 i = 0;
    GraphicsTransferQueue *base = queue;

    base->tail = 0;
    base->head = 0;
    base->freeHead = base->entries;
    base->queuedCount = 0;

    for (; i < GRAPHICS_TRANSFER_QUEUE_CAPACITY; i++) {
        GraphicsTransferEntry_Clear(&base->entries[i]);
    }
    for (i = 0; i < GRAPHICS_TRANSFER_QUEUE_CAPACITY - 1; i++) {
        base->entries[i].nextOrFreeNext = &base->entries[i + 1];
    }
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void GraphicsTransferQueue_Reset(GraphicsTransferQueue *queue)
{
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, #0
    mov r4, r0
    str r6, [r4, #0xc04]
    str r6, [r4, #0xc00]
    str r4, [r4, #0xc08]
    str r6, [r4, #0xc0c]
    mov r5, #0x18
    mla r0, r6, r5, r4
    bl GraphicsTransferEntry_Clear
    add r6, r6, #1
    cmp r6, #0x80
    DCD 0xBAFFFFFA
    mov r0, #0x18
    mov r6, #0
    mov r1, r0
    add r3, r6, #1
    mla r2, r6, r1, r4
    mla r5, r3, r0, r4
    mov r6, r3
    str r5, [r2, #4]
    cmp r3, #0x7f
    DCD 0xBAFFFFF8
    ldmia sp!, {r4, r5, r6, pc}
}
#endif

/*
 * Take one free descriptor, append it to the FIFO, copy the transfer family,
 * source, destination, and byte size, and increment count. A full queue
 * silently drops the request. This stages metadata without accessing hardware.
 */
void GraphicsTransferQueue_Enqueue(GraphicsTransferQueue *queue,
                                   u32 transferKind,
                                   const void *source,
                                   u32 destinationOffsetBytes, u32 sizeBytes)
{
    GraphicsTransferEntry *entry = queue->freeHead;

    if (entry == 0) {
        return;
    }

    queue->freeHead = entry->nextOrFreeNext;
    if (queue->head != 0) {
        queue->tail->nextOrFreeNext = entry;
    } else {
        queue->head = entry;
    }
    entry->previousOrFreePrevious = queue->tail;
    entry->nextOrFreeNext = 0;
    queue->tail = entry;
    queue->queuedCount++;
    entry->transferKind = transferKind;
    entry->source = source;
    entry->destinationOffsetBytes = destinationOffsetBytes;
    entry->sizeBytes = sizeBytes;
}

/*
 * Unlink non-null entry from the FIFO, push it onto the descriptor free list,
 * and decrement count. Payload words are left intact until reuse or reset. The
 * function returns no value and performs no transfer or hardware operation.
 */
void GraphicsTransferQueue_Remove(GraphicsTransferQueue *queue,
                                  GraphicsTransferEntry *entry)
{
    GraphicsTransferEntry *prev;
    GraphicsTransferEntry *next;

    if (entry == 0) {
        return;
    }

    prev = entry->previousOrFreePrevious;
    next = entry->nextOrFreeNext;
    if (prev != 0) {
        prev->nextOrFreeNext = next;
    } else {
        queue->head = next;
    }
    if (next != 0) {
        next->previousOrFreePrevious = prev;
    } else {
        queue->tail = prev;
    }

    if (queue->freeHead != 0) {
        queue->freeHead->previousOrFreePrevious = entry;
    }
    entry->previousOrFreePrevious = 0;
    entry->nextOrFreeNext = queue->freeHead;
    queue->freeHead = entry;
    queue->queuedCount--;
}

/*
 * Search the FIFO from head for the first entry whose source pointer is
 * pointer-equal to source. Returns that descriptor or null; no state changes
 * and no SDK or graphics-hardware effects occur.
 */
GraphicsTransferEntry *GraphicsTransferQueue_FindBySource(
    GraphicsTransferQueue *queue, const void *source)
{
    GraphicsTransferEntry *entry = queue->head;

    while (entry != 0) {
        if (entry->source == source) {
            return entry;
        }
        entry = entry->nextOrFreeNext;
    }
    return 0;
}
