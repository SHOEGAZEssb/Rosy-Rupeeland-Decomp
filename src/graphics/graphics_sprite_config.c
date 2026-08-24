#include "tingle/graphics_sprite_state.h"

/*
 * High-level configuration of an existing sprite animation state. This helper
 * combines animation selection with several still-unidentified render/control
 * fields that callers normally set as one operation.
 */

/*
 * Select animationIndex through GraphicsSpriteState_SetAnimationIndex, then
 * store the supplied screen coordinates, OAM priority, and sort order.
 * OR flags into the existing flags word, preserving all earlier bits. The
 * state is the only modified object;
 * any frame reset or attached-metadata invalidation is performed by the called
 * animation selector. There are no direct SDK or graphics-hardware accesses.
 */
#ifndef MATCHING
void func_02073e48(GraphicsSpriteState *state, u8 animationIndex,
                   s16 screenX, s16 screenY, u8 oamPriority,
                   u16 sortOrder, u16 flags)
{
    GraphicsSpriteState_SetAnimationIndex(state, animationIndex);
    state->screenX = screenX;
    state->screenY = screenY;
    state->oamPriority = oamPriority;
    state->sortOrder = sortOrder;
    state->flags |= flags;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void func_02073e48(GraphicsSpriteState *state, u8 animationIndex,
                       s16 screenX, s16 screenY, u8 oamPriority,
                       u16 sortOrder, u16 flags)
{
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    mov r6, r2
    and r1, r1, #0xff
    mov r5, r3
    bl GraphicsSpriteState_SetAnimationIndex
    strh r6, [r4, #0x2c]
    ldr r0, [sp, #0x18]
    ldr r2, [sp, #0x10]
    strh r5, [r4, #0x2e]
    ldr r1, [sp, #0x14]
    strb r2, [r4, #0x3a]
    strh r1, [r4, #0x28]
    ldrh r1, [r4, #0x24]
    mov r0, r0, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    strh r0, [r4, #0x24]
    ldmia sp!, {r4, r5, r6, pc}
}
#endif
