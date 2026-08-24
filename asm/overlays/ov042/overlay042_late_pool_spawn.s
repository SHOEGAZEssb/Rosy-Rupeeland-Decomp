.text
.extern func_ov042_021fcf80
.extern func_ov042_0220368c
.extern func_ov042_021fda0c
.extern func_020ae024
.extern gFx32CosSinTable
    .global func_ov042_022051a8
func_ov042_022051a8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x18
    mov r4, r0
    ldr r7, [r4, #0x844]
    mov r8, r1
    mov r6, r2
    mov r5, r3
    cmp r7, #0x0
    blt .L_02205490
    cmp r8, #0x0
    bne .L_02205218
    add r0, sp, #0xc
    bl func_ov042_021fcf80
    ldr r1, [r4, #0x0]
    add r0, sp, #0x0
    ldr r1, [r1, #0x8]
    mov r2, r6
    add r1, r1, #0x94
    bl func_ov042_0220368c
    add r0, sp, #0xc
    add r1, sp, #0x0
    bl func_ov042_021fda0c
    ldr r0, [sp, #0x10]
    ldr r1, [sp, #0x14]
    bl func_020ae024
    add r0, r5, r0
    mov r0, r0, lsl #0x10
    mov r5, r0, lsr #0x10
.L_02205218:
    add r1, r4, #0x144
    mov r0, #0xc
    mla r0, r7, r0, r1
    mov r1, r5, asr #0x4
    mov r3, r1, lsl #0x1
    add r1, r3, #0x1
    add r2, r4, r7, lsl #0x1
    ldr r9, .L_02205498
    mov ip, r3, lsl #0x1
    mov r3, r1, lsl #0x1
    mov r1, r6
    strh r5, [r2, #0xc4]
    ldrsh r5, [r9, ip]
    ldrsh r6, [r9, r3]
    bl func_ov042_021fda0c
    cmp r8, #0x2
    bne .L_022052c4
    mov r0, #0xc
    mla r3, r7, r0, r4
    mov r0, r5, asr #0x1f
    mov r2, r0, lsl #0xf
    mov r1, r6, asr #0x1f
    mov r0, #0x800
    adds r8, r0, r5, lsl #0xf
    orr r2, r2, r5, lsr #0x11
    mov r1, r1, lsl #0xf
    adc r5, r2, #0x0
    mov r8, r8, lsr #0xc
    adds r2, r0, r6, lsl #0xf
    orr r1, r1, r6, lsr #0x11
    orr r8, r8, r5, lsl #0x14
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    str r8, [r3, #0x448]
    orr r1, r1, r0, lsl #0x14
    str r1, [r3, #0x44c]
    add r0, r4, r7, lsl #0x1
    mov r1, #0x14
    strh r1, [r0, #0x44]
    add r0, r4, r7
    mov r1, #0xa
    strb r1, [r0, #0x4]
    b .L_02205478
.L_022052c4:
    cmp r8, #0x3
    bne .L_02205334
    mov r0, #0xc
    mla r3, r7, r0, r4
    mov r0, r5, asr #0x1f
    mov r2, r0, lsl #0xe
    mov r1, r6, asr #0x1f
    mov r0, #0x800
    adds r8, r0, r5, lsl #0xe
    orr r2, r2, r5, lsr #0x12
    mov r1, r1, lsl #0xe
    adc r5, r2, #0x0
    mov r8, r8, lsr #0xc
    adds r2, r0, r6, lsl #0xe
    orr r1, r1, r6, lsr #0x12
    orr r8, r8, r5, lsl #0x14
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    str r8, [r3, #0x448]
    orr r1, r1, r0, lsl #0x14
    str r1, [r3, #0x44c]
    add r0, r4, r7, lsl #0x1
    mov r1, #0x1
    strh r1, [r0, #0x44]
    add r0, r4, r7
    mov r1, #0xb
    strb r1, [r0, #0x4]
    b .L_02205478
.L_02205334:
    cmp r8, #0x4
    mov r1, #0xc
    bne .L_022053a0
    mla r8, r7, r1, r4
    mov r0, r5, asr #0x1f
    mov r3, r0, lsl #0xf
    mov r2, r6, asr #0x1f
    mov r0, #0x800
    adds r9, r0, r5, lsl #0xf
    orr r3, r3, r5, lsr #0x11
    mov r2, r2, lsl #0xf
    adc r5, r3, #0x0
    mov r9, r9, lsr #0xc
    orr r9, r9, r5, lsl #0x14
    adds r3, r0, r6, lsl #0xf
    orr r2, r2, r6, lsr #0x11
    adc r0, r2, #0x0
    mov r2, r3, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    str r9, [r8, #0x448]
    str r2, [r8, #0x44c]
    add r0, r4, r7, lsl #0x1
    mov r2, #0x1
    strh r2, [r0, #0x44]
    add r0, r4, r7
    strb r1, [r0, #0x4]
    b .L_02205478
.L_022053a0:
    cmp r8, #0x6
    mov r2, #0x1800
    mov r3, #0x0
    bne .L_02205418
    umull r0, ip, r5, r2
    umull r9, r8, r6, r2
    adds lr, r0, #0x800
    mla ip, r5, r3, ip
    mla r8, r6, r3, r8
    mov r0, r5, asr #0x1f
    mla ip, r0, r2, ip
    mov r3, r6, asr #0x1f
    mla r8, r3, r2, r8
    adc ip, ip, #0x0
    mov r0, lr, lsr #0xc
    adds r5, r9, #0x800
    mla r3, r7, r1, r4
    orr r0, r0, ip, lsl #0x14
    str r0, [r3, #0x448]
    adc r1, r8, #0x0
    mov r2, r5, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    str r2, [r3, #0x44c]
    add r0, r4, r7, lsl #0x1
    mov r1, #0x3
    strh r1, [r0, #0x44]
    add r0, r4, r7
    mov r1, #0x1
    strb r1, [r0, #0x4]
    b .L_02205478
.L_02205418:
    umull r0, lr, r5, r2
    umull ip, r8, r6, r2
    adds r9, r0, #0x800
    mla lr, r5, r3, lr
    mla r8, r6, r3, r8
    mov r0, r5, asr #0x1f
    mla lr, r0, r2, lr
    mov r3, r6, asr #0x1f
    mla r8, r3, r2, r8
    adc lr, lr, #0x0
    mov r0, r9, lsr #0xc
    adds r5, ip, #0x800
    mla r3, r7, r1, r4
    orr r0, r0, lr, lsl #0x14
    str r0, [r3, #0x448]
    adc r1, r8, #0x0
    mov r2, r5, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    str r2, [r3, #0x44c]
    add r0, r4, r7, lsl #0x1
    mov r1, #0x1
    strh r1, [r0, #0x44]
    add r0, r4, r7
    strb r1, [r0, #0x4]
.L_02205478:
    add r0, r4, r7, lsl #0x1
    add r0, r0, #0x700
    mov r1, #0x0
    strh r1, [r0, #0x44]
    ldrsh r0, [r0, #0xc4]
    str r0, [r4, #0x844]
.L_02205490:
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02205498: .word gFx32CosSinTable
.size func_ov042_022051a8, . - func_ov042_022051a8

