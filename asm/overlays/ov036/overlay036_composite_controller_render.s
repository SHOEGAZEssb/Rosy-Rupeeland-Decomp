.text

/* Exact fallback; see src/overlays/ov036/overlay036_composite_controller_render.c for documented portable C. */

    .extern Graphics3DSceneState_Apply
    .extern func_ov036_022029b0
    .extern func_ov036_021fdef0
    .extern func_ov036_021fcfa0
    .extern func_ov036_021fdd4c
    .extern func_020773e4
    .extern func_ov036_021fd128
    .extern func_ov036_021fd97c

    .global func_ov036_02203774
func_ov036_02203774:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    add r0, r4, #0xc
    bl Graphics3DSceneState_Apply
    add r0, r4, #0x160
    bl func_ov036_022029b0
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r1, r0
    mov r2, r0
    mov r3, r0
    str r0, [sp, #0xc]
    bl func_ov036_021fdef0
    ldr r0, [r4, #0x154]
    add r1, r4, #0x64
    bl func_ov036_021fcfa0
    ldr r0, [r4, #0x158]
    add r1, r4, #0x64
    bl func_ov036_021fcfa0
    ldr r0, [r4, #0x1a0]
    bl func_ov036_021fdd4c
    ldr r0, [r4, #0xf4]
    add r1, r4, #0x64
    bl func_020773e4
    mov r0, #0x1f
    str r0, [sp, #0x0]
    mov r0, #0x8000
    str r0, [sp, #0x4]
    mov r0, #0x0
    mov r1, r0
    mov r2, #0x3
    mov r3, #0x14
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
    ldr r4, [r4, #0x114]
    b L_0220383c
L_02203830:
    mov r0, r4
    bl func_ov036_021fd97c
    ldr r4, [r4, #0x8]
L_0220383c:
    cmp r4, #0x0
    bne L_02203830
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
    .size func_ov036_02203774, .-func_ov036_02203774

