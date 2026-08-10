#ifndef TINGLE_NATIVE_RENDER_H
#define TINGLE_NATIVE_RENDER_H

#include "tingle/types.h"

typedef struct TingleNativeCanvas {
    u32 *pixels;
    s32 width;
    s32 height;
    s32 stride;
} TingleNativeCanvas;

/* Fills a clipped rectangle in the software framebuffer. */
void TingleNativeCanvas_FillRect(TingleNativeCanvas *canvas, s32 x, s32 y,
                                 s32 width, s32 height, u32 color);

/* Draws uppercase ASCII text with a compact host-owned 5x7 bitmap font. */
void TingleNativeCanvas_DrawText(TingleNativeCanvas *canvas, s32 x, s32 y,
                                 const char *text, u32 color, s32 scale);

#endif
