#include "tingle/graphics_transfer_queue.h"

/*
 * Fixed-capacity queue used to stage graphics transfers. The recovered callers
 * enqueue records with a transfer-family value and three payload words, then
 * later locate or remove records. Payload semantics remain deliberately
 * address-based until the transfer consumer is reconstructed.
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
GraphicsTransferEntry *func_0207260c(GraphicsTransferEntry *entry)
{
    func_02072624(entry);
    return entry;
}

/*
 * No-op entry destructor used by the Metrowerks array runtime. It changes no
 * state, returns no value, and has no SDK or graphics-hardware effects.
 */
void func_02072620(GraphicsTransferEntry *entry)
{
    (void)entry;
}

/*
 * Clear both list links and all four payload words in entry. The descriptor is
 * mutated in place; the function returns no value and performs no hardware I/O.
 */
void func_02072624(GraphicsTransferEntry *entry)
{
    entry->next = 0;
    entry->prev = 0;
    entry->field_08 = 0;
    entry->field_0c = 0;
    entry->field_10 = 0;
    entry->field_14 = 0;
}

/*
 * Construct all 128 transfer descriptors and reset queue to an empty FIFO with
 * a full free list. The initialized queue is returned; only the compiler array
 * runtime is called and no transfer is submitted.
 */
GraphicsTransferQueue *func_02072644(GraphicsTransferQueue *queue)
{
    __construct_array(
        queue->entries, GRAPHICS_TRANSFER_QUEUE_CAPACITY,
        sizeof(GraphicsTransferEntry),
        (void (*)(void *))func_0207260c,
        (void (*)(void *))func_02072620);
    func_02072684(queue);
    return queue;
}

/*
 * Clear every descriptor, empty the active FIFO, reset count, and rebuild the
 * free list through next. This discards queued transfers without performing
 * them and returns no value; callers must own any payload lifetime separately.
 */
#ifndef MATCHING
void func_02072684(GraphicsTransferQueue *queue)
{
    s32 i = 0;
    GraphicsTransferQueue *base = queue;

    base->tail = 0;
    base->head = 0;
    base->freeEntries = base->entries;
    base->count = 0;

    for (; i < GRAPHICS_TRANSFER_QUEUE_CAPACITY; i++) {
        func_02072624(&base->entries[i]);
    }
    for (i = 0; i < GRAPHICS_TRANSFER_QUEUE_CAPACITY - 1; i++) {
        base->entries[i].next = &base->entries[i + 1];
    }
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void func_02072684(GraphicsTransferQueue *queue)
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
    bl func_02072624
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
 * Take one free descriptor, append it to the FIFO, copy the four supplied
 * payload values, and increment count. A full queue silently drops the request.
 * The routine only stages metadata and does not itself access graphics hardware.
 */
void func_020726e4(GraphicsTransferQueue *queue, u32 field_0c,
                   void *field_08, u32 field_10, u32 field_14)
{
    GraphicsTransferEntry *entry = queue->freeEntries;

    if (entry == 0) {
        return;
    }

    queue->freeEntries = entry->next;
    if (queue->head != 0) {
        queue->tail->next = entry;
    } else {
        queue->head = entry;
    }
    entry->prev = queue->tail;
    entry->next = 0;
    queue->tail = entry;
    queue->count++;
    entry->field_0c = field_0c;
    entry->field_08 = field_08;
    entry->field_10 = field_10;
    entry->field_14 = field_14;
}

/*
 * Unlink non-null entry from the FIFO, push it onto the descriptor free list,
 * and decrement count. Payload words are left intact until reuse or reset. The
 * function returns no value and performs no transfer or hardware operation.
 */
void func_02072748(GraphicsTransferQueue *queue, GraphicsTransferEntry *entry)
{
    GraphicsTransferEntry *prev;
    GraphicsTransferEntry *next;

    if (entry == 0) {
        return;
    }

    prev = entry->prev;
    next = entry->next;
    if (prev != 0) {
        prev->next = next;
    } else {
        queue->head = next;
    }
    if (next != 0) {
        next->prev = prev;
    } else {
        queue->tail = prev;
    }

    if (queue->freeEntries != 0) {
        queue->freeEntries->prev = entry;
    }
    entry->prev = 0;
    entry->next = queue->freeEntries;
    queue->freeEntries = entry;
    queue->count--;
}

/*
 * Search the FIFO from head for the first entry whose offset-0x08 payload is
 * pointer-equal to field_08. Returns that descriptor or null; no state changes
 * and no SDK or graphics-hardware effects occur.
 */
GraphicsTransferEntry *func_0207279c(GraphicsTransferQueue *queue,
                                     const void *field_08)
{
    GraphicsTransferEntry *entry = queue->head;

    while (entry != 0) {
        if (entry->field_08 == field_08) {
            return entry;
        }
        entry = entry->next;
    }
    return 0;
}
