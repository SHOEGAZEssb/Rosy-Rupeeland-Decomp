.text

/* Exact fallback; see src/overlays/ov035/overlay035_senary_render_helpers.c for documented portable C. */

    .extern Graphics3DSceneState_Apply
    .extern GraphicsAnimationInstanceManager_Render
    .extern func_ov035_021fd7b0
    .extern func_ov035_021fcfa0

    .global func_ov035_022022e4
func_ov035_022022e4:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r0
    add r0, r5, #0xc
    bl Graphics3DSceneState_Apply
    ldr r0, [r5, #0xf4]
    add r1, r5, #0x64
    bl GraphicsAnimationInstanceManager_Render
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r1, r0
    mov r2, r0
    mov r3, r0
    str r0, [sp, #0xc]
    bl func_ov035_021fd7b0
    ldr r4, [r5, #0x120]
    b L_02202340
L_02202330:
    mov r0, r4
    add r1, r5, #0x64
    bl func_ov035_021fcfa0
    ldr r4, [r4, #0x8]
L_02202340:
    cmp r4, #0x0
    bne L_02202330
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
    .size func_ov035_022022e4, .-func_ov035_022022e4

    .global func_ov035_02202350
func_ov035_02202350:
    stmdb sp!, {r0, r1, r2, r3}
    ldr r2, [sp, #0x4]
    ldr r1, [sp, #0x8]
    str r2, [r0, #0x24]
    str r1, [r0, #0x28]
    mov r1, #0x0
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    add sp, sp, #0x10
    bx lr
    .size func_ov035_02202350, .-func_ov035_02202350

