#include "tingle/graphics_sprite_state.h"

/*
 * Core state initialization for the sprite animation/render path. The object
 * owns or references several resources whose exact roles are still being
 * recovered, plus animation indices, flags, positions, and 8.8 scale values.
 */

/*
 * Initialize state through the shared reset routine and return it. Only the
 * supplied object changes; there are no SDK calls or graphics-hardware writes.
 */
GraphicsSpriteState *GraphicsSpriteState_Init(GraphicsSpriteState *state)
{
    GraphicsSpriteState_Reset(state);
    return state;
}

/*
 * Clear all resource pointers, frame position, flags, coordinates, and four
 * trailing control bytes. Set the three signed 8.8 scale fields to 1.0
 * (0x100). The function returns no value and performs no hardware operation.
 */
#ifndef MATCHING
void GraphicsSpriteState_Reset(GraphicsSpriteState *state)
{
    s16 one;

    state->group = 0;
    state->nextOrFree = 0;
    state->previous = 0;
    state->graphicsVramBinding = 0;
    state->indexedPaletteBinding = 0;
    state->graphicsResource = 0;
    state->paletteResource = 0;
    state->animationResource = 0;
    state->animationTime = 0;
    state->objectMode = 0;
    state->sortOrder = 0;
    state->field_26 = 0;
    state->flags = 0;
    state->rotationAngle = 0;
    state->screenY = 0;
    one = 0x100;
    state->screenX = 0;
    state->animationTimeStep = one;
    state->scaleY = one;
    state->scaleX = one;
    state->resourceControlFlags = 0;
    state->oamPriority = 0;
    state->frameIndex = 0;
    state->animationIndex = 0;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void GraphicsSpriteState_Reset(GraphicsSpriteState *state)
{
    mov r2, #0
    str r2, [r0, #0]
    str r2, [r0, #8]
    str r2, [r0, #4]
    str r2, [r0, #0xc]
    str r2, [r0, #0x10]
    str r2, [r0, #0x14]
    str r2, [r0, #0x18]
    str r2, [r0, #0x1c]
    str r2, [r0, #0x20]
    strh r2, [r0, #0x2a]
    strh r2, [r0, #0x28]
    strh r2, [r0, #0x26]
    strh r2, [r0, #0x24]
    strh r2, [r0, #0x30]
    strh r2, [r0, #0x2e]
    mov r1, #0x100
    strh r2, [r0, #0x2c]
    strh r1, [r0, #0x36]
    strh r1, [r0, #0x34]
    strh r1, [r0, #0x32]
    strb r2, [r0, #0x3b]
    strb r2, [r0, #0x3a]
    strb r2, [r0, #0x39]
    strb r2, [r0, #0x38]
    bx lr
}
#endif
