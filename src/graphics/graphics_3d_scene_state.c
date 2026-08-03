#include "tingle/graphics_3d_scene_state.h"

/*
 * Default initialization for a 0x94-byte 3D scene-state object. Confirmed
 * writes establish two 20.12 unit values and six signed boundary/default words;
 * the intervening 0x54 bytes are deliberately untouched by this routine.
 */

/*
 * Clear offsets 0x00..0x08, 0x10..0x1c, 0x24, and 0x8c..0x90; set offsets
 * 0x0c and 0x20 to 0x1000; and set offsets 0x7c/0x80/0x84/0x88 to
 * -0x800, 0x600, 0x800, -0x600. These are confirmed raw defaults, plausibly
 * transform/projection bounds, but no hardware access or allocation occurs.
 */
#ifndef MATCHING
void func_02077ae8(Graphics3DSceneState *state)
{
    state->field_00 = 0;
    state->field_08 = 0;
    state->field_04 = 0;
    state->field_0c = 0x1000;
    state->field_18 = 0;
    state->field_14 = 0;
    state->field_10 = 0;
    state->field_24 = 0;
    state->field_1c = 0;
    state->field_20 = 0x1000;
    state->field_7c = -0x800;
    state->field_80 = 0x600;
    state->field_84 = 0x800;
    state->field_88 = -0x600;
    state->field_90 = 0;
    state->field_8c = 0;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void func_02077ae8(Graphics3DSceneState *state)
{
    mov r3, #0
    str r3, [r0]
    str r3, [r0, #8]
    mov r2, #0x1000
    str r3, [r0, #4]
    str r2, [r0, #0xc]
    str r3, [r0, #0x18]
    str r3, [r0, #0x14]
    str r3, [r0, #0x10]
    str r3, [r0, #0x24]
    str r3, [r0, #0x1c]
    str r2, [r0, #0x20]
    sub r2, r2, #0x1800
    str r2, [r0, #0x7c]
    mov r2, #0x600
    mov r1, #0x800
    str r2, [r0, #0x80]
    str r1, [r0, #0x84]
    sub r1, r1, #0xe00
    str r1, [r0, #0x88]
    str r3, [r0, #0x90]
    str r3, [r0, #0x8c]
    bx lr
}
#endif
