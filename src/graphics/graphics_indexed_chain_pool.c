#include "tingle/graphics_indexed_chain_pool.h"

/*
 * Sixteen-entry graphics descriptor pool. Allocations append one active root
 * and optionally chain more descriptors from it; each descriptor retains a
 * stable byte index assigned at construction. The remaining payload byte and
 * pointer are kept offset-based until their consumers are fully reconstructed.
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
 * Clear all links, the offset-0x0c pointer, and three payload bytes in entry.
 * The descriptor changes in place; there is no return value or hardware I/O.
 */
void func_020727c4(GraphicsIndexedChainEntry *entry)
{
    entry->chainNext = 0;
    entry->next = 0;
    entry->prev = 0;
    entry->field_0c = 0;
    entry->field_10 = 0;
    entry->mode = 0;
    entry->index = 0;
}

/*
 * No-op descriptor destructor used by the Metrowerks array runtime. It changes
 * no state, returns no value, and has no SDK or graphics-hardware effects.
 */
void func_020727e8(GraphicsIndexedChainEntry *entry)
{
    (void)entry;
}

/*
 * Construct all 16 descriptors, assign stable indices 0..15, build the free
 * list, and initialize an empty active-root list. Returns pool and performs no
 * graphics operation beyond invoking the compiler's array runtime.
 */
GraphicsIndexedChainPool *func_020727ec(GraphicsIndexedChainPool *pool)
{
    u8 i;

    __construct_array(
        pool->entries, GRAPHICS_INDEXED_CHAIN_CAPACITY,
        sizeof(GraphicsIndexedChainEntry),
        (void (*)(void *))func_020727c4,
        (void (*)(void *))func_020727e8);

    pool->tail = 0;
    pool->head = 0;
    pool->freeEntries = pool->entries;
    pool->allocatedCount = 0;

    for (i = 0; i < GRAPHICS_INDEXED_CHAIN_CAPACITY; i++) {
        pool->entries[i].index = i;
    }
    for (i = 0; i < GRAPHICS_INDEXED_CHAIN_CAPACITY - 1; i++) {
        pool->entries[i].next = &pool->entries[i + 1];
    }
    return pool;
}

/*
 * Take up to requestedCount descriptors. Append the first as an active root,
 * store mode on that root, and connect later descriptors through chainNext.
 * Returns the root or null, and counts every descriptor obtained. Exhaustion
 * returns a shorter chain. Confirmed callers pass a positive requestedCount;
 * retail zero-count behavior consumes the free list because this is do-while.
 */
