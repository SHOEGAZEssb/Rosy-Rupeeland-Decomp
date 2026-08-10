#ifndef TINGLE_NATIVE_PHASE_SELECTOR_H
#define TINGLE_NATIVE_PHASE_SELECTOR_H

#include "tingle/native_platform.h"
#include "tingle/native_render.h"

typedef enum TingleNativePhaseSelectorEvent {
    TINGLE_NATIVE_PHASE_EVENT_NONE,
    TINGLE_NATIVE_PHASE_EVENT_BACK,
    TINGLE_NATIVE_PHASE_EVENT_DEBUG_OBJECT,
    TINGLE_NATIVE_PHASE_EVENT_START_PHASE
} TingleNativePhaseSelectorEvent;

typedef struct TingleNativePhaseSelector {
    s32 state;
    s32 selected_phase;
    s32 column;
    s32 row;
    s32 page;
    s32 fade_frames;
    s32 debug_object_requested;
} TingleNativePhaseSelector;

/* Initializes the recovered phase-selector state without DS hardware setup. */
void TingleNativePhaseSelector_Init(TingleNativePhaseSelector *selector);

/* Advances selector input/fade behavior and reports scene-boundary events. */
TingleNativePhaseSelectorEvent TingleNativePhaseSelector_Update(
    TingleNativePhaseSelector *selector, const TingleNativeInput *input);

/* Draws the recovered 10x9 numbered page through the native software canvas. */
void TingleNativePhaseSelector_Draw(const TingleNativePhaseSelector *selector,
                                    TingleNativeCanvas *canvas);

#endif
