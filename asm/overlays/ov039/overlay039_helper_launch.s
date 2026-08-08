.text
/* Exact fallback; see overlay039_helper_launch.c for documented portable C. */
    .extern func_02005030
    .extern func_02005058
    .extern func_020ae024
    .extern data_020c9670

    .global func_ov039_021fd93c
func_ov039_021fd93c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r8, r0
    ldr r4, [r8, #0x98]
    mov r7, r1
    add r0, sp, #0x0
    add r1, r4, #0x1c
    mov r6, r2
    mov r5, r3
    bl func_02005030
    ldr r1, [sp, #0x8]
    mov r0, #0x1e
    add r1, r1, #0xa000
    str r1, [sp, #0x8]
    sub r4, r0, #0x1
L_021fd978:
    add r2, r8, r4, lsl #0x2
    ldr r1, [r2, #0xa0]
    ldr r0, [r1, #0x18]
    cmp r0, #0x4
    bne L_021fda60
    ldr r0, [sp, #0x4]
    cmp r7, #0x0
    str r0, [r1, #0x4]
    ldr r1, [sp, #0x8]
    ldr r0, [r2, #0xa0]
    cmpeq r6, #0x0
    str r1, [r0, #0x8]
    moveq r1, #0x0
    moveq r0, #0xfa0
    ldrne r1, [sp, #0x4]
    ldrne r0, [sp, #0x8]
    subne r1, r7, r1
    subne r0, r6, r0
    bl func_020ae024
    add r0, r5, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    ldr r2, L_021fda78
    mov r0, r0, lsl #0x1
    ldrsh r7, [r2, r0]
    ldr r0, L_021fda7c
    mov r1, r1, lsl #0x1
    ldrsh r2, [r2, r1]
    umull r6, ip, r7, r0
    mov r1, #0x0
    umull r5, r3, r2, r0
    mla r3, r2, r1, r3
    adds lr, r6, #0x800
    add r6, r8, r4, lsl #0x2
    mov r2, r2, asr #0x1f
    mla ip, r7, r1, ip
    mov r4, r7, asr #0x1f
    mla ip, r4, r0, ip
    mla r3, r2, r0, r3
    adc r7, ip, #0x0
    mov r8, lr, lsr #0xc
    adds r4, r5, #0x800
    adc r2, r3, #0x0
    mov r3, r4, lsr #0xc
    ldr r0, [r6, #0xa0]
    orr r8, r8, r7, lsl #0x14
    str r8, [r0, #0x10]
    ldr r0, [r6, #0xa0]
    orr r3, r3, r2, lsl #0x14
    str r3, [r0, #0x14]
    ldr r0, [r6, #0xa0]
    str r1, [r0, #0x18]
    ldr r0, [r6, #0xa0]
    str r1, [r0, #0x1c]
    b L_021fda68
L_021fda60:
    subs r4, r4, #0x1
    bpl L_021fd978
L_021fda68:
    add r0, sp, #0x0
    bl func_02005058
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
L_021fda78: .word data_020c9670
L_021fda7c: .word 0x1b33
    .size func_ov039_021fd93c, .-func_ov039_021fd93c

    .global func_ov039_021fda80
func_ov039_021fda80:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, #0x1e
    mov r5, r0
    sub r4, r4, #0x1
L_021fda90:
    add r7, r5, r4, lsl #0x2
    ldr r6, [r7, #0xa0]
    ldr r0, [r6, #0x18]
    cmp r0, #0x4
    bne L_021fdb64
    str r3, [r6, #0x4]
    ldr r6, [sp, #0x18]
    ldr r0, [r7, #0xa0]
    cmp r1, #0x0
    cmpeq r2, #0x0
    str r6, [r0, #0x8]
    moveq r0, #0xfa0
    ldrne r0, [sp, #0x18]
    moveq r1, #0x0
    subne r1, r1, r3
    subne r0, r2, r0
    bl func_020ae024
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    ldr r2, L_021fdb70
    mov r0, r0, lsl #0x1
    ldrsh lr, [r2, r0]
    ldr r0, L_021fdb74
    mov r1, r1, lsl #0x1
    ldrsh r2, [r2, r1]
    umull r7, r6, lr, r0
    mov r1, #0x0
    umull ip, r3, r2, r0
    mla r3, r2, r1, r3
    add r5, r5, r4, lsl #0x2
    mov r2, r2, asr #0x1f
    adds r7, r7, #0x800
    mla r6, lr, r1, r6
    mov r4, lr, asr #0x1f
    mla r6, r4, r0, r6
    mla r3, r2, r0, r3
    adc r6, r6, #0x0
    mov r7, r7, lsr #0xc
    adds r4, ip, #0x800
    adc r2, r3, #0x0
    mov r3, r4, lsr #0xc
    ldr r0, [r5, #0xa0]
    orr r7, r7, r6, lsl #0x14
    str r7, [r0, #0x10]
    ldr r0, [r5, #0xa0]
    orr r3, r3, r2, lsl #0x14
    str r3, [r0, #0x14]
    ldr r0, [r5, #0xa0]
    str r1, [r0, #0x18]
    ldr r0, [r5, #0xa0]
    str r1, [r0, #0x1c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_021fdb64:
    subs r4, r4, #0x1
    bpl L_021fda90
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_021fdb70: .word data_020c9670
L_021fdb74: .word 0x1b33
    .size func_ov039_021fda80, .-func_ov039_021fda80

