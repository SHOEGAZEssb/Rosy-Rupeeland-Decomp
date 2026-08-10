#ifndef TINGLE_GRAPHICS_SPRITE_POSITION_H
#define TINGLE_GRAPHICS_SPRITE_POSITION_H

#include "tingle/graphics_sprite_state.h"

/* Coordinate source whose two confirmed fields are 20.12 fixed-point values. */
typedef struct GraphicsPositionSource {
    void *field_00;
    s32 field_04;
    s32 field_08;
} GraphicsPositionSource;

/* Four signed inset/margin values; directional semantics remain unconfirmed. */
typedef struct GraphicsPositionMargins {
    s16 field_00;
    s16 field_02;
    s16 field_04;
    s16 field_06;
} GraphicsPositionMargins;

#ifdef __cplusplus
extern "C" {
#endif

void GraphicsSpriteState_SetWorldPositionFromOrigin(GraphicsSpriteState *state,
                                                    const GraphicsPositionSource *origin,
                                                    s32 positionX,
                                                    s32 positionY, s32 depth,
                                                    u16 cullFlag);
void GraphicsSpriteState_SetWorldPosition(GraphicsSpriteState *state,
                                          s32 positionX, s32 positionY,
                                          s32 depth, u16 cullFlag);
void GraphicsSpriteState_SetScreenPositionCulled(GraphicsSpriteState *state,
                                                 s32 x, s32 y, u16 cullFlag);
void GraphicsSpriteState_SetDepthOrderedWorldPositionFromOrigin(
    GraphicsSpriteState *state, const GraphicsPositionSource *origin,
    s32 positionX, s32 positionY, s32 depth, u16 cullFlag);
void GraphicsSpriteState_SetDepthOrderedWorldPosition(
    GraphicsSpriteState *state, s32 positionX, s32 positionY, s32 depth,
    u16 cullFlag);
void GraphicsSpriteState_SetDepthOrderedWorldPositionWithMargins(
    GraphicsSpriteState *state, const GraphicsPositionSource *origin,
    const GraphicsPositionMargins *margins, s32 positionX, s32 positionY,
    s32 depth, u16 cullFlag);

#ifdef __cplusplus
}
#endif

#endif
