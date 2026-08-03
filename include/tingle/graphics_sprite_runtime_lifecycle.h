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

void func_020766cc(GraphicsSpriteState *state);
void func_020766d0(void);
GraphicsSpriteRegion *func_020766f4(GraphicsSpriteRegion *region);
void func_02076718(GraphicsSpriteRegion *region);

#ifdef __cplusplus
}
#endif

#endif
