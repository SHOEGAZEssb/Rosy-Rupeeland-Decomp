#include "tingle/graphics_sprite_small_region_allocator.h"

/*
 * Second fixed 32-descriptor region allocator. It mirrors the adjacent
 * allocator's first-fit, split, reference, and coalescing behavior but starts
 * with a smaller 0x4000-unit free range and clears a merged successor's owner.
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
 * Zero all links, ownership, range, type, and reference fields and return the
 * descriptor. No allocation, hardware access, or SDK graphics effect occurs.
 */
GraphicsSpriteRegion *func_02076920(GraphicsSpriteRegion *region)
{
    region->next = 0;
    region->previous = 0;
    region->owner = 0;
    region->size = 0;
    region->offset = 0;
    region->type = 0;
    region->references = 0;
    return region;
}

/* No-op descriptor destructor; its input is ignored and no state changes. */
void func_02076944(GraphicsSpriteRegion *region)
{
    (void)region;
}

/*
 * Construct 32 descriptors, link descriptors 1..31 as spare metadata, and
 * expose descriptor zero as a free 0x4000-unit region. Return allocator. The
 * Metrowerks array runtime performs construction; no heap or hardware is used.
 */
GraphicsSpriteSmallRegionAllocator *func_02076948(
    GraphicsSpriteSmallRegionAllocator *allocator)
{
    s32 i;

    __construct_array(allocator->regions, 32, sizeof(GraphicsSpriteRegion),
                      (void (*)(void *))func_02076920,
                      (void (*)(void *))func_02076944);
    allocator->freeHead = &allocator->regions[1];
    for (i = 1; i < 31; i++) {
        allocator->regions[i].next = &allocator->regions[i + 1];
    }
    allocator->regions[0].size = 0x4000;
    allocator->regionCount = 1;
    return allocator;
}

/*
 * Allocate the first free region large enough for size, store owner and the
 * 16-bit type, and establish one reference. Split only when a spare descriptor
 * exists and the remainder is positive; otherwise grant the entire region.
 * Return the selected region or null when no region fits. Only metadata changes.
 */
