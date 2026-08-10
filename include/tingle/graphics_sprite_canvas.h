#ifndef TINGLE_GRAPHICS_SPRITE_CANVAS_H
#define TINGLE_GRAPHICS_SPRITE_CANVAS_H

#include "tingle/types.h"

/* Wrapper around the renderer's 256-by-192 tiled 4-bpp software surface. */
typedef struct GraphicsSpriteCanvas {
    u32 *pixels;
} GraphicsSpriteCanvas;

#ifdef __cplusplus
extern "C" {
#endif

void GraphicsSpriteCanvas_DrawLine(GraphicsSpriteCanvas *canvas,
                                   s32 x0, s32 y0, s32 x1, s32 y1,
                                   u32 color);
void GraphicsSpriteCanvas_FillRect(GraphicsSpriteCanvas *canvas,
                                   s32 x0, s32 y0, s32 x1, s32 y1,
                                   u32 color);
void GraphicsSpriteCanvas_DrawRect(GraphicsSpriteCanvas *canvas,
                                   s32 x0, s32 y0, s32 x1, s32 y1,
                                   u32 color);
void func_020766c8(void);

#ifdef __cplusplus
}
#endif

#endif
