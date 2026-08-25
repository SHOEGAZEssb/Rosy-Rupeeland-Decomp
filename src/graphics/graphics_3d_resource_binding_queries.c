#include "tingle/graphics_3d_resource_binding.h"

/*
 * Thin texture-resource queries exposed through Graphics3DResourceBinding.
 * Each wrapper delegates to the corresponding resource metadata decoder and
 * has no state changes of its own.
 */

#ifdef __cplusplus
extern "C" {
#endif

extern u32 GraphicsCharacterResource_GetTextureFormat(const void *resource);
extern u32 GraphicsCharacterResource_GetTextureWidthExponent(const void *resource);
extern u32 GraphicsCharacterResource_GetTextureHeightExponent(const void *resource);

#ifdef __cplusplus
}
#endif

/* Return the decoded texture format for binding's texture resource. */
u32 Graphics3DResourceBinding_GetTextureFormat(
    const Graphics3DResourceBinding *binding)
{
    return GraphicsCharacterResource_GetTextureFormat(binding->textureResource);
}

/* Return the decoded texture width class for binding's texture resource. */
u32 Graphics3DResourceBinding_GetTextureWidthClass(
    const Graphics3DResourceBinding *binding)
{
    return GraphicsCharacterResource_GetTextureWidthExponent(binding->textureResource);
}

/* Return the decoded texture height class for binding's texture resource. */
u32 Graphics3DResourceBinding_GetTextureHeightClass(
    const Graphics3DResourceBinding *binding)
{
    return GraphicsCharacterResource_GetTextureHeightExponent(binding->textureResource);
}
