#include "tingle/graphics_3d_resource_owner.h"

/*
 * Small owner-wide resource preparation and manager rendering dispatches for
 * the 3D animation subsystem. They compose previously recovered ownership and
 * rendering primitives without directly accessing graphics registers.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern void GraphicsSpriteResource_ReleaseTexture(void *resource);

#ifdef __cplusplus
}
#endif

/*
 * Acquire params' texture and palette resources, then invoke the texture
 * resource's preparation helper. Acquired descriptors are not
 * returned or released here, so the caller owns the resulting references.
 * Retail assumes both resources are valid and acquisition succeeds.
 */
void Graphics3DResourceOwner_PrepareResources(Graphics3DResourceOwner *owner,
                   const GraphicsAnimationCreateParams *params)
{
    Graphics3DResourceOwner_AcquireTextureRegion(
        owner, (void *)params->textureResource);
    Graphics3DResourceOwner_AcquirePaletteRegion(
        owner, (void *)params->paletteResource);
    GraphicsSpriteResource_ReleaseTexture((void *)params->textureResource);
}

/*
 * Render every manager from head to tail through GraphicsAnimationInstanceManager_Render using the same
 * renderContext. The next manager is loaded after each callback, so mutation
 * of the owner list during rendering is outside the confirmed safe contract.
 */
void Graphics3DResourceOwner_RenderManagers(Graphics3DResourceOwner *owner, void *renderContext)
{
    GraphicsAnimationInstanceManager *manager;

    for (manager = owner->managerHead; manager != 0; manager = manager->next) {
        GraphicsAnimationInstanceManager_Render(manager, renderContext);
    }
}
