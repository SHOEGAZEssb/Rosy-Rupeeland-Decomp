#ifndef TINGLE_GRAPHICS_SPRITE_STATE_H
#define TINGLE_GRAPHICS_SPRITE_STATE_H

#include "tingle/types.h"

/* Sprite animation/render state; several pointer roles remain under recovery. */
typedef struct GraphicsSpriteState {
    void *field_00;
    void *field_04;
    void *field_08;
    void *field_0c;
    void *field_10;
    void *field_14;
    void *field_18;
    void *animationResource;
    s32 framePosition;
    u16 flags;
    u16 field_26;
    u16 field_28;
    u16 field_2a;
    s16 field_2c;
    s16 field_2e;
    s16 field_30;
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

GraphicsSpriteState *func_02072aec(GraphicsSpriteState *state);
void func_02072b00(GraphicsSpriteState *state);
void func_02072b68(GraphicsSpriteState *state, u8 animationIndex);
void func_02072bdc(GraphicsSpriteState *state, u8 frameIndex);
void func_02072c98(GraphicsSpriteState *state);
u16 func_02072cd0(GraphicsSpriteState *state);
void func_02072d04(GraphicsSpriteState *state);
u16 func_02072e50(GraphicsSpriteState *state);
void func_02073e48(GraphicsSpriteState *state, u8 animationIndex,
                   s16 field2c, s16 field2e, u8 field3a,
                   u16 field28, u16 flags);

#ifdef __cplusplus
}
#endif

#endif
