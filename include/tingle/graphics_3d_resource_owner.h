#ifndef TINGLE_GRAPHICS_3D_RESOURCE_OWNER_H
#define TINGLE_GRAPHICS_3D_RESOURCE_OWNER_H

#include "tingle/graphics_sprite_region_allocator.h"
#include "tingle/graphics_sprite_small_region_allocator.h"
#include "tingle/graphics_animation_instance.h"
#include "tingle/types.h"

/* 0x624-byte owner for the two fixed region allocators and bank selections. */
typedef struct Graphics3DResourceOwner {
    u32 field_00;
    u32 field_04;
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

Graphics3DResourceOwner *func_020774ac(Graphics3DResourceOwner *owner,
                                       u32 field_00, u32 field_04);
Graphics3DResourceOwner *func_020775d8(Graphics3DResourceOwner *owner);
void func_02077624(Graphics3DResourceOwner *owner);
void func_02077688(Graphics3DResourceOwner *owner,
                   GraphicsAnimationInstanceManager *manager);
void func_020776e8(Graphics3DResourceOwner *owner);
GraphicsSpriteRegion *func_02077870(Graphics3DResourceOwner *owner,
                                    void *resource);
GraphicsSpriteRegion *func_020778ec(Graphics3DResourceOwner *owner,
                                    void *resource, u16 type);
GraphicsSpriteRegion *func_02077918(Graphics3DResourceOwner *owner,
                                    void *resource);
void func_020779ac(Graphics3DResourceOwner *owner,
                   const GraphicsAnimationCreateParams *params);
void func_020779d8(Graphics3DResourceOwner *owner, void *renderContext);

#ifdef __cplusplus
}
#endif

#endif
