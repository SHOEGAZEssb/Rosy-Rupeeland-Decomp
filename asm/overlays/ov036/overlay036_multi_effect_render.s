.text

/* Exact fallback; see src/overlays/ov036/overlay036_multi_effect_render.c for documented portable C. */

    .extern Graphics3DSceneState_Apply
    .extern func_020773e4
    .extern func_ov036_021fdef0
    .extern func_ov036_021fcfa0
    .extern func_ov036_021fd128
    .extern func_ov036_021fd4c8

    .global func_ov036_021ffefc
func_ov036_021ffefc:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r0
    add r0, r5, #0xc
    bl Graphics3DSceneState_Apply
    ldr r0, [r5, #0xe8]
    add r1, r5, #0x64
    bl func_020773e4
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r1, r0
    mov r2, r0
    mov r3, r0
    str r0, [sp, #0xc]
    bl func_ov036_021fdef0
    ldr r4, [r5, #0x11c]
    b L_021fff58
L_021fff48:
    mov r0, r4
    add r1, r5, #0x64
    bl func_ov036_021fcfa0
    ldr r4, [r4, #0x8]
L_021fff58:
    cmp r4, #0x0
    bne L_021fff48
    mov r1, #0x1f
    mov r0, #0x0
    str r1, [sp, #0x0]
    mov r1, r0
    str r0, [sp, #0x4]
    mov r2, #0x3
    mov r3, #0x10
    bl func_ov036_021fd128
    ldr r4, [r5, #0x12c]
    b L_021fff94
L_021fff88:
    mov r0, r4
    bl func_ov036_021fd4c8
    ldr r4, [r4, #0x8]
L_021fff94:
    cmp r4, #0x0
    bne L_021fff88
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
    .size func_ov036_021ffefc, .-func_ov036_021ffefc