#ifndef MATCHING
GraphicsIndexedChainEntry *func_0207287c(GraphicsIndexedChainPool *pool,
                                         s32 requestedCount, u8 mode)
{
    GraphicsIndexedChainEntry *head = pool->head;
    GraphicsIndexedChainEntry *tail = pool->tail;
    GraphicsIndexedChainEntry *freeEntry = pool->freeEntries;
    u32 allocatedCount = pool->allocatedCount;
    GraphicsIndexedChainEntry *root = 0;
    GraphicsIndexedChainEntry *previous = 0;

    do {
        GraphicsIndexedChainEntry *entry = freeEntry;

        if (entry == 0) {
            break;
        }
        freeEntry = entry->next;
        if (previous != 0) {
            previous->chainNext = entry;
            entry->prev = 0;
        } else {
            root = entry;
            root->mode = mode;
            if (head != 0) {
                tail->next = entry;
            } else {
                head = entry;
            }
            entry->prev = tail;
            tail = entry;
        }
        entry->next = 0;
        entry->chainNext = 0;
        allocatedCount++;
        previous = entry;
    } while (--requestedCount != 0);

    pool->head = head;
    pool->tail = tail;
    pool->freeEntries = freeEntry;
    pool->allocatedCount = allocatedCount;
    return root;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm GraphicsIndexedChainEntry *func_0207287c(GraphicsIndexedChainPool *pool,
                                             s32 requestedCount, u8 mode)
{
    stmdb sp!, {r4, r5, r6, r7, r8, r9}
    mov r12, r0
    mov r0, #0
    ldr r3, [r12, #0x140]
    ldr r4, [r12, #0x144]
    ldr r5, [r12, #0x148]
    ldr r6, [r12, #0x14c]
    mov r7, #0
    mov r9, #0
    movs r8, r5
    beq indexed_chain_allocate_done
    ldr r5, [r5, #4]
    cmp r7, #0
    beq indexed_chain_allocate_first
    str r8, [r7, #8]
    str r9, [r8, #0]
    b indexed_chain_allocate_common
indexed_chain_allocate_first:
    mov r0, r8
    strb r2, [r0, #0x11]
    cmp r3, #0
    strne r8, [r4, #4]
    moveq r3, r8
    str r4, [r8, #0]
    mov r4, r8
indexed_chain_allocate_common:
    str r9, [r8, #4]
    str r9, [r8, #8]
    add r6, r6, #1
    mov r7, r8
    subs r1, r1, #1
    DCD 0x1AFFFFEA
indexed_chain_allocate_done:
    str r3, [r12, #0x140]
    str r4, [r12, #0x144]
    str r5, [r12, #0x148]
    str r6, [r12, #0x14c]
    ldmia sp!, {r4, r5, r6, r7, r8, r9}
    bx lr
}
#endif

/*
 * Remove non-null root from the active list, then return root and every
 * chainNext descriptor to the free-list head. All returned links are detached
 * and allocatedCount is decremented per descriptor. Payloads remain intact;
 * there is no SDK or graphics-hardware operation.
 */
#ifndef MATCHING
void func_0207290c(GraphicsIndexedChainPool *pool,
                   GraphicsIndexedChainEntry *root)
{
    GraphicsIndexedChainEntry *head;
    GraphicsIndexedChainEntry *tail;
    GraphicsIndexedChainEntry *freeEntry;
    u32 allocatedCount;
    GraphicsIndexedChainEntry *prev;
    GraphicsIndexedChainEntry *next;

    if (root == 0) {
        return;
    }

    head = pool->head;
    tail = pool->tail;
    freeEntry = pool->freeEntries;
    allocatedCount = pool->allocatedCount;
    prev = root->prev;
    next = root->next;
    if (prev != 0) {
        prev->next = next;
    } else {
        head = next;
    }
    if (next != 0) {
        next->prev = prev;
    } else {
        tail = prev;
    }

    do {
        GraphicsIndexedChainEntry *chainNext = root->chainNext;

        if (freeEntry != 0) {
            freeEntry->prev = root;
        }
        root->prev = 0;
        root->next = freeEntry;
        root->chainNext = 0;
        freeEntry = root;
        allocatedCount--;
        root = chainNext;
    } while (root != 0);

    pool->head = head;
    pool->tail = tail;
    pool->freeEntries = freeEntry;
    pool->allocatedCount = allocatedCount;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void func_0207290c(GraphicsIndexedChainPool *pool,
                       GraphicsIndexedChainEntry *root)
{
    cmp r1, #0
    bxeq lr
    stmdb sp!, {r4, r5, r6, r7, r8, r9}
    ldr r2, [r0, #0x140]
    ldr r3, [r0, #0x144]
    ldr r4, [r0, #0x148]
    ldr r5, [r0, #0x14c]
    ldr r6, [r1, #0]
    ldr r7, [r1, #4]
    cmp r6, #0
    strne r7, [r6, #4]
    moveq r2, r7
    cmp r7, #0
    strne r6, [r7, #0]
    moveq r3, r6
    mov r9, #0
    ldr r8, [r1, #8]
    cmp r4, #0
    strne r1, [r4, #0]
    str r9, [r1, #0]
    str r4, [r1, #4]
    str r9, [r1, #8]
    mov r4, r1
    sub r5, r5, #1
    movs r1, r8
    DCD 0x1AFFFFF5
    str r2, [r0, #0x140]
    str r3, [r0, #0x144]
    str r4, [r0, #0x148]
    str r5, [r0, #0x14c]
    ldmia sp!, {r4, r5, r6, r7, r8, r9}
    bx lr
}
#endif
