.text

/* Exact fallback; see src/overlays/ov036/overlay036_quad_controller_render.c for documented portable C. */

    .extern Graphics3DSceneState_Apply
    .extern func_ov036_022029b0
    .extern GraphicsAnimationInstanceManager_Render
    .extern func_ov036_021fdef0
    .extern func_ov036_021fcfa0

    .global func_ov036_0220293c
func_ov036_0220293c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r0
    add r0, r5, #0xc
    bl Graphics3DSceneState_Apply
    add r0, r5, #0x11c
    bl func_ov036_022029b0
    ldr r0, [r5, #0xf8]
    add r1, r5, #0x64
    bl GraphicsAnimationInstanceManager_Render
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    mov r1, r0
    mov r2, r0
    mov r3, r0
    bl func_ov036_021fdef0
    ldr r4, [r5, #0x110]
    b L_022029a0
L_02202990:
    mov r0, r4
    add r1, r5, #0x64
    bl func_ov036_021fcfa0
    ldr r4, [r4, #0x8]
L_022029a0:
    cmp r4, #0x0
    bne L_02202990
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
    .size func_ov036_0220293c, .-func_ov036_0220293c

