#ifndef TINGLE_GRAPHICS_3D_RESOURCE_OWNER_H
#define TINGLE_GRAPHICS_3D_RESOURCE_OWNER_H

#include "tingle/graphics_sprite_region_allocator.h"
#include "tingle/graphics_sprite_small_region_allocator.h"
#include "tingle/graphics_animation_instance.h"
#include "tingle/types.h"

/* 0x624-byte owner for the two fixed region allocators and VRAM bank modes. */
typedef struct Graphics3DResourceOwner {
    u32 textureBankMode;
    u32 paletteBankMode;
    GraphicsAnimationInstanceManager *managerHead;
    GraphicsAnimationInstanceManager *managerTail;
    s32 managerCount;
    GraphicsSpriteRegionAllocator textureRegions;
    GraphicsSpriteSmallRegionAllocator paletteRegions;
} Graphics3DResourceOwner;

typedef char Graphics3DResourceOwnerSizeCheck[
    sizeof(Graphics3DResourceOwner) == 0x624 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

Graphics3DResourceOwner *Graphics3DResourceOwner_Init(
    Graphics3DResourceOwner *owner, u32 textureBankMode, u32 paletteBankMode);
Graphics3DResourceOwner *Graphics3DResourceOwner_Destroy(
    Graphics3DResourceOwner *owner);
void Graphics3DResourceOwner_CreateManager(Graphics3DResourceOwner *owner);
void Graphics3DResourceOwner_RemoveManager(Graphics3DResourceOwner *owner,
                                            GraphicsAnimationInstanceManager *manager);
void Graphics3DResourceOwner_ClearManagers(Graphics3DResourceOwner *owner);
GraphicsSpriteRegion *Graphics3DResourceOwner_AcquireTextureRegion(
    Graphics3DResourceOwner *owner, void *resource);
GraphicsSpriteRegion *Graphics3DResourceOwner_FindTextureRegion(
    Graphics3DResourceOwner *owner, void *resource, u16 type);
GraphicsSpriteRegion *Graphics3DResourceOwner_AcquirePaletteRegion(
    Graphics3DResourceOwner *owner, void *resource);
void Graphics3DResourceOwner_PrepareResources(Graphics3DResourceOwner *owner,
                                               const GraphicsAnimationCreateParams *params);
void Graphics3DResourceOwner_RenderManagers(Graphics3DResourceOwner *owner,
                                             void *renderContext);

#ifdef __cplusplus
}
#endif

#endif
