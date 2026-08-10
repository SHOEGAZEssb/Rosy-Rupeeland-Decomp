#ifndef TINGLE_GRAPHICS_SPRITE_SMALL_REGION_ALLOCATOR_H
#define TINGLE_GRAPHICS_SPRITE_SMALL_REGION_ALLOCATOR_H

#include "tingle/graphics_sprite_region_allocator.h"

/* Same fixed descriptor layout, with an initial 0x4000-unit address space. */
typedef GraphicsSpriteRegionAllocator GraphicsSpriteSmallRegionAllocator;

#ifdef __cplusplus
extern "C" {
#endif

GraphicsSpriteRegion *GraphicsSpriteSmallRegion_Init(
    GraphicsSpriteRegion *region);
void GraphicsSpriteSmallRegion_Destroy(GraphicsSpriteRegion *region);
GraphicsSpriteSmallRegionAllocator *GraphicsSpriteSmallRegionAllocator_Init(
    GraphicsSpriteSmallRegionAllocator *allocator);
GraphicsSpriteRegion *GraphicsSpriteSmallRegionAllocator_Allocate(
    GraphicsSpriteSmallRegionAllocator *allocator, u32 size, void *owner,
    u16 type);
void GraphicsSpriteSmallRegionAllocator_Release(
    GraphicsSpriteSmallRegionAllocator *allocator,
    GraphicsSpriteRegion *region);

#ifdef __cplusplus
}
#endif

#endif