#ifndef MATCHING
GraphicsSpriteRegion *func_020769c0(
    GraphicsSpriteSmallRegionAllocator *allocator, u32 size, void *owner,
    u16 type)
{
    GraphicsSpriteRegion *region = &allocator->regions[0];
    s32 remainder;

    while (region->type != 0 || region->size < size) {
        region = region->next;
        if (region == 0) {
            return 0;
        }
    }

    remainder = region->size - size;
    region->owner = owner;
    region->type = type;
    region->references = 1;
    if (allocator->freeHead != 0 && remainder > 0) {
        GraphicsSpriteRegion *tail = allocator->freeHead;

        allocator->freeHead = tail->next;
        tail->owner = 0;
        tail->type = 0;
        tail->references = 0;
        tail->size = remainder;
        tail->offset = region->offset + size;
        tail->previous = region;
        tail->next = region->next;
        if (tail->next != 0) {
            tail->next->previous = tail;
        }
        region->next = tail;
        region->size = size;
        allocator->regionCount++;
    }
    return region;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm GraphicsSpriteRegion *func_020769c0(
    GraphicsSpriteSmallRegionAllocator *allocator, u32 size, void *owner,
    u16 type)
{
    stmdb sp!, {r4, r5}
    mov r4, r0
sprite_small_region_allocate_test:
    ldrh r5, [r0, #0x14]
    cmp r5, #0
    bne sprite_small_region_allocate_next
    ldr r5, [r0, #0x10]
    subs r5, r5, r1
    bge sprite_small_region_allocate_found
sprite_small_region_allocate_next:
    ldr r0, [r0, #4]
    cmp r0, #0
    /* Hand encoded to avoid MWCC's backward-label fallthrough branch. */
    DCD 0x1AFFFFF6
    ldmia sp!, {r4, r5}
    bx lr
sprite_small_region_allocate_found:
    str r2, [r0, #8]
    strh r3, [r0, #0x14]
    mov r2, #1
    strh r2, [r0, #0x16]
    ldr r2, [r4, #0x300]
    cmp r2, #0
    beq sprite_small_region_allocate_return
    cmp r5, #0
    ble sprite_small_region_allocate_return
    ldr r3, [r2, #4]
    str r3, [r4, #0x300]
    mov r3, #0
    str r3, [r2, #8]
    strh r3, [r2, #0x14]
    strh r3, [r2, #0x16]
    str r5, [r2, #0x10]
    ldr r3, [r0, #0x0c]
    add r3, r3, r1
    str r3, [r2, #0x0c]
    str r0, [r2]
    ldr r3, [r0, #4]
    str r3, [r2, #4]
    cmp r3, #0
    strne r2, [r3]
    str r2, [r0, #4]
    str r1, [r0, #0x10]
    ldr r1, [r4, #0x304]
    add r1, r1, #1
    str r1, [r4, #0x304]
sprite_small_region_allocate_return:
    ldmia sp!, {r4, r5}
    bx lr
}
#endif

/*
 * Drop one reference and, at zero, mark the region free. Merge a free
 * successor before a free predecessor and recycle each removed descriptor.
 * When a successor is merged, this variant also clears the surviving released
 * region's owner; it does not perform that clear on the predecessor-only path.
 * Null is ignored; releasing a zero-reference region underflows and is outside
 * the valid contract.
 */
#ifndef MATCHING
void func_02076a70(GraphicsSpriteSmallRegionAllocator *allocator,
                   GraphicsSpriteRegion *region)
{
    GraphicsSpriteRegion *neighbor;

    if (region == 0) {
        return;
    }
    region->references--;
    if (region->references != 0) {
        return;
    }
    region->type = 0;

    neighbor = region->next;
    if (neighbor != 0 && neighbor->type == 0) {
        region->size += neighbor->size;
        region->next = neighbor->next;
        if (region->next != 0) {
            region->next->previous = region;
        }
        neighbor->next = allocator->freeHead;
        region->owner = 0;
        neighbor->previous = 0;
        allocator->freeHead = neighbor;
        allocator->regionCount--;
    }

    neighbor = region->previous;
    if (neighbor != 0 && neighbor->type == 0) {
        neighbor->size += region->size;
        neighbor->next = region->next;
        if (neighbor->next != 0) {
            neighbor->next->previous = neighbor;
        }
        region->next = allocator->freeHead;
        region->previous = 0;
        allocator->freeHead = region;
        allocator->regionCount--;
    }
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void func_02076a70(GraphicsSpriteSmallRegionAllocator *allocator,
                       GraphicsSpriteRegion *region)
{
    cmp r1, #0
    bxeq lr
    ldrh r2, [r1, #0x16]
    subs r2, r2, #1
    strh r2, [r1, #0x16]
    bxne lr
    mov r2, #0
    strh r2, [r1, #0x14]
    ldr r2, [r1, #4]
    cmp r2, #0
    beq sprite_small_region_release_predecessor
    ldrh r3, [r2, #0x14]
    cmp r3, #0
    bne sprite_small_region_release_predecessor
    ldr r3, [r1, #0x10]
    ldr r12, [r2, #0x10]
    add r3, r3, r12
    str r3, [r1, #0x10]
    ldr r3, [r2, #4]
    str r3, [r1, #4]
    cmp r3, #0
    strne r1, [r3]
    ldr r3, [r0, #0x300]
    str r3, [r2, #4]
    mov r3, #0
    str r3, [r1, #8]
    str r3, [r2]
    str r2, [r0, #0x300]
    ldr r3, [r0, #0x304]
    sub r3, r3, #1
    str r3, [r0, #0x304]
sprite_small_region_release_predecessor:
    ldr r2, [r1]
    cmp r2, #0
    beq sprite_small_region_release_return
    ldrh r3, [r2, #0x14]
    cmp r3, #0
    bne sprite_small_region_release_return
    ldr r3, [r1, #0x10]
    ldr r12, [r2, #0x10]
    add r3, r3, r12
    str r3, [r2, #0x10]
    ldr r3, [r1, #4]
    str r3, [r2, #4]
    cmp r3, #0
    strne r2, [r3]
    ldr r3, [r0, #0x300]
    str r3, [r1, #4]
    mov r3, #0
    str r3, [r1]
    str r1, [r0, #0x300]
    ldr r3, [r0, #0x304]
    sub r3, r3, #1
    str r3, [r0, #0x304]
sprite_small_region_release_return:
    bx lr
}
#endif
