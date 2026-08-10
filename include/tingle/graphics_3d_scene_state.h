#ifndef TINGLE_GRAPHICS_3D_SCENE_STATE_H
#define TINGLE_GRAPHICS_3D_SCENE_STATE_H

#include "tingle/types.h"

/* 0x94-byte 3D scene state; unknown fields retain address-derived offsets. */
typedef struct Graphics3DSceneState {
    s32 projectionMode;
    s32 field_04;
    s32 field_08;
    s32 field_0c;
    s32 field_10;
    s32 field_14;
    s32 field_18;
    s32 field_1c;
    s32 field_20;
    s32 field_24;
    s32 field_28[12];
    s32 field_58[9];
    s32 projectionLeft;
    s32 projectionTop;
    s32 projectionRight;
    s32 projectionBottom;
    s32 projectionOffsetX;
    s32 projectionOffsetY;
} Graphics3DSceneState;

typedef char Graphics3DSceneStateSizeCheck[
    sizeof(Graphics3DSceneState) == 0x94 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

void Graphics3DSceneState_Init(Graphics3DSceneState *state);
void Graphics3DSceneState_Apply(Graphics3DSceneState *state);

#ifdef __cplusplus
}
#endif

#endif
