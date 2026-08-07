    .text
    .extern data_020f4e14
    .extern func_02070958
    .extern func_02074dc8

/* Exact fallback; see documented portable reconstruction in
 * src/overlays/ov009/overlay009_scene_state_reset.c. */
    .global func_ov009_021fd294
func_ov009_021fd294: ; 0x021fd294
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x80
    str r0, [r4, #0xf0]
    mov r0, #0x60
    str r0, [r4, #0xf4]
    mov r0, #0x2
    str r0, [r4, #0xf8]
    mov r0, #0x1
    str r0, [r4, #0x10c]
    mov r2, #0x0
    str r2, [r4, #0x110]
    str r2, [r4, #0x114]
    add r0, r4, #0x100
    strh r2, [r0, #0x8]
    mov r1, #0x100
    str r1, [r4, #0xfc]
    str r1, [r4, #0x100]
    str r1, [r4, #0x104]
    mov r0, #0x8
    str r0, [r4, #0xe8]
    str r2, [r4, #0x118]
    str r1, [r4, #0x120]
    str r1, [r4, #0x124]
    str r1, [r4, #0x128]
    mov r0, #0x10
    str r0, [r4, #0x134]
    ldr r0, [r4, #0x88]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r0, #0x18]
    ldr r1, [r4, #0x120]
    ldr r2, [r4, #0x124]
    ldr r3, [r4, #0x128]
    bl func_02070958
    ldr r0, L_021fd334
    ldr r1, [r4, #0x88]
    ldr r0, [r0, #0x0]
    bl func_02074dc8
    ldmia sp!, {r4, pc}
L_021fd334: .word data_020f4e14

    .size func_ov009_021fd294, . - func_ov009_021fd294
