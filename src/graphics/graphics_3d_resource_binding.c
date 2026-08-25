#include "tingle/graphics_3d_resource_binding.h"

/*
 * Resource binding for a paired 3D texture and palette. It resolves the two
 * archive entries, shares their owner's fixed VRAM-region allocations, and
 * releases both layers of ownership in the reverse operation.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void *GraphicsArchive_AcquireCharacterResource(void *archive, u32 resourceId);
extern void *GraphicsArchive_AcquirePaletteResource(void *archive, u16 resourceId);
extern void GraphicsSpriteResource_ReleaseTexture(void *resource);
extern void GraphicsArchive_ReleaseCharacterResource(void *archive, void *resource);
extern void GraphicsArchive_ReleasePaletteResource(void *archive, void *resource);

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
    binding->textureResource = GraphicsArchive_AcquireCharacterResource(archive, textureResourceId);
    binding->paletteResource = GraphicsArchive_AcquirePaletteResource(archive, paletteResourceId);
    binding->textureRegion =
        Graphics3DResourceOwner_AcquireTextureRegion(owner, binding->textureResource);
    binding->paletteRegion =
        Graphics3DResourceOwner_AcquirePaletteRegion(owner, binding->paletteResource);
    GraphicsSpriteResource_ReleaseTexture(binding->textureResource);
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
    GraphicsArchive_ReleaseCharacterResource(binding->archive, binding->textureResource);
    GraphicsArchive_ReleasePaletteResource(binding->archive, binding->paletteResource);
    return binding;
}
