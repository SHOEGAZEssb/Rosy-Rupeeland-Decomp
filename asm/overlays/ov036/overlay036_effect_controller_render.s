.text

/* Exact fallback; see src/overlays/ov036/overlay036_effect_controller_runtime.c for documented portable C. */

    .extern Graphics3DSceneState_Apply
    .extern GraphicsAnimationInstanceManager_Render
    .extern func_ov036_021fe028
    .extern func_ov036_021fd128
    .extern func_ov036_021fdef0
    .extern func_ov036_021fe988

    .global func_ov036_021ff184
func_ov036_021ff184:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    add r0, r4, #0xc
    bl Graphics3DSceneState_Apply
    ldr r0, [r4, #0xdc]
    add r1, r4, #0x64
    bl GraphicsAnimationInstanceManager_Render
    ldr r0, [r4, #0x11c]
    bl func_ov036_021fe028
    mov r0, #0x1f
    str r0, [sp, #0x0]
    mov r0, #0x0
    mov r1, r0
    mov r2, #0x3
    mov r3, #0x13
    str r0, [sp, #0x4]
    bl func_ov036_021fd128
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    mov r1, r0
    mov r2, r0
    mov r3, r0
    bl func_ov036_021fdef0
    ldr r4, [r4, #0x10c]
    b L_021ff204
L_021ff1f8:
    mov r0, r4
    bl func_ov036_021fe988
    ldr r4, [r4, #0x8]
L_021ff204:
    cmp r4, #0x0
    bne L_021ff1f8
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
    .size func_ov036_021ff184, .-func_ov036_021ff184

