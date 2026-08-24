#include "tingle/graphics_sprite_position.h"

/*
 * Margin-aware fixed-point sprite positioning. This variant converts world
 * coordinates relative to a retained origin, tests them against a caller-
 * supplied expanded viewport, and updates sprite coordinates, one selected
 * culling flag, and a depth-order halfword.
 */

#ifndef MATCHING
/*
 * Convert positionX/Y and depth from 20.12 fixed point. The visible interval
 * is [-field_04, 256-field_00) by [-field_06, 192-field_02). On success write
 * screenX/screenY and clear cullFlag; otherwise set cullFlag and retain those
 * coordinates. Always store 0x7fff minus the pre-depth relative Y in sortOrder.
 * No graphics register is accessed directly and no value is returned.
 */
void GraphicsSpriteState_SetDepthOrderedWorldPositionWithMargins(
    GraphicsSpriteState *state, const GraphicsPositionSource *origin,
    const GraphicsPositionMargins *margins, s32 positionX, s32 positionY,
    s32 depth, u16 cullFlag)
{
    s32 x = (positionX >> 12) - (origin->field_04 >> 12);
    s32 relativeY = (positionY >> 12) - (origin->field_08 >> 12);
    s32 y = relativeY - (depth >> 12);

    if (x >= -margins->field_04 && x < 256 - margins->field_00 &&
        y >= -margins->field_06 && y < 192 - margins->field_02) {
        state->screenX = (s16)x;
        state->screenY = (s16)y;
        state->flags &= (u16)~cullFlag;
    } else {
        state->flags |= cullFlag;
    }
    state->sortOrder = (u16)(0x7fff - relativeY);
}
#else
/* This matching form implements the documented portable C directly above. */
asm void GraphicsSpriteState_SetDepthOrderedWorldPositionWithMargins(
    GraphicsSpriteState *, const GraphicsPositionSource *,
    const GraphicsPositionMargins *, s32, s32, s32, u16)
{
    stmdb sp!, {r3, r4, r5, lr}
    ldr r4, [r1, #4]
    ldrsh lr, [r2, #4]
    ldr r1, [r1, #8]
    mov r5, r4, asr #12
    ldr ip, [sp, #0x10]
    mov r4, r1, asr #12
    rsb r1, r5, r3, asr #12
    rsb r3, lr, #0
    cmp r1, r3
    rsb ip, r4, ip, asr #12
    blt outside
    ldrsh r3, [r2]
    rsb r3, r3, #0x100
    cmp r1, r3
    bge outside
    ldrsh r3, [r2, #6]
    ldr lr, [sp, #0x14]
    sub lr, ip, lr, asr #12
    rsb r3, r3, #0
    cmp lr, r3
    blt outside
    ldrsh r2, [r2, #2]
    rsb r2, r2, #0xc0
    cmp lr, r2
    bge outside
    strh r1, [r0, #0x2c]
    strh lr, [r0, #0x2e]
    ldrh r1, [sp, #0x18]
    ldrh r2, [r0, #0x24]
    mvn r1, r1
    and r1, r2, r1
    strh r1, [r0, #0x24]
    b finish
outside:
    ldrh r2, [r0, #0x24]
    ldrh r1, [sp, #0x18]
    orr r1, r2, r1
    strh r1, [r0, #0x24]
finish:
    ldr r1, =0x7fff
    sub r1, r1, ip
    strh r1, [r0, #0x28]
    ldmia sp!, {r3, r4, r5, pc}
}
#endif
