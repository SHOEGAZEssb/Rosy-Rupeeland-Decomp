.text

/* Exact fallback; see src/overlays/ov037/overlay037_scene_render.c for documented portable C. */

    .extern Graphics3DSceneState_Apply
    .extern Graphics3DLight_Apply
    .extern func_ov037_021fd324
    .extern func_020773e4
    .extern func_ov037_021fd4e0
    .extern func_ov037_021fcf20

    .global func_ov037_021fe440
func_ov037_021fe440:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r6, r0
    add r0, r6, #0x8
    bl Graphics3DSceneState_Apply
    mov r5, #0x0
    add r4, r6, #0x14c
L_021fe45c:
    mov r1, r5
    add r0, r4, r5, lsl #0x4
    bl Graphics3DLight_Apply
    add r5, r5, #0x1
    cmp r5, #0x4
    blt L_021fe45c
    ldr r0, [r6, #0x124]
    bl func_ov037_021fd324
    ldr r0, [r6, #0x114]
    add r1, r6, #0x60
    bl func_020773e4
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r1, r0
    mov r2, r0
    mov r3, r0
    str r0, [sp, #0xc]
    bl func_ov037_021fd4e0
    ldr r4, [r6, #0x140]
    b L_021fe4c4
L_021fe4b4:
    mov r0, r4
    add r1, r6, #0x60
    bl func_ov037_021fcf20
    ldr r4, [r4, #0x8]
L_021fe4c4:
    cmp r4, #0x0
    bne L_021fe4b4
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
    .size func_ov037_021fe440, .-func_ov037_021fe440

    .global func_ov037_021fe4d4
func_ov037_021fe4d4:
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
    .size func_ov037_021fe4d4, .-func_ov037_021fe4d4
