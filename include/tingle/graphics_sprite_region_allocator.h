#ifndef TINGLE_GRAPHICS_SPRITE_REGION_ALLOCATOR_H
#define TINGLE_GRAPHICS_SPRITE_REGION_ALLOCATOR_H

#include "tingle/graphics_sprite_runtime_lifecycle.h"

/* Fixed 32-descriptor allocator for a 0x20000-unit address space. */
typedef struct GraphicsSpriteRegionAllocator {
    GraphicsSpriteRegion regions[32];
    GraphicsSpriteRegion *freeHead;
    u32 regionCount;
} GraphicsSpriteRegionAllocator;

typedef char GraphicsSpriteRegionAllocatorSizeCheck[
    sizeof(GraphicsSpriteRegionAllocator) == 0x308 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

GraphicsSpriteRegionAllocator *func_0207671c(
    GraphicsSpriteRegionAllocator *allocator);
GraphicsSpriteRegion *func_0207679c(GraphicsSpriteRegionAllocator *allocator,
                                    u32 size, void *owner, u16 type);
void func_0207684c(GraphicsSpriteRegionAllocator *allocator,
                   GraphicsSpriteRegion *region);

#ifdef __cplusplus
}
#endif

#endif
