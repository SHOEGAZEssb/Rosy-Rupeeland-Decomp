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
    ActorRuntimeGridCanvas grid;
} DebugPhaseSelector;

typedef char DebugPhaseSelectorSizeCheck[
    sizeof(DebugPhaseSelector) == 0x4c ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

DebugPhaseSelector *func_0200c244(DebugPhaseSelector *self);
DebugPhaseSelector *func_0200c2f8(DebugPhaseSelector *self);
DebugPhaseSelector *func_0200c328(DebugPhaseSelector *self);
s32 func_0200c360(DebugPhaseSelector *self);
s32 func_0200c5b4(DebugPhaseSelector *self, const TouchPoint *point);
s32 func_0200c650(DebugPhaseSelector *self);

#ifdef __cplusplus
}
#endif

#endif
