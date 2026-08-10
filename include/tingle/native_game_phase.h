#ifndef TINGLE_NATIVE_GAME_PHASE_H
#define TINGLE_NATIVE_GAME_PHASE_H

#include "tingle/native_data.h"
#include "tingle/native_platform.h"
#include "tingle/native_render.h"

enum {
    TINGLE_NATIVE_PHASE_METADATA_SIZE = 0x58,
    TINGLE_NATIVE_PHASE_COUNT = 270
};

typedef struct TingleNativeGamePhaseMetadata {
    s32 phase_id;
    s32 field_00;
    s16 field_12;
    u32 primary_overlay_id_1c;
    u32 secondary_overlay_id_20;
    u32 callback_24;
    u32 callback_28;
    s32 field_2c;
    s32 field_30;
    u32 flags_40;
    s32 field_44;
    s32 field_48;
    s8 variant_4c;
    s8 field_4d;
    s8 coordinate_x_4e;
    s8 coordinate_y_4f;
    s16 field_54;
    s16 field_56;
} TingleNativeGamePhaseMetadata;

typedef struct TingleNativeGamePhaseBoundary {
    TingleNativeGamePhaseMetadata metadata;
    TingleNativeOverlayImage primary_overlay;
    TingleNativeOverlayImage secondary_overlay;
    s32 metadata_loaded;
    s32 primary_overlay_loaded;
    s32 secondary_overlay_loaded;
    s32 primary_callback_valid;
    s32 secondary_callback_valid;
} TingleNativeGamePhaseBoundary;

/* Decodes confirmed fields without retaining pointers into ARM9 storage. */
s32 TingleNativeGamePhase_DecodeMetadata(s32 phase_id, const void *record,
                                         size_t size,
                                         TingleNativeGamePhaseMetadata *metadata);

/* Loads the selected one-based phase record into a host-safe boundary scene. */
s32 TingleNativeGamePhaseBoundary_Init(TingleNativeGamePhaseBoundary *boundary,
                                       TingleNativeData *data, s32 phase_id);

/* Releases both phase-owned overlay images and clears the boundary state. */
void TingleNativeGamePhaseBoundary_Destroy(TingleNativeGamePhaseBoundary *boundary);

/* Returns nonzero on B, a host-only escape to the phase selector. */
s32 TingleNativeGamePhaseBoundary_Update(TingleNativeGamePhaseBoundary *boundary,
                                         const TingleNativeInput *input);

/* Draws decoded fields and the next unresolved runtime-construction boundary. */
void TingleNativeGamePhaseBoundary_Draw(
    const TingleNativeGamePhaseBoundary *boundary, TingleNativeCanvas *canvas);

#endif
