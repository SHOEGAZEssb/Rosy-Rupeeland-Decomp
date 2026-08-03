#include "tingle/graphics_vram_allocator.h"

/*
 * Fixed-capacity best-fit allocator for a 128 KiB graphics-VRAM range. The
 * allocator tracks 0x400 128-byte blocks in an address-ordered list and uses
 * the remaining nodes as a descriptor free list. Allocations carry an owner,
 * a type byte, and a reference count; final release coalesces free neighbors.
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
 * Clear every link and allocation field in node. The constructor mutates the
 * supplied descriptor, returns no value, and has no SDK or hardware effects.
 */
void func_02072188(GraphicsVramRangeNode *node)
{
    node->next = 0;
    node->prev = 0;
    node->owner = 0;
    node->field_0c = 0;
    node->type = 0;
    node->refCount = 0;
    node->blockCount = 0;
    node->blockStart = 0;
}

/*
 * No-op descriptor destructor used by the Metrowerks array-construction
 * runtime. It accepts one node, changes no state, and returns no value.
 */
void func_020721b0(GraphicsVramRangeNode *node)
{
    (void)node;
}

/*
 * Construct all 96 descriptors, make nodes 1..95 the descriptor free list,
 * and expose node 0 as one free range spanning all 0x400 blocks. The allocator
 * is mutated in place and returned; only the compiler array runtime is used.
 */
GraphicsVramAllocator *func_020721b4(GraphicsVramAllocator *allocator)
{
    s32 i;

    __construct_array(
        allocator->nodes, GRAPHICS_VRAM_RANGE_CAPACITY,
        sizeof(GraphicsVramRangeNode),
        (void (*)(void *))func_02072188,
        (void (*)(void *))func_020721b0);

    allocator->freeNodes = &allocator->nodes[1];
    for (i = 1; i < GRAPHICS_VRAM_RANGE_CAPACITY - 1; i++) {
        allocator->nodes[i].next = &allocator->nodes[i + 1];
    }

    allocator->nodes[0].blockCount = GRAPHICS_VRAM_BLOCK_COUNT;
    allocator->nodes[0].type = 0;
    allocator->rangeCount = 1;
    return allocator;
}

/*
 * Allocate the smallest free range with at least blockCount blocks, attach
 * owner and type, set its reference count to one, and return its descriptor.
 * A larger range is split only when a spare descriptor is available; without
 * one, the caller receives the entire range. Returns null when no range fits.
 * This updates allocator metadata but does not directly touch VRAM hardware.
 */
#ifndef MATCHING
GraphicsVramRangeNode *func_02072234(GraphicsVramAllocator *allocator,
                                    s32 blockCount, void *owner, u8 type)
{
    GraphicsVramRangeNode *node = (GraphicsVramRangeNode *)allocator;
    GraphicsVramRangeNode *best = 0;
    s32 bestBlockCount = 0x1000;

    while (node != 0) {
        if (node->type == 0) {
            s32 candidateBlockCount = node->blockCount;

            if (candidateBlockCount < bestBlockCount &&
                candidateBlockCount >= blockCount) {
                best = node;
                bestBlockCount = candidateBlockCount;
                if (candidateBlockCount == blockCount) {
                    break;
                }
            }
        }
        node = node->next;
    }

    if (best != 0) {
        GraphicsVramRangeNode *split;
        s32 remaining;

        node = best;
        node->owner = owner;
        node->type = type;
        node->field_0c = 0;
        node->refCount = 1;

        split = allocator->freeNodes;
        if (split != 0) {
            remaining = bestBlockCount - blockCount;
            if (remaining > 0) {
                allocator->freeNodes = split->next;
                split->owner = 0;
                split->type = 0;
                split->blockCount = (u16)remaining;
                split->refCount = 0;
                split->blockStart = (u16)(node->blockStart + blockCount);
                split->prev = node;
                split->next = node->next;
                if (split->next != 0) {
                    split->next->prev = split;
                }
                node->next = split;
                node->blockCount = (u16)blockCount;
                allocator->rangeCount++;
            }
        }
    }

    return node;
}
#else
/*
 * This matching fallback implements the documented portable C directly above.
 * MWCC inserts a fallthrough branch for a named backward target, so the DCD
 * below hand-encodes `bne` 15 instructions back as ARM word 0x1AFFFFF1.
 */
