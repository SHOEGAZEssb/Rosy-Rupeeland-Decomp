#ifndef TINGLE_SOFTWARE_CANVAS_H
#define TINGLE_SOFTWARE_CANVAS_H

#include "tingle/types.h"

typedef struct SoftwareCanvas SoftwareCanvas;

typedef struct SoftwareCanvasVTable {
    SoftwareCanvas *(*destroy)(SoftwareCanvas *self);
    SoftwareCanvas *(*destroyAndFree)(SoftwareCanvas *self);
} SoftwareCanvasVTable;

struct SoftwareCanvas {
    const SoftwareCanvasVTable *vtable;
    s32 field_04;
    u16 *pixels;
    s32 stride;
    s32 field_10;
};

typedef char SoftwareCanvasSizeCheck[
    sizeof(SoftwareCanvas) == 0x14 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

extern SoftwareCanvasVTable data_020d4190;

SoftwareCanvas *SoftwareCanvas_Init(SoftwareCanvas *self);
SoftwareCanvas *SoftwareCanvas_InitWithBuffer(SoftwareCanvas *self, s32 field04,
                              u16 *pixels, s32 stride, s32 field10);
SoftwareCanvas *SoftwareCanvas_Destroy(SoftwareCanvas *self);
SoftwareCanvas *SoftwareCanvas_DestroyAndFree(SoftwareCanvas *self);
void SoftwareCanvas_SetPixel(SoftwareCanvas *self, s32 x, s32 y, u16 color);
void SoftwareCanvas_DrawLine(SoftwareCanvas *self, s32 x0, s32 y0,
                   s32 x1, s32 y1, u16 color);
void SoftwareCanvas_FillRect(SoftwareCanvas *self, s32 x0, s32 y0,
                   s32 x1, s32 y1, u16 color);
void SoftwareCanvas_DrawRect(SoftwareCanvas *self, s32 x0, s32 y0,
                   s32 x1, s32 y1, u16 color);
void SoftwareCanvas_DrawGlyph(SoftwareCanvas *self, s32 glyphIndex);
void SoftwareCanvas_DrawFormattedText(SoftwareCanvas *self, s32 x, s32 y,
                   const char *format, ...);

#ifdef __cplusplus
}
#endif

#endif
