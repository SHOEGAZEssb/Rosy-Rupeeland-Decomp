.text
.extern func_02004fe0

/* Matching evaluators; see vec_fx32_bezier.c for the portable formulas. */
.global func_020063a4
.type func_020063a4, @function
func_020063a4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r2
    mov r5, r0
    mov r4, r1
    bl func_02004fe0
    rsb lr, r6, #0x1000
    smull r0, r1, lr, lr
    adds r3, r0, #0x800
    adc r2, r1, #0
    mov r3, r3, lsr #0xc
    ldr r1, [r4, #4]
    orr r3, r3, r2, lsl #0x14
    smull r1, r7, r3, r1
    adds ip, r1, #0x800
    mov r0, r6, lsl #1
    smull r2, r1, r0, lr
    adc r7, r7, #0
    mov r0, ip, lsr #0xc
    orr r0, r0, r7, lsl #0x14
    adds r2, r2, #0x800
    str r0, [r5, #4]
    adc r7, r1, #0
    mov r2, r2, lsr #0xc
    ldr r1, [r4, #0x24]
    orr r2, r2, r7, lsl #0x14
    smull r1, lr, r2, r1
    adds r7, r1, #0x800
    smull r1, ip, r6, r6
    adc lr, lr, #0
    adds r6, r1, #0x800
    mov r1, r7, lsr #0xc
    orr r1, r1, lr, lsl #0x14
    add r1, r0, r1
    str r1, [r5, #4]
    mov r0, r6, lsr #0xc
    adc ip, ip, #0
    ldr r6, [r4, #0x14]
    orr r0, r0, ip, lsl #0x14
    smull ip, r6, r0, r6
    adds ip, ip, #0x800
    adc r6, r6, #0
    mov ip, ip, lsr #0xc
    orr ip, ip, r6, lsl #0x14
    add r1, r1, ip
    str r1, [r5, #4]
    ldr r1, [r4, #8]
    smull r6, r1, r3, r1
    adds r3, r6, #0x800
    adc r1, r1, #0
    mov r6, r3, lsr #0xc
    orr r6, r6, r1, lsl #0x14
    str r6, [r5, #8]
    ldr r1, [r4, #0x28]
    smull r3, r1, r2, r1
    adds r2, r3, #0x800
    adc r1, r1, #0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    add r3, r6, r2
    str r3, [r5, #8]
    ldr r1, [r4, #0x18]
    smull r2, r1, r0, r1
    adds r2, r2, #0x800
    adc r0, r1, #0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    str r0, [r5, #8]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    .size func_020063a4, .-func_020063a4

.global func_020064b8
.type func_020064b8, @function
func_020064b8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r2
    mov r5, r0
    mov r4, r1
    bl func_02004fe0
    rsb r7, r6, #0x1000
    smull r0, r1, r7, r7
    adds r3, r0, #0x800
    adc r2, r1, #0
    mov ip, r3, lsr #0xc
    ldr r1, [r4, #4]
    orr ip, ip, r2, lsl #0x14
    smull r1, r3, ip, r1
    mov r0, r6, lsl #1
    adds r8, r1, #0x800
    smull r2, r1, r0, r7
    adc r7, r3, #0
    adds r3, r2, #0x800
    mov r0, r8, lsr #0xc
    orr r0, r0, r7, lsl #0x14
    str r0, [r5, #4]
    adc r2, r1, #0
    mov r3, r3, lsr #0xc
    ldr r1, [r4, #0x24]
    orr r3, r3, r2, lsl #0x14
    smull r1, r7, r3, r1
    adds r8, r1, #0x800
    smull r2, r1, r6, r6
    adc r6, r7, #0
    adds r2, r2, #0x800
    mov r7, r8, lsr #0xc
    orr r7, r7, r6, lsl #0x14
    add r0, r0, r7
    str r0, [r5, #4]
    adc r1, r1, #0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    ldr r1, [r4, #0x14]
    mov lr, #0
    smull r6, r1, r2, r1
    adds r6, r6, #0x800
    adc r1, r1, #0
    mov r6, r6, lsr #0xc
    orr r6, r6, r1, lsl #0x14
    add r0, r0, r6
    str r0, [r5, #4]
    ldr r0, [r4, #8]
    mov r1, r2, asr #0x1f
    smull r6, r0, ip, r0
    adds r7, r6, #0x800
    adc r6, r0, #0
    mov r0, r7, lsr #0xc
    orr r0, r0, r6, lsl #0x14
    str r0, [r5, #8]
    ldr r7, [r4, #0x28]
    mov r6, #0x800
    smull r8, r7, r3, r7
    adds r8, r8, #0x800
    adc r7, r7, #0
    mov r8, r8, lsr #0xc
    orr r8, r8, r7, lsl #0x14
    add r0, r0, r8
    str r0, [r5, #8]
    ldr r7, [r4, #0x18]
    smull r8, r7, r2, r7
    adds r8, r8, #0x800
    adc r7, r7, #0
    mov r8, r8, lsr #0xc
    orr r8, r8, r7, lsl #0x14
    add r0, r0, r8
    str r0, [r5, #8]
    ldr r0, [r4, #0xc]
    smull r7, r0, ip, r0
    adds ip, r7, #0x800
    adc r7, r0, #0
    mov r0, ip, lsr #0xc
    orr r0, r0, r7, lsl #0x14
    str r0, [r5, #0xc]
    ldr r7, [r4, #0x2c]
    smull ip, r7, r3, r7
    adds ip, ip, #0x800
    adc r3, r7, #0
    mov r7, ip, lsr #0xc
    orr r7, r7, r3, lsl #0x14
    add r0, r0, r7
    str r0, [r5, #0xc]
    ldr r3, [r4, #0x1c]
    ldr r7, [r5, #0xc]
    mov r0, r3, asr #0x1f
    umull ip, r4, r2, r3
    mla r4, r2, r0, r4
    mla r4, r1, r3, r4
    adds r2, ip, r6
    adc r0, r4, lr
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    add r0, r7, r1
    str r0, [r5, #0xc]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
    .size func_020064b8, .-func_020064b8
