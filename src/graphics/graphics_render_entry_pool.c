#include "tingle/graphics_render_entry_pool.h"

/*
 * Fixed-capacity staging pool for graphics render entries. Active root entries
 * form a doubly linked list, while a root may own further entries through a
 * separate chain link. Before command emission the roots are stably ordered by
 * their signed sort keys. Each entry carries a copied sprite OAM template.
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
 * Clear all links, the sort key, and the OAM record in entry. This mutates
 * only the supplied descriptor, returns no value, and has no hardware effects.
 */
void GraphicsRenderEntry_Init(GraphicsRenderEntry *entry)
{
    entry->chainNext = 0;
    entry->nextOrFree = 0;
    entry->previous = 0;
    entry->sortKey = 0;
    ((u32 *)&entry->oamRecord)[0] = 0;
    ((u32 *)&entry->oamRecord)[1] = 0;
}

/*
 * No-op entry destructor used by the Metrowerks array runtime. It changes no
 * state, returns no value, and has no SDK or graphics-hardware effects.
 */
void GraphicsRenderEntry_Destroy(GraphicsRenderEntry *entry)
{
    (void)entry;
}

/*
 * Construct all 128 entries and reset pool to an empty active list backed by
 * one full descriptor free list. The initialized pool is returned; this calls
 * only the compiler's array-construction runtime and does not submit graphics.
 */
GraphicsRenderEntryPool *GraphicsRenderEntryPool_Init(
    GraphicsRenderEntryPool *pool)
{
    __construct_array(
        pool->entries, GRAPHICS_RENDER_ENTRY_CAPACITY,
        sizeof(GraphicsRenderEntry),
        (void (*)(void *))GraphicsRenderEntry_Init,
        (void (*)(void *))GraphicsRenderEntry_Destroy);
    GraphicsRenderEntryPool_Reset(pool);
    return pool;
}

/*
 * Empty the active list, reset the allocation count, and link all descriptors
 * through nextOrFree as the free list. Existing OAM records are not cleared. This
 * mutates pool in place, returns no value, and performs no SDK or hardware I/O.
 */
void GraphicsRenderEntryPool_Reset(GraphicsRenderEntryPool *pool)
{
    s32 i;

    pool->tail = 0;
    pool->head = 0;
    pool->freeHead = pool->entries;
    pool->allocatedCount = 0;

    for (i = 0; i < GRAPHICS_RENDER_ENTRY_CAPACITY - 1; i++) {
        pool->entries[i].nextOrFree = &pool->entries[i + 1];
    }
    pool->entries[GRAPHICS_RENDER_ENTRY_CAPACITY - 1].nextOrFree = 0;
}

/*
 * Remove up to requestedCount descriptors from the free list. The first is
 * appended to the active root list and returned; later descriptors are linked
 * through chainNext. allocatedCount includes both roots and chained entries.
 * Exhaustion returns a shorter chain (or null). Confirmed callers pass a
 * positive count: because the retail loop is do-while, zero would consume the
 * entire free list rather than allocate nothing. No graphics hardware is used.
 */
