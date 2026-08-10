.text
/* Exact fallback; see overlay039_final_update.c for portable C. */
    .extern GraphicsSpriteState_SetAnimationIndex
    .extern func_020adc40
    .extern func_020adc90
    .extern func_0201e0ec
    .extern func_020a27a0
    .extern data_ov039_022082e4
    .extern data_ov039_02208324
    .extern data_ov039_022082d4
    .extern gSystemState
    .extern data_021052fc
    .global func_ov039_0220713c
func_ov039_0220713c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x90
    ldr r8, L_0220748c
    add r7, sp, #0x50
    mov r4, r0
    mov r6, #0x0
    mov r5, #0x4
L_02207158:
    ldmia r8!, {r0, r1, r2, r3}
    stmia r7!, {r0, r1, r2, r3}
    subs r5, r5, #0x1
    bne L_02207158
    ldr r8, L_02207490
    add r7, sp, #0x10
    mov r5, #0x4
L_02207174:
    ldmia r8!, {r0, r1, r2, r3}
    stmia r7!, {r0, r1, r2, r3}
    subs r5, r5, #0x1
    bne L_02207174
    ldr r3, L_02207494
    add r2, sp, #0x0
    mov r1, #0x10
L_02207190:
    ldrb r0, [r3], #0x1
    subs r1, r1, #0x1
    strb r0, [r2], #0x1
    bne L_02207190
    ldr r0, L_02207498
    ldr r5, [r4, #0x48]
    ldrh r0, [r0, #0x1a]
    tst r0, #0x40
    orrne r6, r6, #0x2
    tst r0, #0x80
    orrne r6, r6, #0x1
    tst r0, #0x20
    orrne r6, r6, #0x8
    tst r0, #0x10
    orrne r6, r6, #0x4
    add r0, sp, #0x0
    ldrb r0, [r0, r6]
    cmp r0, #0x8
    movne r0, r0, lsl #0x1
    strneb r0, [r4, #0xa4]
    ldrh r2, [r5, #0x40]
    ldrb r0, [r4, #0xa4]
    subs r1, r0, r2
    beq L_0220723c
    mvn r0, #0x7
    cmp r1, r0
    addlt r1, r1, #0x10
    cmp r1, #0x8
    subgt r1, r1, #0x10
    cmp r1, #0x0
    mvnlt r0, #0x0
    blt L_02207218
    movgt r0, #0x1
    movle r0, #0x0
L_02207218:
    add r0, r2, r0
    and r0, r0, #0xf
    strh r0, [r5, #0x40]
    ldrh r1, [r5, #0x40]
    ldr r0, [r5, #0xc]
    mov r1, r1, asr #0x1
    add r1, r1, #0x1b
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
L_0220723c:
    ldr r2, L_0220749c
    ldr ip, [r4, #0x8c]
    mov r3, #0x0
    umull r1, lr, ip, r2
    mla lr, ip, r3, lr
    ldr r0, [r4, #0x88]
    mov ip, ip, asr #0x1f
    umull r7, r8, r0, r2
    adds r1, r1, #0x800
    mla lr, ip, r2, lr
    adc lr, lr, #0x0
    adds ip, r7, #0x800
    mov r1, r1, lsr #0xc
    mla r8, r0, r3, r8
    mov r7, r0, asr #0x1f
    mla r8, r7, r2, r8
    adc r7, r8, #0x0
    mov r8, ip, lsr #0xc
    orr r8, r8, r7, lsl #0x14
    sub r0, r0, r8
    str r0, [r4, #0x88]
    ldr r7, [r4, #0x8c]
    orr r1, r1, lr, lsl #0x14
    sub r1, r7, r1
    str r1, [r4, #0x8c]
    add r0, sp, #0x50
    ldr ip, [r0, r6, lsl #0x2]
    add r0, r2, #0xf6
    umull r1, lr, ip, r0
    adds r1, r1, #0x800
    mov r7, r1, lsr #0xc
    mla lr, ip, r3, lr
    mov r2, ip, asr #0x1f
    mla lr, r2, r0, lr
    mov r1, r0
    adc r0, lr, #0x0
    ldr r8, [r4, #0x88]
    orr r7, r7, r0, lsl #0x14
    add r0, r8, r7
    str r0, [r4, #0x88]
    add r2, sp, #0x10
    ldr r6, [r2, r6, lsl #0x2]
    ldr r0, [r4, #0x8c]
    umull lr, ip, r6, r1
    mla ip, r6, r3, ip
    mov r2, r6, asr #0x1f
    mla ip, r2, r1, ip
    adds r2, lr, #0x800
    adc r1, ip, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    add r2, r0, r2
    str r2, [r4, #0x8c]
    ldr r6, [r4, #0x88]
    smull r1, r0, r2, r2
    smull r3, r2, r6, r6
    adds r3, r3, #0x800
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bl func_020adc40
    mov r6, r0
    ldr r0, L_022074a0
    cmp r6, r0
    ble L_022073c4
    ldr r0, [r4, #0x88]
    mov r1, r6
    bl func_020adc90
    ldr r1, L_022074a0
    mov r2, #0x0
    umull ip, r3, r0, r1
    mla r3, r0, r2, r3
    mov r0, r0, asr #0x1f
    adds r2, ip, #0x800
    mla r3, r0, r1, r3
    adc r0, r3, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r4, #0x88]
    ldr r0, [r4, #0x8c]
    mov r1, r6
    bl func_020adc90
    ldr r1, L_022074a0
    mov r2, #0x0
    umull ip, r3, r0, r1
    adds ip, ip, #0x800
    mla r3, r0, r2, r3
    mov r0, r0, asr #0x1f
    mla r3, r0, r1, r3
    adc r0, r3, #0x0
    mov r1, ip, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r4, #0x8c]
L_022073c4:
    ldr r1, [r5, #0x30]
    ldr r0, [r4, #0x88]
    add r0, r1, r0
    str r0, [r5, #0x30]
    ldr r1, [r5, #0x34]
    ldr r0, [r4, #0x8c]
    add r0, r1, r0
    str r0, [r5, #0x34]
    ldr r0, [r5, #0x30]
    cmp r0, #0x144000
    movlt r0, #0x144000
    strlt r0, [r5, #0x30]
    ldr r0, [r5, #0x30]
    cmp r0, #0x2bc000
    movgt r0, #0x2bc000
    strgt r0, [r5, #0x30]
    ldr r0, [r5, #0x34]
    cmp r0, #0x84000
    movlt r0, #0x84000
    strlt r0, [r5, #0x34]
    ldr r1, [r5, #0x34]
    ldr r0, L_022074a4
    cmp r1, r0
    strgt r0, [r5, #0x34]
    ldr r2, [r4, #0x80]
    ldr r0, L_022074a8
    ldr r1, [r2, #0x14]
    cmp r6, r0
    ble L_02207484
    cmp r1, #0x0
    addne r0, r1, #0x1c00
    ldrneh r0, [r0, #0xac]
    ldreq r0, [r2, #0x18]
    addeq r0, r0, #0x1c00
    ldreqh r0, [r0, #0xa8]
    tst r0, #0x1
    beq L_02207484
    ldr r0, L_022074ac
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    ldr r2, [r5, #0x30]
    ldr r1, [r5, #0x34]
    mov r2, r2, asr #0xc
    mov r3, r1, asr #0xc
    mov r1, #0x1
    bl func_020a27a0
L_02207484:
    add sp, sp, #0x90
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
L_0220748c: .word data_ov039_022082e4
L_02207490: .word data_ov039_02208324
L_02207494: .word data_ov039_022082d4
L_02207498: .word gSystemState
L_0220749c: .word 0x28f
L_022074a0: .word 0x1ccd
L_022074a4: .word 0x26e000
L_022074a8: .word 0xe66
L_022074ac: .word data_021052fc
    .size func_ov039_0220713c, .-func_ov039_0220713c

