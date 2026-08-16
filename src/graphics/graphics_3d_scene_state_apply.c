#include "tingle/graphics_3d_scene_state.h"

/*
 * Projection/view setup for Graphics3DSceneState. It selects one of three
 * projection forms, builds retained view/derived matrices from three vectors,
 * and leaves the NDS geometry engine in position-vector matrix mode.
 */

#define REG_G3_MTX_MODE (*(volatile u32 *)0x04000440)
#define REG_G3_MTX_IDENTITY (*(volatile u32 *)0x04000454)

#ifdef __cplusplus
extern "C" {
#endif

extern void func_020b0d50(s32 field_00, s32 field_04, s32 field_08,
                          s32 field_0c, s32 field_10, s32 field_14,
                          s32 field_18, void *output);
extern void func_020b0a54(s32 field_00, s32 field_04, s32 field_08,
                          s32 field_0c, s32 field_10, s32 field_14,
                          s32 field_18, s32 field_1c, void *output);
extern void func_020b0f40(s32 field_00, s32 field_04, s32 field_08,
                          s32 field_0c, s32 field_10, s32 field_14,
                          s32 field_18, s32 field_1c, void *output);
extern void func_020b08bc(const s32 *field_00, const s32 *field_04,
                          const s32 *field_08, s32 field_0c, s32 *output);
extern void func_020b58d4(const s32 *source, s32 *destination);
extern s32 func_020ad378(const s32 *source, s32 *destination);

#ifdef __cplusplus
}
#endif

/*
 * Select projection matrix mode and reset it first. Mode 0 installs fixed
 * perspective parameters; mode 1 uses the four stored boundaries offset by
 * projectionOffsetX/projectionOffsetY with far value 0x8000; mode 2 builds a
 * fixed-size frustum around those offsets with far value 0x64000. Other modes
 * retain identity.
 * Then build field_28 from vectors at 0x04, 0x1c, and 0x10, derive/invert the
 * matrix at field_58, reset texture matrix mode, and finish in position-vector
 * mode. All geometry-register writes and SDK matrix calls are ordered effects.
 */
#ifndef MATCHING
void Graphics3DSceneState_Apply(Graphics3DSceneState *state)
{
    REG_G3_MTX_MODE = 0;
    REG_G3_MTX_IDENTITY = 0;

    if (state->projectionMode == 0) {
        func_020b0d50(0x23a, 0xfd8, 0x1555, 0x1000, 0x64000, 0x1000,
                      1, 0);
    } else if (state->projectionMode == 1) {
        func_020b0a54(state->projectionOffsetY + state->projectionTop,
                      state->projectionOffsetY + state->projectionBottom,
                      state->projectionOffsetX + state->projectionLeft,
                      state->projectionOffsetX + state->projectionRight,
                      0x1000, 0x8000, 0x1000, 1, 0);
    } else if (state->projectionMode == 2) {
        func_020b0f40(state->projectionOffsetY + 0x23f,
                      state->projectionOffsetY - 0x23f,
                      state->projectionOffsetX - 0x2ff,
                      state->projectionOffsetX + 0x2ff,
                      0x1000, 0x64000, 0x1000, 1, 0);
    }

    func_020b08bc(&state->field_04, &state->field_1c, &state->field_10,
                  1, state->field_28);
    func_020b58d4(state->field_28, state->field_58);
    func_020ad378(state->field_58, state->field_58);
    REG_G3_MTX_MODE = 3;
    REG_G3_MTX_IDENTITY = 0;
    REG_G3_MTX_MODE = 2;
}
#else
/* This matching fallback implements the documented portable C directly above. */
asm void Graphics3DSceneState_Apply(Graphics3DSceneState *state)
{
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x14
    /* Load the trailing 0x04000440 geometry matrix-mode literal. */
    DCD 0xE59F1140
    mov r12, #0
    str r12, [r1]
    mov r4, r0
    str r12, [r1, #0x14]
    ldr r0, [r4]
    cmp r0, #0
    beq scene_state_apply_perspective
    cmp r0, #1
    beq scene_state_apply_orthographic
    cmp r0, #2
    beq scene_state_apply_frustum
    b scene_state_apply_view
scene_state_apply_perspective:
    mov r3, #0x1000
    mov r0, #0x64000
    stmia sp, {r0, r3}
    mov r0, #1
    str r0, [sp, #8]
    /* Load the trailing 0x023a and 0x1555 projection literals. */
    DCD 0xE59F00FC
    DCD 0xE59F20FC
    sub r1, r3, #0x28
    str r12, [sp, #0xc]
    bl func_020b0d50
    b scene_state_apply_view
scene_state_apply_orthographic:
    ldr r3, [r4, #0x8c]
    ldr r6, [r4, #0x90]
    mov r1, #0x1000
    str r1, [sp]
    mov r0, #0x8000
    stmib sp, {r0, r1}
    mov r0, #1
    str r0, [sp, #0xc]
    str r12, [sp, #0x10]
    ldr r0, [r4, #0x80]
    ldr r1, [r4, #0x88]
    ldr r2, [r4, #0x7c]
    ldr r5, [r4, #0x84]
    add r2, r3, r2
    add r0, r6, r0
    add r1, r6, r1
    add r3, r3, r5
    bl func_020b0a54
    b scene_state_apply_view
scene_state_apply_frustum:
    ldr r8, [r4, #0x8c]
    ldr r7, [r4, #0x90]
    mov lr, #1
    mov r6, #0x1000
    add r0, r7, #0x3f
    sub r1, lr, #0x240
    sub r2, lr, #0x300
    add r3, r8, #0xff
    str r6, [sp]
    mov r5, #0x64000
    stmib sp, {r5, r6, lr}
    add r0, r0, #0x200
    add r1, r7, r1
    add r2, r8, r2
    add r3, r3, #0x200
    str r12, [sp, #0x10]
    bl func_020b0f40
scene_state_apply_view:
    add r12, r4, #0x28
    add r0, r4, #4
    add r1, r4, #0x1c
    add r2, r4, #0x10
    mov r3, #1
    str r12, [sp]
    bl func_020b08bc
    add r0, r4, #0x28
    add r1, r4, #0x58
    bl func_020b58d4
    add r0, r4, #0x58
    mov r1, r0
    bl func_020ad378
    /* Reload the same trailing geometry matrix-mode literal. */
    DCD 0xE59F101C
    mov r0, #3
    str r0, [r1]
    mov r0, #0
    str r0, [r1, #0x14]
    mov r0, #2
    str r0, [r1]
    add sp, sp, #0x14
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
scene_state_apply_literals:
    DCD 0x04000440
    DCD 0x0000023a
    DCD 0x00001555
}
#endif
