#include "tingle/graphics_3d_resource_owner.h"

/*
 * Heap allocation, region acquisition, rebinding, and destruction for graphics
 * animation instances. Texture and palette resources are reference-counted by
 * the owner's two fixed region allocators; the animation resource is retained
 * directly and does not acquire a region here.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void *Heap_Alloc(u32 size, const char *tag, s32 alignment, void *heap);
extern void Heap_Free(void *allocation);
extern const char gGraphicsAnimationInstanceAllocationTag[];
extern u8 gHeapContext[];
extern GraphicsSpriteRegion *Graphics3DResourceOwner_AcquireTextureRegion(
    Graphics3DResourceOwner *owner, void *resource);
extern GraphicsSpriteRegion *Graphics3DResourceOwner_AcquirePaletteRegion(
    Graphics3DResourceOwner *owner, void *resource);

#ifdef __cplusplus
}
#endif

/*
 * Allocate a 0x5c-byte instance with tag gGraphicsAnimationInstanceAllocationTag, initialize it with the
 * supplied manager owner, retain the three resource pointers, acquire texture
 * and palette regions from the resource owner, and return it. Retail assumes
 * allocation and both acquisitions succeed; no cleanup path handles failure.
 */
#ifndef MATCHING
GraphicsAnimationInstance *Graphics3DResourceOwner_CreateAnimationInstance(
    Graphics3DResourceOwner *owner, void *textureResource,
    void *paletteResource, GraphicsAnimationResource *animationResource,
    GraphicsAnimationInstanceManager *manager)
{
    GraphicsAnimationInstance *instance =
        (GraphicsAnimationInstance *)Heap_Alloc(
            sizeof(GraphicsAnimationInstance), gGraphicsAnimationInstanceAllocationTag, 4,
            gHeapContext);

    if (instance != 0) {
        GraphicsAnimationInstance_Init(instance, manager);
    }
    instance->textureResource = textureResource;
    instance->paletteResource = paletteResource;
    instance->resource = animationResource;
    instance->textureRegion = Graphics3DResourceOwner_AcquireTextureRegion(owner, textureResource);
    instance->paletteRegion = Graphics3DResourceOwner_AcquirePaletteRegion(owner, paletteResource);
    return instance;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm GraphicsAnimationInstance *Graphics3DResourceOwner_CreateAnimationInstance(
    Graphics3DResourceOwner *owner, void *textureResource,
    void *paletteResource, GraphicsAnimationResource *animationResource,
    GraphicsAnimationInstanceManager *manager)
{
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r1
    mov r5, r3
    mov r8, r0
    mov r6, r2
    /* Load allocation tag gGraphicsAnimationInstanceAllocationTag from the trailing literal. */
    DCD 0xE59F1054
    /* Load gHeapContext from the trailing literal. */
    DCD 0xE59F3054
    mov r0, #0x5c
    mov r2, #4
    bl Heap_Alloc
    movs r4, r0
    beq graphics_animation_instance_resource_init_done
    ldr r1, [sp, #0x18]
    bl GraphicsAnimationInstance_Init
    mov r4, r0
graphics_animation_instance_resource_init_done:
    str r7, [r4, #0x14]
    str r6, [r4, #0x18]
    mov r0, r8
    mov r1, r7
    str r5, [r4, #0x1c]
    bl Graphics3DResourceOwner_AcquireTextureRegion
    str r0, [r4, #0xc]
    mov r0, r8
    mov r1, r6
    bl Graphics3DResourceOwner_AcquirePaletteRegion
    str r0, [r4, #0x10]
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
graphics_animation_instance_resource_tag:
    DCD gGraphicsAnimationInstanceAllocationTag
graphics_animation_instance_resource_heap:
    DCD gHeapContext
}
#endif

/*
 * Ignore null. Release the retained texture and palette regions through their
 * distinct allocators, then free the instance. Retail redundantly rechecks the
 * instance before Heap_Free; the valid path does not clear resource pointers.
 */
void Graphics3DResourceOwner_DestroyAnimationInstance(Graphics3DResourceOwner *owner,
                   GraphicsAnimationInstance *instance)
{
    if (instance == 0) {
        return;
    }
    GraphicsSpriteRegionAllocator_Release(&owner->textureRegions, instance->textureRegion);
    GraphicsSpriteSmallRegionAllocator_Release(&owner->paletteRegions, instance->paletteRegion);
    if (instance != 0) {
        Heap_Free(instance);
    }
}

/*
 * Ignore null. When either resource identity changes, release its old region,
 * retain the new pointer, and acquire its replacement region. Always replace
 * the animation resource with params->animationResource. Acquisitions are assumed to
 * succeed, and a failed replacement policy is not present in retail.
 */
#ifndef MATCHING
void Graphics3DResourceOwner_RebindAnimationInstance(Graphics3DResourceOwner *owner,
                   GraphicsAnimationInstance *instance,
                   const GraphicsAnimationCreateParams *params)
{
    if (instance == 0) {
        return;
    }
    if (instance->textureResource != (void *)params->textureResource) {
        GraphicsSpriteRegionAllocator_Release(&owner->textureRegions, instance->textureRegion);
        instance->textureResource = (void *)params->textureResource;
        instance->textureRegion =
            Graphics3DResourceOwner_AcquireTextureRegion(
                owner, (void *)params->textureResource);
    }
    if (instance->paletteResource != (void *)params->paletteResource) {
        GraphicsSpriteSmallRegionAllocator_Release(&owner->paletteRegions, instance->paletteRegion);
        instance->paletteResource = (void *)params->paletteResource;
        instance->paletteRegion =
            Graphics3DResourceOwner_AcquirePaletteRegion(
                owner, (void *)params->paletteResource);
    }
    instance->resource =
        (GraphicsAnimationResource *)params->animationResource;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void Graphics3DResourceOwner_RebindAnimationInstance(Graphics3DResourceOwner *owner,
                       GraphicsAnimationInstance *instance,
                       const GraphicsAnimationCreateParams *params)
{
    stmdb sp!, {r4, r5, r6, lr}
    movs r5, r1
    mov r6, r0
    mov r4, r2
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, [r5, #0x14]
    ldr r0, [r4]
    cmp r1, r0
    beq graphics_animation_instance_palette_rebind
    ldr r1, [r5, #0xc]
    add r0, r6, #0x14
    bl GraphicsSpriteRegionAllocator_Release
    ldr r1, [r4]
    mov r0, r6
    str r1, [r5, #0x14]
    ldr r1, [r4]
    bl Graphics3DResourceOwner_AcquireTextureRegion
    str r0, [r5, #0xc]
graphics_animation_instance_palette_rebind:
    ldr r1, [r5, #0x18]
    ldr r0, [r4, #4]
    cmp r1, r0
    beq graphics_animation_instance_animation_rebind
    ldr r1, [r5, #0x10]
    add r0, r6, #0x31c
    bl GraphicsSpriteSmallRegionAllocator_Release
    ldr r1, [r4, #4]
    mov r0, r6
    str r1, [r5, #0x18]
    ldr r1, [r4, #4]
    bl Graphics3DResourceOwner_AcquirePaletteRegion
    str r0, [r5, #0x10]
graphics_animation_instance_animation_rebind:
    ldr r0, [r4, #8]
    str r0, [r5, #0x1c]
    ldmia sp!, {r4, r5, r6, pc}
}
#endif