#ifndef MATCHING
GraphicsRenderEntry *GraphicsRenderEntryPool_AllocateChain(
    GraphicsRenderEntryPool *pool, s32 requestedCount)
{
    GraphicsRenderEntry *head = pool->head;
    GraphicsRenderEntry *tail = pool->tail;
    GraphicsRenderEntry *freeEntry = pool->freeHead;
    u32 allocatedCount = pool->allocatedCount;
    GraphicsRenderEntry *first = 0;
    GraphicsRenderEntry *previous = 0;

    do {
        GraphicsRenderEntry *entry = freeEntry;

        if (entry == 0) {
            break;
        }
        freeEntry = freeEntry->nextOrFree;

        if (previous != 0) {
            previous->chainNext = entry;
            entry->previous = 0;
        } else {
            first = entry;
            if (head != 0) {
                tail->nextOrFree = entry;
            } else {
                head = entry;
            }
            entry->previous = tail;
            tail = entry;
        }

        entry->nextOrFree = 0;
        entry->chainNext = 0;
        allocatedCount++;
        previous = entry;
    } while (--requestedCount != 0);

    pool->head = head;
    pool->tail = tail;
    pool->freeHead = freeEntry;
    pool->allocatedCount = allocatedCount;
    return first;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm GraphicsRenderEntry *GraphicsRenderEntryPool_AllocateChain(
    GraphicsRenderEntryPool *pool, s32 requestedCount)
{
    stmdb sp!, {r4, r5, r6, r7, r8, r9}
    mov r2, r0
    mov r0, #0
    ldr r3, [r2, #0xc00]
    ldr r4, [r2, #0xc04]
    ldr r5, [r2, #0xc08]
    ldr r6, [r2, #0xc0c]
    mov r7, #0
    mov r9, #0
    movs r8, r5
    beq render_entry_allocate_done
    ldr r5, [r5, #4]
    cmp r7, #0
    beq render_entry_allocate_first
    str r8, [r7, #8]
    str r9, [r8, #0]
    b render_entry_allocate_common
render_entry_allocate_first:
    mov r0, r8
    cmp r3, #0
    strne r8, [r4, #4]
    moveq r3, r8
    str r4, [r8, #0]
    mov r4, r8
render_entry_allocate_common:
    str r9, [r8, #4]
    str r9, [r8, #8]
    add r6, r6, #1
    mov r7, r8
    subs r1, r1, #1
    DCD 0x1AFFFFEB
render_entry_allocate_done:
    str r3, [r2, #0xc00]
    str r4, [r2, #0xc04]
    str r5, [r2, #0xc08]
    str r6, [r2, #0xc0c]
    ldmia sp!, {r4, r5, r6, r7, r8, r9}
    bx lr
}
#endif

/*
 * Append a non-null existing entry to the active doubly linked list. This does
 * not change allocatedCount or the free list and returns no value; a null entry
 * is ignored. The operation has no direct SDK or graphics-hardware effects.
 */
#ifndef MATCHING
void GraphicsRenderEntryPool_AppendRoot(GraphicsRenderEntryPool *pool,
                                        GraphicsRenderEntry *entry)
{
    GraphicsRenderEntry *head;
    GraphicsRenderEntry *tail;

    if (entry == 0) {
        return;
    }

    head = pool->head;
    tail = pool->tail;
    if (head == 0) {
        head = entry;
        tail = entry;
        entry->previous = 0;
    } else {
        tail->nextOrFree = entry;
        entry->previous = tail;
        tail = entry;
    }
    entry->nextOrFree = 0;
    pool->head = head;
    pool->tail = tail;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void GraphicsRenderEntryPool_AppendRoot(GraphicsRenderEntryPool *pool,
                                            GraphicsRenderEntry *entry)
{
    cmp r1, #0
    bxeq lr
    mov r12, #0
    ldr r2, [r0, #0xc00]
    ldr r3, [r0, #0xc04]
    cmp r2, #0
    bne render_entry_append_nonempty
    mov r2, r1
    mov r3, r1
    str r12, [r1, #0]
    b render_entry_append_done
render_entry_append_nonempty:
    str r1, [r3, #4]
    str r3, [r1, #0]
    mov r3, r1
render_entry_append_done:
    str r12, [r1, #4]
    str r2, [r0, #0xc00]
    str r3, [r0, #0xc04]
    bx lr
}
#endif

/*
 * Stably sort the active root list by ascending signed sortKey using insertion
 * sort. Equal keys retain their input order. Both list endpoints and affected
 * links are updated in place; chained entries and payloads are unchanged, and
 * the function returns no value or direct graphics-hardware result.
 */
#ifndef MATCHING
void GraphicsRenderEntryPool_SortRoots(GraphicsRenderEntryPool *pool)
{
    GraphicsRenderEntry *head = pool->head;
    GraphicsRenderEntry *tail = pool->tail;
    GraphicsRenderEntry *entry = head;

    while (entry != 0) {
        GraphicsRenderEntry *next = entry->nextOrFree;
        s32 sortKey = entry->sortKey;
        GraphicsRenderEntry *scan = entry->previous;
        GraphicsRenderEntry *insertionPoint = 0;

        while (scan != 0) {
            if (scan->sortKey <= sortKey) {
                break;
            }
            insertionPoint = scan;
            scan = scan->previous;
        }

        if (insertionPoint != 0) {
            GraphicsRenderEntry *beforeInsertion = insertionPoint->previous;
            GraphicsRenderEntry *oldPrev = entry->previous;
            GraphicsRenderEntry *oldNext = entry->nextOrFree;

            if (oldPrev != 0) {
                oldPrev->nextOrFree = oldNext;
            } else {
                head = oldNext;
            }
            if (oldNext != 0) {
                oldNext->previous = oldPrev;
            } else {
                tail = oldPrev;
            }
            if (beforeInsertion != 0) {
                beforeInsertion->nextOrFree = entry;
            } else {
                head = entry;
            }
            insertionPoint->previous = entry;
            entry->previous = beforeInsertion;
            entry->nextOrFree = insertionPoint;
        }

        entry = next;
    }

    pool->head = head;
    pool->tail = tail;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void GraphicsRenderEntryPool_SortRoots(GraphicsRenderEntryPool *pool)
{
    stmdb sp!, {r4, r5, r6, r7, r8, r9}
    ldr r2, [r0, #0xc00]
    ldr r3, [r0, #0xc04]
    movs r1, r2
    beq render_entry_sort_done
    ldr r12, [r1, #4]
    cmp r12, #0
    beq render_entry_sort_done
    ldr r7, [r1, #0xc]
    ldr r4, [r1, #0]
    mov r6, #0
    cmp r4, #0
    beq render_entry_sort_scan_done
    ldr r8, [r4, #0xc]
    cmp r8, r7
    ble render_entry_sort_scan_done
    mov r6, r4
    ldr r4, [r4, #0]
    DCD 0xEAFFFFF7
render_entry_sort_scan_done:
    cmp r6, #0
    beq render_entry_sort_advance
    ldr r9, [r6, #0]
    ldr r4, [r1, #0]
    ldr r5, [r1, #4]
    cmp r4, #0
    strne r5, [r4, #4]
    moveq r2, r5
    cmp r5, #0
    strne r4, [r5, #0]
    moveq r3, r4
    cmp r9, #0
    strne r1, [r9, #4]
    moveq r2, r1
    str r1, [r6, #0]
    str r9, [r1, #0]
    str r6, [r1, #4]
render_entry_sort_advance:
    movs r1, r12
    ldrne r12, [r1, #4]
    DCD 0x1AFFFFE0
render_entry_sort_done:
    str r2, [r0, #0xc00]
    str r3, [r0, #0xc04]
    ldmia sp!, {r4, r5, r6, r7, r8, r9}
    bx lr
}
#endif
