#ifndef TINGLE_ACTOR_RUNTIME_GRID_CANVAS_H
#define TINGLE_ACTOR_RUNTIME_GRID_CANVAS_H

#include "tingle/rect_s32.h"
#include "tingle/software_canvas.h"

typedef struct DebugPhaseGridCanvas {
    SoftwareCanvas base;
    s32 pageIndex;
} DebugPhaseGridCanvas;

typedef char DebugPhaseGridCanvasSizeCheck[
    sizeof(DebugPhaseGridCanvas) == 0x18 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

DebugPhaseGridCanvas *DebugPhaseGridCanvas_Init(DebugPhaseGridCanvas *self);
void DebugPhaseGridCanvas_SetupSubBg2(DebugPhaseGridCanvas *self);
void DebugPhaseGridCanvas_DrawGrid(DebugPhaseGridCanvas *self);
void DebugPhaseGridCanvas_DrawPage(DebugPhaseGridCanvas *self,
                                   s32 selectedColumn, s32 selectedRow);
void NdsDisplay_SetScreenSwap(s32 displaySelect);

#ifdef __cplusplus
}
#endif

#endif
