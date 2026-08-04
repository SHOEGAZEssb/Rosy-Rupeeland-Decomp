#ifndef TINGLE_ACTOR_RUNTIME_GRID_CANVAS_H
#define TINGLE_ACTOR_RUNTIME_GRID_CANVAS_H

#include "tingle/software_canvas.h"

typedef struct ActorRuntimeGridCanvas {
    SoftwareCanvas base;
    s32 selectedCell;
} ActorRuntimeGridCanvas;

typedef char ActorRuntimeGridCanvasSizeCheck[
    sizeof(ActorRuntimeGridCanvas) == 0x18 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

ActorRuntimeGridCanvas *func_0200bf04(ActorRuntimeGridCanvas *self);
void func_0200bf20(ActorRuntimeGridCanvas *self);
void func_0200c178(ActorRuntimeGridCanvas *self);
void func_0200c00c(ActorRuntimeGridCanvas *self, s32 row, s32 column);
void func_0200c144(s32 *rectangle, s32 deltaX, s32 deltaY);
void func_0200c228(s32 displaySelect);

#ifdef __cplusplus
}
#endif

#endif
