#include "tingle/graphics_sprite_region_allocator.h"

/*
 * Fixed-capacity address-range allocator backed by 32 stable descriptors. It
 * manages one initial 0x20000-unit free region, splits on allocation when a
 * spare descriptor exists, reference-counts live regions, and coalesces free
 * neighbors on final release.
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
 * Construct all 32 descriptors, link descriptors 1..31 as the spare list,
 * and expose descriptor zero as one free region at offset zero with size
 * 0x20000. Return allocator. Construction uses the Metrowerks array runtime;
 * no heap, graphics hardware, or SDK graphics operation is involved.
 */
GraphicsSpriteRegionAllocator *func_0207671c(
    GraphicsSpriteRegionAllocator *allocator)
{
    s32 i;

    __construct_array(allocator->regions, 32, sizeof(GraphicsSpriteRegion),
                      (void (*)(void *))func_020766f4,
                      (void (*)(void *))func_02076718);
    allocator->freeHead = &allocator->regions[1];
    for (i = 1; i < 31; i++) {
        allocator->regions[i].next = &allocator->regions[i + 1];
    }
    allocator->regions[0].size = 0x20000;
    allocator->regions[0].type = 0;
    allocator->regionCount = 1;
    return allocator;
}

/*
 * Allocate the first free region large enough for size, assigning owner and
 * the 16-bit type and setting one reference. Split its tail only when a spare
 * descriptor exists and the remainder is positive; descriptor exhaustion
 * deliberately grants the whole selected region. Return the selected region,
 * or null when no free region fits. Only allocator metadata changes.
 */
#ifndef MATCHING
GraphicsSpriteRegion *func_0207679c(GraphicsSpriteRegionAllocator *allocator,
                                    u32 size, void *owner, u16 type)
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
asm GraphicsSpriteRegion *func_0207679c(
    GraphicsSpriteRegionAllocator *allocator, u32 size, void *owner, u16 type)
{
    stmdb sp!, {r4, r5}
    mov r4, r0
sprite_region_allocate_test:
    ldrh r5, [r0, #0x14]
    cmp r5, #0
    bne sprite_region_allocate_next
    ldr r5, [r0, #0x10]
    subs r5, r5, r1
    bge sprite_region_allocate_found
sprite_region_allocate_next:
    ldr r0, [r0, #4]
    cmp r0, #0
    /* Hand encoded to avoid MWCC's backward-label fallthrough branch. */
    DCD 0x1AFFFFF6
    ldmia sp!, {r4, r5}
    bx lr
sprite_region_allocate_found:
    str r2, [r0, #8]
    strh r3, [r0, #0x14]
    mov r2, #1
    strh r2, [r0, #0x16]
    ldr r2, [r4, #0x300]
    cmp r2, #0
    beq sprite_region_allocate_return
    cmp r5, #0
    ble sprite_region_allocate_return
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
sprite_region_allocate_return:
    ldmia sp!, {r4, r5}
    bx lr
}
#endif

/*
 * Drop one 16-bit reference from region. On the final reference, mark it free,
 * merge a free successor first and then a free predecessor, returning removed
 * descriptors to the spare list and decrementing regionCount for each merge.
 * Null is ignored. Releasing a zero-reference region underflows in retail code
 * and is outside the valid contract. No hardware or SDK effects occur.
 */
#ifndef MATCHING
void func_0207684c(GraphicsSpriteRegionAllocator *allocator,
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
asm void func_0207684c(GraphicsSpriteRegionAllocator *allocator,
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
    beq sprite_region_release_predecessor
    ldrh r3, [r2, #0x14]
    cmp r3, #0
    bne sprite_region_release_predecessor
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
    str r3, [r2]
    str r2, [r0, #0x300]
    ldr r3, [r0, #0x304]
    sub r3, r3, #1
    str r3, [r0, #0x304]
sprite_region_release_predecessor:
    ldr r2, [r1]
    cmp r2, #0
    beq sprite_region_release_return
    ldrh r3, [r2, #0x14]
    cmp r3, #0
    bne sprite_region_release_return
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
sprite_region_release_return:
    bx lr
}
#endif
