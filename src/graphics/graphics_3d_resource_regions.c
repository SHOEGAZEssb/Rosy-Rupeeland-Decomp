#include "tingle/graphics_3d_resource_owner.h"

/*
 * Lookup, reference acquisition, allocation, and initial NDS texture/palette
 * upload for resources managed by Graphics3DResourceOwner. Existing regions
 * are shared by incrementing their 16-bit reference counts.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern u32 func_0207043c(void *resource);
extern void *GraphicsBgResourceData_GetDecoded(void *resource);
extern u32 func_02070888(void *resource);
extern void func_020b239c(void);
extern void func_020b2238(const void *source, u32 destination, u32 size);
extern void func_020b21c8(void);
extern void func_020b2180(void);
extern void func_020b210c(const void *source, u32 destination, u32 size);
extern void func_020b20b4(void);

#ifdef __cplusplus
}
#endif

/*
 * Acquire a type-1 texture region for resource. Reuse increments the 16-bit
 * reference count. A miss queries the resource byte size, allocates from the
 * large region allocator, and performs one inferred begin/load/end texture
 * upload from resource offset 0x24 to the allocated offset. Retail assumes a
 * non-null resource and successful allocation.
 */
#ifndef MATCHING
GraphicsSpriteRegion *Graphics3DResourceOwner_AcquireTextureRegion(
    Graphics3DResourceOwner *owner, void *resource)
{
    GraphicsSpriteRegion *region = Graphics3DResourceOwner_FindTextureRegion(owner, resource, 1);

    if (region == 0) {
        u32 size = func_0207043c(resource);

        region = GraphicsSpriteRegionAllocator_Allocate(&owner->textureRegions, size, resource, 1);
        size = func_0207043c(resource);
        func_020b239c();
        func_020b2238(*(void **)((u8 *)resource + 0x24), region->offset, size);
        func_020b21c8();
    } else {
        region->references++;
    }
    return region;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm GraphicsSpriteRegion *Graphics3DResourceOwner_AcquireTextureRegion(
    Graphics3DResourceOwner *owner, void *resource)
{
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r2, #1
    mov r6, r0
    mov r4, r1
    bl Graphics3DResourceOwner_FindTextureRegion
    movs r5, r0
    ldrneh r0, [r5, #0x16]
    addne r0, r0, #1
    strneh r0, [r5, #0x16]
    bne graphics_3d_texture_region_acquire_return
    mov r0, r4
    bl func_0207043c
    mov r1, r0
    mov r2, r4
    add r0, r6, #0x14
    mov r3, #1
    bl GraphicsSpriteRegionAllocator_Allocate
    mov r5, r0
    mov r0, r4
    bl func_0207043c
    ldr r6, [r4, #0x24]
    ldr r7, [r5, #0xc]
    mov r4, r0
    bl func_020b239c
    mov r0, r6
    mov r1, r7
    mov r2, r4
    bl func_020b2238
    bl func_020b21c8
graphics_3d_texture_region_acquire_return:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
}
#endif

/*
 * Find the first texture-region descriptor whose 16-bit type and owner pointer
 * match. Search starts at the embedded descriptor zero and follows address-list
 * next links; return the matching stable descriptor or null. No state changes.
 */
#ifndef MATCHING
GraphicsSpriteRegion *Graphics3DResourceOwner_FindTextureRegion(
    Graphics3DResourceOwner *owner, void *resource, u16 type)
{
    GraphicsSpriteRegion *region = &owner->textureRegions.regions[0];

    while (region != 0) {
        if (region->type == type && region->owner == resource) {
            return region;
        }
        region = region->next;
    }
    return 0;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm GraphicsSpriteRegion *Graphics3DResourceOwner_FindTextureRegion(
    Graphics3DResourceOwner *owner, void *resource, u16 type)
{
    add r0, r0, #0x14
    b graphics_3d_texture_region_find_check
graphics_3d_texture_region_find_loop:
    ldrh r3, [r0, #0x14]
    cmp r2, r3
    ldreq r3, [r0, #8]
    cmpeq r3, r1
    bxeq lr
    ldr r0, [r0, #4]
graphics_3d_texture_region_find_check:
    cmp r0, #0
    /* Hand encoded to avoid MWCC's backward-label fallthrough branch. */
    DCD 0x1AFFFFF7
    bx lr
}
#endif

/*
 * Acquire a palette region by owner identity. Reuse increments the 16-bit
 * reference count without testing type. A miss queries the allocation size,
 * allocates type 1 from the small allocator, resolves upload data separately,
 * and performs one inferred begin/load/end texture-palette upload using the
 * allocated offset and size. Retail assumes successful allocation.
 */
#ifndef MATCHING
GraphicsSpriteRegion *Graphics3DResourceOwner_AcquirePaletteRegion(
    Graphics3DResourceOwner *owner, void *resource)
{
    GraphicsSpriteRegion *region = &owner->paletteRegions.regions[0];

    while (region != 0 && region->owner != resource) {
        region = region->next;
    }
    if (region == 0) {
        u32 size = func_02070888(resource);

        region = GraphicsSpriteSmallRegionAllocator_Allocate(&owner->paletteRegions, size, resource, 1);
        func_020b2180();
        func_020b210c(GraphicsBgResourceData_GetDecoded(resource), region->offset, region->size);
        func_020b20b4();
    } else {
        region->references++;
    }
    return region;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm GraphicsSpriteRegion *Graphics3DResourceOwner_AcquirePaletteRegion(
    Graphics3DResourceOwner *owner, void *resource)
{
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    mov r4, r1
    add r5, r6, #0x31c
    b graphics_3d_palette_region_find_check
graphics_3d_palette_region_find_loop:
    ldr r0, [r5, #8]
    cmp r0, r4
    beq graphics_3d_palette_region_found
    ldr r5, [r5, #4]
graphics_3d_palette_region_find_check:
    cmp r5, #0
    /* Hand encoded to avoid MWCC's backward-label fallthrough branch. */
    DCD 0x1AFFFFF9
graphics_3d_palette_region_found:
    cmp r5, #0
    ldrneh r0, [r5, #0x16]
    addne r0, r0, #1
    strneh r0, [r5, #0x16]
    bne graphics_3d_palette_region_acquire_return
    mov r0, r4
    bl func_02070888
    mov r1, r0
    mov r2, r4
    add r0, r6, #0x31c
    mov r3, #1
    bl GraphicsSpriteSmallRegionAllocator_Allocate
    mov r5, r0
    mov r0, r4
    ldr r7, [r5, #0x10]
    ldr r6, [r5, #0xc]
    bl GraphicsBgResourceData_GetDecoded
    mov r4, r0
    bl func_020b2180
    mov r0, r4
    mov r1, r6
    mov r2, r7
    bl func_020b210c
    bl func_020b20b4
graphics_3d_palette_region_acquire_return:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
}
#endif
