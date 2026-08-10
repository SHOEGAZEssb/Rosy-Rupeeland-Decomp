#include "tingle/graphics_3d_resource_binding.h"

/*
 * Resource binding for a paired 3D texture and palette. It resolves the two
 * archive entries, shares their owner's fixed VRAM-region allocations, and
 * releases both layers of ownership in the reverse operation.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void *func_02071568(void *archive, u32 resourceId);
extern void *func_020716bc(void *archive, u16 resourceId);
extern void func_020703d8(void *resource);
extern void func_02071bdc(void *archive, void *resource);
extern void func_02071c38(void *archive, void *resource);

#ifdef __cplusplus
}
#endif

/*
 * Resolve texture and palette resources from archive by their IDs, acquire a
 * shared VRAM region for each through owner, and prepare the texture resource.
 * Returns binding. Retail assumes every lookup and acquisition succeeds; all
 * archive, owner, resource, and region pointers become observable in binding.
 */
Graphics3DResourceBinding *Graphics3DResourceBinding_Init(
    Graphics3DResourceBinding *binding, void *archive,
    Graphics3DResourceOwner *owner, u32 textureResourceId,
    u16 paletteResourceId)
{
    binding->archive = archive;
    binding->owner = owner;
    binding->textureResource = func_02071568(archive, textureResourceId);
    binding->paletteResource = func_020716bc(archive, paletteResourceId);
    binding->textureRegion =
        Graphics3DResourceOwner_AcquireTextureRegion(owner, binding->textureResource);
    binding->paletteRegion =
        Graphics3DResourceOwner_AcquirePaletteRegion(owner, binding->paletteResource);
    func_020703d8(binding->textureResource);
    return binding;
}

/*
 * Release the shared texture and palette VRAM regions, then release both
 * archive resources through their type-specific operations. Returns binding;
 * retail leaves all six stored pointers intact, so they are stale afterward.
 */
Graphics3DResourceBinding *Graphics3DResourceBinding_Destroy(
    Graphics3DResourceBinding *binding)
{
    GraphicsSpriteRegionAllocator_Release(&binding->owner->textureRegions, binding->textureRegion);
    GraphicsSpriteSmallRegionAllocator_Release(&binding->owner->paletteRegions, binding->paletteRegion);
    func_02071bdc(binding->archive, binding->textureResource);
    func_02071c38(binding->archive, binding->paletteResource);
    return binding;
}
