.text
/* Exact fallback; see overlay039_helper_pool2.c for portable C. */
    .extern func_020ae024
    .extern gFx32CosSinTable
    .global func_ov039_022035d4
func_ov039_022035d4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, #0xa
    mov r5, r0
    sub r4, r4, #0x1
L_022035e4:
    add r7, r5, r4, lsl #0x2
    ldr r6, [r7, #0x74]
    ldr r0, [r6, #0x18]
    cmp r0, #0x4
    bne L_022036b8
    str r3, [r6, #0x4]
    ldr r6, [sp, #0x18]
    ldr r0, [r7, #0x74]
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
    ldr r2, L_022036c4
    mov r0, r0, lsl #0x1
    ldrsh lr, [r2, r0]
    ldr r0, L_022036c8
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
    ldr r0, [r5, #0x74]
    orr r7, r7, r6, lsl #0x14
    str r7, [r0, #0x10]
    ldr r0, [r5, #0x74]
    orr r3, r3, r2, lsl #0x14
    str r3, [r0, #0x14]
    ldr r0, [r5, #0x74]
    str r1, [r0, #0x18]
    ldr r0, [r5, #0x74]
    str r1, [r0, #0x1c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_022036b8:
    subs r4, r4, #0x1
    bpl L_022035e4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_022036c4: .word gFx32CosSinTable
L_022036c8: .word 0x1b33
    .size func_ov039_022035d4, .-func_ov039_022035d4

