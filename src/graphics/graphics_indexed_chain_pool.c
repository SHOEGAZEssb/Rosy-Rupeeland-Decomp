#include "tingle/graphics_indexed_chain_pool.h"

/*
 * Sixteen-entry graphics descriptor pool. Allocations append one active root
 * and optionally chain more descriptors from it; each descriptor retains a
 * stable descriptor index assigned at construction. Roots retain palette
 * resources, a byte reference count, and their palette binding mode.
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
 * Clear all links, the resource pointer, and three payload bytes in entry.
 * The descriptor changes in place; there is no return value or hardware I/O.
 */
void GraphicsIndexedChainEntry_Init(GraphicsIndexedChainEntry *entry)
{
    entry->chainNext = 0;
    entry->nextOrFreeNext = 0;
    entry->previousOrFreePrevious = 0;
    entry->resource = 0;
    entry->referenceCount = 0;
    entry->bindingMode = 0;
    entry->descriptorIndex = 0;
}

/*
 * No-op descriptor destructor used by the Metrowerks array runtime. It changes
 * no state, returns no value, and has no SDK or graphics-hardware effects.
 */
void GraphicsIndexedChainEntry_Destroy(GraphicsIndexedChainEntry *entry)
{
    (void)entry;
}

/*
 * Construct all 16 descriptors, assign stable indices 0..15, build the free
 * list, and initialize an empty active-root list. Returns pool and performs no
 * graphics operation beyond invoking the compiler's array runtime.
 */
GraphicsIndexedChainPool *GraphicsIndexedChainPool_Init(
    GraphicsIndexedChainPool *pool)
{
    u8 i;

    __construct_array(
        pool->entries, GRAPHICS_INDEXED_CHAIN_CAPACITY,
        sizeof(GraphicsIndexedChainEntry),
        (void (*)(void *))GraphicsIndexedChainEntry_Init,
        (void (*)(void *))GraphicsIndexedChainEntry_Destroy);

    pool->tail = 0;
    pool->head = 0;
    pool->freeHead = pool->entries;
    pool->allocatedEntryCount = 0;

    for (i = 0; i < GRAPHICS_INDEXED_CHAIN_CAPACITY; i++) {
        pool->entries[i].descriptorIndex = i;
    }
    for (i = 0; i < GRAPHICS_INDEXED_CHAIN_CAPACITY - 1; i++) {
        pool->entries[i].nextOrFreeNext = &pool->entries[i + 1];
    }
    return pool;
}

/*
 * Take up to requestedCount descriptors. Append the first as an active root,
 * store bindingMode on that root, and connect later descriptors through
 * chainNext.
 * Returns the root or null, and counts every descriptor obtained. Exhaustion
 * returns a shorter chain. Confirmed callers pass a positive requestedCount;
 * retail zero-count behavior consumes the free list because this is do-while.
 */
#ifndef MATCHING
GraphicsIndexedChainEntry *GraphicsIndexedChainPool_AllocateChain(
    GraphicsIndexedChainPool *pool, s32 requestedCount, u8 bindingMode)
{
    GraphicsIndexedChainEntry *head = pool->head;
    GraphicsIndexedChainEntry *tail = pool->tail;
    GraphicsIndexedChainEntry *freeEntry = pool->freeHead;
    u32 allocatedEntryCount = pool->allocatedEntryCount;
    GraphicsIndexedChainEntry *root = 0;
    GraphicsIndexedChainEntry *previous = 0;

    do {
        GraphicsIndexedChainEntry *entry = freeEntry;

        if (entry == 0) {
            break;
        }
        freeEntry = entry->nextOrFreeNext;
        if (previous != 0) {
            previous->chainNext = entry;
            entry->previousOrFreePrevious = 0;
        } else {
            root = entry;
            root->bindingMode = bindingMode;
            if (head != 0) {
                tail->nextOrFreeNext = entry;
            } else {
                head = entry;
            }
            entry->previousOrFreePrevious = tail;
            tail = entry;
        }
        entry->nextOrFreeNext = 0;
        entry->chainNext = 0;
        allocatedEntryCount++;
        previous = entry;
    } while (--requestedCount != 0);

    pool->head = head;
    pool->tail = tail;
    pool->freeHead = freeEntry;
    pool->allocatedEntryCount = allocatedEntryCount;
    return root;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm GraphicsIndexedChainEntry *GraphicsIndexedChainPool_AllocateChain(
    GraphicsIndexedChainPool *pool, s32 requestedCount, u8 bindingMode)
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
 * and allocatedEntryCount is decremented per descriptor. Payloads remain intact;
 * there is no SDK or graphics-hardware operation.
 */
#ifndef MATCHING
void GraphicsIndexedChainPool_ReleaseChain(GraphicsIndexedChainPool *pool,
                                           GraphicsIndexedChainEntry *root)
{
    GraphicsIndexedChainEntry *head;
    GraphicsIndexedChainEntry *tail;
    GraphicsIndexedChainEntry *freeEntry;
    u32 allocatedEntryCount;
    GraphicsIndexedChainEntry *prev;
    GraphicsIndexedChainEntry *next;

    if (root == 0) {
        return;
    }

    head = pool->head;
    tail = pool->tail;
    freeEntry = pool->freeHead;
    allocatedEntryCount = pool->allocatedEntryCount;
    prev = root->previousOrFreePrevious;
    next = root->nextOrFreeNext;
    if (prev != 0) {
        prev->nextOrFreeNext = next;
    } else {
        head = next;
    }
    if (next != 0) {
        next->previousOrFreePrevious = prev;
    } else {
        tail = prev;
    }

    do {
        GraphicsIndexedChainEntry *chainNext = root->chainNext;

        if (freeEntry != 0) {
            freeEntry->previousOrFreePrevious = root;
        }
        root->previousOrFreePrevious = 0;
        root->nextOrFreeNext = freeEntry;
        root->chainNext = 0;
        freeEntry = root;
        allocatedEntryCount--;
        root = chainNext;
    } while (root != 0);

    pool->head = head;
    pool->tail = tail;
    pool->freeHead = freeEntry;
    pool->allocatedEntryCount = allocatedEntryCount;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void GraphicsIndexedChainPool_ReleaseChain(GraphicsIndexedChainPool *pool,
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
