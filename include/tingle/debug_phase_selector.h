#ifndef TINGLE_DEBUG_PHASE_SELECTOR_H
#define TINGLE_DEBUG_PHASE_SELECTOR_H

#include "tingle/actor_runtime_grid_canvas.h"
#include "tingle/scene.h"
#include "tingle/scene_touch.h"

typedef struct DebugPhaseSelector {
    Scene base;
    s32 state;
    s32 selectedPhase;
    s32 column;
    s32 row;
    DebugPhaseGridCanvas grid;
} DebugPhaseSelector;

typedef char DebugPhaseSelectorSizeCheck[
    sizeof(DebugPhaseSelector) == 0x4c ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

DebugPhaseSelector *DebugPhaseSelector_Init(DebugPhaseSelector *self);
DebugPhaseSelector *DebugPhaseSelector_Destroy(DebugPhaseSelector *self);
DebugPhaseSelector *DebugPhaseSelector_DestroyAndFree(DebugPhaseSelector *self);
s32 DebugPhaseSelector_Update(DebugPhaseSelector *self);
s32 DebugPhaseSelector_SelectTouchPoint(DebugPhaseSelector *self, const TouchPoint *point);
s32 DebugPhaseSelector_RestoreSubBg2(DebugPhaseSelector *self);

extern SceneVTable gDebugPhaseSelectorVTable;

#ifdef __cplusplus
}
#endif

#endif
