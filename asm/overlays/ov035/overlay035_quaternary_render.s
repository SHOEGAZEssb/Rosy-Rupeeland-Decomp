.text

/* Exact fallback; see src/overlays/ov035/overlay035_quaternary_render.c for documented portable C. */

    .extern Graphics3DSceneState_Apply
    .extern Graphics3DLight_Apply
    .extern func_ov048_0220baec
    .extern func_020773e4
    .extern func_ov035_021fd7b0
    .extern func_ov035_021fcfa0

    .global func_ov035_022007ec
func_ov035_022007ec:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r4, r0
    add r0, r4, #0xc
    bl Graphics3DSceneState_Apply
    mov r6, #0x0
    add r5, r4, #0x120
L_02200808:
    mov r1, r6
    add r0, r5, r6, lsl #0x4
    bl Graphics3DLight_Apply
    add r6, r6, #0x1
    cmp r6, #0x4
    blt L_02200808
    mvn r0, #0x7f
    str r0, [sp, #0x0]
    mov r0, #0x18
    mov ip, #0x10
    str r0, [sp, #0x4]
    sub r0, ip, #0xd0
    mov r1, #0x180
    mov r2, #0xc0
    mov r3, #0x0
    str ip, [sp, #0x8]
    bl func_ov048_0220baec
    mvn r1, #0x7f
    str r1, [sp, #0x0]
    mov r1, #0x10
    mov r2, #0xc0
    str r1, [sp, #0x4]
    mov r0, #0x18
    str r0, [sp, #0x8]
    sub r0, r0, #0xd8
    sub r3, r2, #0x240
    mov r1, #0x0
    bl func_ov048_0220baec
    ldr r0, [r4, #0x104]
    add r1, r4, #0x64
    bl func_020773e4
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    mov r1, r0
    mov r2, r0
    mov r3, r0
    bl func_ov035_021fd7b0
    ldr r5, [r4, #0x174]
    b L_022008c0
L_022008b0:
    mov r0, r5
    add r1, r4, #0x64
    bl func_ov035_021fcfa0
    ldr r5, [r5, #0x8]
L_022008c0:
    cmp r5, #0x0
    bne L_022008b0
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
    .size func_ov035_022007ec, .-func_ov035_022007ec

