#ifndef TINGLE_GRAPHICS_SPRITE_STATE_H
#define TINGLE_GRAPHICS_SPRITE_STATE_H

#include "tingle/types.h"

struct GraphicsSpriteGroup;

/* Sprite animation/render state and its owner-scoped resource bindings. */
typedef struct GraphicsSpriteState {
    struct GraphicsSpriteGroup *group;
    struct GraphicsSpriteState *previous;
    struct GraphicsSpriteState *nextOrFree;
    void *graphicsVramBinding;
    void *indexedPaletteBinding;
    void *graphicsResource;
    void *paletteResource;
    void *animationResource;
    s32 framePosition;
    u16 flags;
    u16 field_26;
    u16 field_28;
    u16 field_2a;
    s16 screenX;
    s16 screenY;
    s16 rotationAngle;
    s16 scaleX;
    s16 scaleY;
    s16 scaleZ;
    u8 animationIndex;
    u8 frameIndex;
    u8 field_3a;
    u8 field_3b;
} GraphicsSpriteState;

typedef char GraphicsSpriteStateSizeCheck[
    sizeof(GraphicsSpriteState) == 0x3c ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

GraphicsSpriteState *GraphicsSpriteState_Init(GraphicsSpriteState *state);
void GraphicsSpriteState_Reset(GraphicsSpriteState *state);
void GraphicsSpriteState_SetAnimationIndex(GraphicsSpriteState *state,
                                           u8 animationIndex);
void GraphicsSpriteState_SetFrameIndex(GraphicsSpriteState *state,
                                       u8 frameIndex);
void GraphicsSpriteState_ResetFrame(GraphicsSpriteState *state);
u16 GraphicsSpriteState_GetSequenceDuration(GraphicsSpriteState *state);
void GraphicsSpriteState_AdvanceAnimation(GraphicsSpriteState *state);
u16 GraphicsSpriteState_GetCurrentFrameResourceField02(
    GraphicsSpriteState *state);
void func_02073e48(GraphicsSpriteState *state, u8 animationIndex,
                   s16 screenX, s16 screenY, u8 field3a,
                   u16 field28, u16 flags);

#ifdef __cplusplus
}
#endif

#endif
