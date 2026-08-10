#ifndef TINGLE_ACTOR_RUNTIME_GRID_CANVAS_H
#define TINGLE_ACTOR_RUNTIME_GRID_CANVAS_H

#include "tingle/software_canvas.h"

typedef struct ActorRuntimeGridCanvas {
    SoftwareCanvas base;
    s32 pageIndex;
} ActorRuntimeGridCanvas;

typedef char ActorRuntimeGridCanvasSizeCheck[
    sizeof(ActorRuntimeGridCanvas) == 0x18 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

ActorRuntimeGridCanvas *ActorRuntimeGridCanvas_Init(ActorRuntimeGridCanvas *self);
void ActorRuntimeGridCanvas_SetupSubBg2(ActorRuntimeGridCanvas *self);
void ActorRuntimeGridCanvas_DrawGrid(ActorRuntimeGridCanvas *self);
void ActorRuntimeGridCanvas_DrawPage(ActorRuntimeGridCanvas *self, s32 row, s32 column);
void S32Rectangle_Translate(s32 *rectangle, s32 deltaX, s32 deltaY);
void NdsDisplay_SetScreenSwap(s32 displaySelect);

#ifdef __cplusplus
}
#endif

#endif