asm GraphicsVramRangeNode *func_02072234(GraphicsVramAllocator *allocator,
                                        s32 blockCount, void *owner, u8 type)
{
    stmdb sp!, {r4, r5, r6, r7}
    mov r4, r0
    mov r6, #0
    mov r7, #0x1000
    ldrb r5, [r0, #0xd]
    cmp r5, #0
    bne vram_alloc_next
    ldrh r5, [r0, #0x10]
    cmp r5, r7
    bge vram_alloc_next
    cmp r5, r1
    blt vram_alloc_next
    mov r6, r0
    mov r7, r5
    beq vram_alloc_commit
vram_alloc_next:
    ldr r0, [r0, #4]
    cmp r0, #0
    DCD 0x1AFFFFF1
    cmp r6, #0
    beq vram_alloc_done
vram_alloc_commit:
    mov r0, r6
    str r2, [r0, #8]
    strb r3, [r0, #0xd]
    mov r2, #0
    strb r2, [r0, #0xc]
    mov r2, #1
    strh r2, [r0, #0x12]
    ldr r2, [r4, #0x780]
    cmp r2, #0
    beq vram_alloc_done
    subs r5, r7, r1
    ble vram_alloc_done
    ldr r3, [r2, #4]
    str r3, [r4, #0x780]
    mov r3, #0
    str r3, [r2, #8]
    strb r3, [r2, #0xd]
    strh r5, [r2, #0x10]
    strh r3, [r2, #0x12]
    ldrh r3, [r0, #0xe]
    add r3, r3, r1
    strh r3, [r2, #0xe]
    str r0, [r2, #0]
    ldr r3, [r0, #4]
    str r3, [r2, #4]
    cmp r3, #0
    strne r2, [r3, #0]
    str r2, [r0, #4]
    strh r1, [r0, #0x10]
    ldr r1, [r4, #0x784]
    add r1, r1, #1
    str r1, [r4, #0x784]
vram_alloc_done:
    ldmia sp!, {r4, r5, r6, r7}
    bx lr
}
#endif

/*
 * Drop one reference to node. A non-final release only updates refCount. On
 * the final release, mark the range free, merge a free successor and then a
 * free predecessor, recycle removed descriptors, and update rangeCount. A
 * null node is ignored; the function returns no value or direct SDK result.
 */
#ifndef MATCHING
void func_0207230c(GraphicsVramAllocator *allocator,
                   GraphicsVramRangeNode *node)
{
    u16 refCount;

    if (node == 0) {
        return;
    }

    refCount = (u16)(node->refCount - 1);
    node->refCount = refCount;
    if (refCount != 0) {
        return;
    }

    node->type = 0;

    if (node->next != 0 && node->next->type == 0) {
        GraphicsVramRangeNode *removed = node->next;

        node->blockCount = (u16)(node->blockCount + removed->blockCount);
        node->next = removed->next;
        if (node->next != 0) {
            node->next->prev = node;
        }
        removed->next = allocator->freeNodes;
        removed->prev = 0;
        allocator->freeNodes = removed;
        allocator->rangeCount--;
    }

    if (node->prev != 0 && node->prev->type == 0) {
        GraphicsVramRangeNode *merged = node->prev;

        merged->blockCount = (u16)(merged->blockCount + node->blockCount);
        merged->next = node->next;
        if (merged->next != 0) {
            merged->next->prev = merged;
        }
        node->next = allocator->freeNodes;
        node->prev = 0;
        allocator->freeNodes = node;
        allocator->rangeCount--;
    }
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void func_0207230c(GraphicsVramAllocator *allocator,
                       GraphicsVramRangeNode *node)
{
    cmp r1, #0
    bxeq lr
    ldrh r2, [r1, #0x12]
    subs r2, r2, #1
    strh r2, [r1, #0x12]
    bxne lr
    mov r2, #0
    strb r2, [r1, #0xd]
    ldr r2, [r1, #4]
    cmp r2, #0
    beq vram_release_check_prev
    ldrb r3, [r2, #0xd]
    cmp r3, #0
    bne vram_release_check_prev
    ldrh r3, [r1, #0x10]
    ldrh r12, [r2, #0x10]
    add r3, r3, r12
    strh r3, [r1, #0x10]
    ldr r3, [r2, #4]
    str r3, [r1, #4]
    cmp r3, #0
    strne r1, [r3, #0]
    ldr r3, [r0, #0x780]
    str r3, [r2, #4]
    mov r3, #0
    str r3, [r2, #0]
    str r2, [r0, #0x780]
    ldr r3, [r0, #0x784]
    sub r3, r3, #1
    str r3, [r0, #0x784]
vram_release_check_prev:
    ldr r2, [r1, #0]
    cmp r2, #0
    beq vram_release_done
    ldrb r3, [r2, #0xd]
    cmp r3, #0
    bne vram_release_done
    ldrh r3, [r1, #0x10]
    ldrh r12, [r2, #0x10]
    add r3, r3, r12
    strh r3, [r2, #0x10]
    ldr r3, [r1, #4]
    str r3, [r2, #4]
    cmp r3, #0
    strne r2, [r3, #0]
    ldr r3, [r0, #0x780]
    str r3, [r1, #4]
    mov r3, #0
    str r3, [r1, #0]
    str r1, [r0, #0x780]
    ldr r3, [r0, #0x784]
    sub r3, r3, #1
    str r3, [r0, #0x784]
vram_release_done:
    bx lr
}
#endif
