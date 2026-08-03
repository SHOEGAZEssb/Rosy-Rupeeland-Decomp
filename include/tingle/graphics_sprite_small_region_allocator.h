#ifndef TINGLE_GRAPHICS_SPRITE_SMALL_REGION_ALLOCATOR_H
#define TINGLE_GRAPHICS_SPRITE_SMALL_REGION_ALLOCATOR_H

#include "tingle/graphics_sprite_region_allocator.h"

/* Same fixed descriptor layout, with an initial 0x4000-unit address space. */
typedef GraphicsSpriteRegionAllocator GraphicsSpriteSmallRegionAllocator;

#ifdef __cplusplus
extern "C" {
#endif

GraphicsSpriteRegion *func_02076920(GraphicsSpriteRegion *region);
void func_02076944(GraphicsSpriteRegion *region);
GraphicsSpriteSmallRegionAllocator *func_02076948(
    GraphicsSpriteSmallRegionAllocator *allocator);
GraphicsSpriteRegion *func_020769c0(
    GraphicsSpriteSmallRegionAllocator *allocator, u32 size, void *owner,
    u16 type);
void func_02076a70(GraphicsSpriteSmallRegionAllocator *allocator,
                   GraphicsSpriteRegion *region);

#ifdef __cplusplus
}
#endif

#endif
