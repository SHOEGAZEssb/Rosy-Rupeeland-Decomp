#ifndef TINGLE_GRAPHICS_SPRITE_VRAM_BINDING_H
#define TINGLE_GRAPHICS_SPRITE_VRAM_BINDING_H

#include "tingle/graphics_vram_allocator.h"

#ifdef __cplusplus
extern "C" {
#endif

GraphicsVramRangeNode *func_02074a88(void *renderer, void *resource);
GraphicsVramRangeNode *func_02074b6c(void *renderer, void *resource, u8 type);

#ifdef __cplusplus
}
#endif

#endif
