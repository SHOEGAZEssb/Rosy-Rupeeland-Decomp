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

SoftwareCanvas *func_02005d88(SoftwareCanvas *self);
SoftwareCanvas *func_02005dac(SoftwareCanvas *self, s32 field04,
                              u16 *pixels, s32 stride, s32 field10);
SoftwareCanvas *func_02005dc8(SoftwareCanvas *self);
SoftwareCanvas *func_02005dcc(SoftwareCanvas *self);
void func_02005de0(SoftwareCanvas *self, s32 x, s32 y, u16 color);
void func_02005dfc(SoftwareCanvas *self, s32 x0, s32 y0,
                   s32 x1, s32 y1, u16 color);
void func_02005eb8(SoftwareCanvas *self, s32 x0, s32 y0,
                   s32 x1, s32 y1, u16 color);
void func_02005f38(SoftwareCanvas *self, s32 x0, s32 y0,
                   s32 x1, s32 y1, u16 color);
void func_02005fec(SoftwareCanvas *self, s32 glyphIndex);

#ifdef __cplusplus
}
#endif

#endif
