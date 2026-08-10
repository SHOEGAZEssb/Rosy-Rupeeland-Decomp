#ifndef TINGLE_GRAPHICS_3D_RESOURCE_BINDING_H
#define TINGLE_GRAPHICS_3D_RESOURCE_BINDING_H

#include "tingle/graphics_3d_resource_owner.h"
#include "tingle/types.h"

/* 0x18-byte binding between archive resources and shared 3D VRAM regions. */
typedef struct Graphics3DResourceBinding {
    void *archive;
    void *textureResource;
    void *paletteResource;
    Graphics3DResourceOwner *owner;
    GraphicsSpriteRegion *textureRegion;
    GraphicsSpriteRegion *paletteRegion;
} Graphics3DResourceBinding;

typedef char Graphics3DResourceBindingSizeCheck[
    sizeof(Graphics3DResourceBinding) == 0x18 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

Graphics3DResourceBinding *Graphics3DResourceBinding_Init(
    Graphics3DResourceBinding *binding, void *archive,
    Graphics3DResourceOwner *owner, u32 textureResourceId,
    u16 paletteResourceId);
Graphics3DResourceBinding *Graphics3DResourceBinding_Destroy(
    Graphics3DResourceBinding *binding);
u32 Graphics3DResourceBinding_GetTextureFormat(
    const Graphics3DResourceBinding *binding);
u32 Graphics3DResourceBinding_GetTextureWidthClass(
    const Graphics3DResourceBinding *binding);
u32 Graphics3DResourceBinding_GetTextureHeightClass(
    const Graphics3DResourceBinding *binding);

#ifdef __cplusplus
}
#endif

#endif
