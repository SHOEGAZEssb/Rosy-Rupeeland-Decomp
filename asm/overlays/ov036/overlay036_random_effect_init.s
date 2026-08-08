.text

/* Exact fallback; see src/overlays/ov036/overlay036_random_effect.c for documented portable C. */

    .extern func_020949ec
    .extern func_ov036_021fe218
    .extern genrand_int32
    .extern func_02094bbc
    .extern func_020948e4
    .extern func_02091a70
    .extern data_ov036_02205f80

    .global func_ov036_021fe258
func_ov036_021fe258:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_020949ec
    ldr r1, L_021fe324
    add r0, r5, #0x9c
    str r1, [r5, #0x0]
    bl func_ov036_021fe218
    mov r0, #0x0
    str r0, [r5, #0xc8]
    bl genrand_int32
    str r0, [r5, #0xc8]
    mov r3, #0x0
    str r3, [r5, #0xac]
    str r3, [r5, #0xcc]
    mov r0, r5
    ldr r1, [r4, #0x0]
    sub r2, r3, #0x600
    bl func_02094bbc
    add r0, r5, #0x1c
    mov r1, #0x4
    ldr r2, [r4, #0x4]
    bl func_020948e4
    mov r0, #0x0
    mov r1, #0xb4
    mov r2, #0x800
    ldr r3, [r4, #0x4]
    bl func_02091a70
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    str r0, [r5, #0x7c]
    mov r0, #0x0
    str r0, [r5, #0x80]
    ldrh r2, [r4, #0x8]
    mov r1, #0x1
    mov r0, r5
    str r2, [r5, #0xb0]
    ldrh r2, [r4, #0xa]
    str r2, [r5, #0xb4]
    ldrh r2, [r4, #0xc]
    str r2, [r5, #0xb8]
    ldrh r2, [r4, #0xe]
    str r2, [r5, #0xbc]
    ldrh r2, [r4, #0x10]
    str r2, [r5, #0xc0]
    ldrh r2, [r4, #0x12]
    str r2, [r5, #0xc4]
    ldr r2, [r4, #0x1c]
    str r2, [r5, #0xd0]
    str r1, [r5, #0x88]
    ldmia sp!, {r3, r4, r5, pc}
L_021fe324: .word data_ov036_02205f80
    .size func_ov036_021fe258, .-func_ov036_021fe258
