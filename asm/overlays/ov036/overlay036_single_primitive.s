.text

/* Exact fallback; see src/overlays/ov036/overlay036_single_primitive.c for documented portable C. */

    .extern Presentation_Init
    .extern func_020b0808
    .extern data_ov036_022060b4
    .extern data_020c9670

    .global func_ov036_021fd690
func_ov036_021fd690:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    mov r7, r1
    mov r6, r2
    mov r5, r3
    bl Presentation_Init
    ldr r0, L_021fd6dc
    ldrh r1, [sp, #0x18]
    str r0, [r4, #0x0]
    str r7, [r4, #0x9c]
    ldrh r0, [sp, #0x1c]
    strh r1, [r4, #0xa0]
    mov r1, #0x1
    strh r0, [r4, #0xa2]
    strh r6, [r4, #0xa4]
    strh r5, [r4, #0xa6]
    mov r0, r4
    str r1, [r4, #0x88]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_021fd6dc: .word data_ov036_022060b4
    .size func_ov036_021fd690, .-func_ov036_021fd690

    .global func_ov036_021fd6e0
func_ov036_021fd6e0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr lr, [r4, #0x60]
    ldr ip, L_021fd81c
    mov r0, #0x0
    str r0, [ip, #0x0]
    ldr r3, [r4, #0x30]
    ldr r2, [r4, #0x20]
    ldr r1, [r4, #0x10]
    mov r0, #0x10000
    str r1, [ip, #0x2c]
    str r2, [ip, #0x2c]
    str r3, [ip, #0x2c]
    str r0, [ip, #0x28]
    str r0, [ip, #0x28]
    str r0, [ip, #0x28]
    ldr r1, [r4, #0x9c]
    mov r0, lr, lsl #0x10
    cmp r1, #0x0
    mov r0, r0, lsr #0x10
    beq L_021fd740
    cmp r1, #0x1
    beq L_021fd798
    b L_021fd804
L_021fd740:
    ldrsh r0, [r4, #0xa4]
    ldrsh r1, [r4, #0xa6]
    bl func_020b0808
    ldr r2, L_021fd820
    mov ip, #0x0
    str ip, [r2, #0x0]
    ldrh r0, [r4, #0xa0]
    sub r3, r2, #0x80
    ldr r1, L_021fd824
    str r0, [r3, #0x0]
    sub r0, r2, #0x74
    str r1, [r0, #0x0]
    str ip, [r0, #0x0]
    ldrh r1, [r4, #0xa2]
    mov r0, #0xf8000000
    str r1, [r3, #0x0]
    str r0, [r2, #-0x68]!
    ldrh r1, [r4, #0xa0]
    mov r0, #0x8
    str r1, [r3, #0x0]
    str r0, [r2, #0x0]
    b L_021fd804
L_021fd798:
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    mov r3, r1, lsl #0x1
    ldr r2, L_021fd828
    mov r1, r0, lsl #0x1
    ldrsh r0, [r2, r3]
    ldrsh r1, [r2, r1]
    bl func_020b0808
    ldr r2, L_021fd820
    mov ip, #0x0
    str ip, [r2, #0x0]
    ldrh r0, [r4, #0xa0]
    sub r3, r2, #0x80
    ldr r1, L_021fd82c
    str r0, [r3, #0x0]
    sub r0, r2, #0x74
    str r1, [r0, #0x0]
    str ip, [r0, #0x0]
    ldrh r1, [r4, #0xa2]
    sub r0, ip, #0x1800000
    str r1, [r3, #0x0]
    str r0, [r2, #-0x6c]!
    ldrh r1, [r4, #0xa0]
    mov r0, #0x2
    str r1, [r3, #0x0]
    str r0, [r2, #0x0]
L_021fd804:
    ldr r1, L_021fd830
    mov r0, #0x0
    str r0, [r1, #0x0]
    mov r0, #0x1
    str r0, [r1, #-0xbc]
    ldmia sp!, {r4, pc}
L_021fd81c: .word 0x4000444
L_021fd820: .word 0x4000500
L_021fd824: .word 0xfff8
L_021fd828: .word data_020c9670
L_021fd82c: .word 0xfffe
L_021fd830: .word 0x4000504
    .size func_ov036_021fd6e0, .-func_ov036_021fd6e0

