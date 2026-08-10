#ifndef TINGLE_GRAPHICS_SPRITE_RUNTIME_LIFECYCLE_H
#define TINGLE_GRAPHICS_SPRITE_RUNTIME_LIFECYCLE_H

#include "tingle/graphics_sprite_state.h"

/* Address-ordered region descriptor used by the following fixed allocator. */
typedef struct GraphicsSpriteRegion {
    struct GraphicsSpriteRegion *previous;
    struct GraphicsSpriteRegion *next;
    void *owner;
    u32 offset;
    u32 size;
    u16 type;
    u16 references;
} GraphicsSpriteRegion;

typedef char GraphicsSpriteRegionSizeCheck[
    sizeof(GraphicsSpriteRegion) == 0x18 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

void GraphicsSpriteState_Destroy(GraphicsSpriteState *state);
void GraphicsSpriteState_DestroyGlobalPool(void);
GraphicsSpriteRegion *GraphicsSpriteRegion_Init(GraphicsSpriteRegion *region);
void GraphicsSpriteRegion_Destroy(GraphicsSpriteRegion *region);

#ifdef __cplusplus
}
#endif

#endif
