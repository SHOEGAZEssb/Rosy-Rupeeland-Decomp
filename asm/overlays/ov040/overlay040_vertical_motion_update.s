.text
/* Exact fallback; see overlay040_motion_update.c for portable C. */
    .extern func_020befec
    .extern func_020afce8
    .extern func_02070958
    .extern GraphicsSpriteRenderer_QueueStatePaletteUploads
    .extern data_020f4e14

    .global func_ov040_02201288
func_ov040_02201288:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0xabc]
    cmp r0, #0x0
    mvneq r0, #0x5
    streq r0, [r5, #0xaa8]
    moveq r0, #0x0
    streq r0, [r5, #0xab8]
    beq .L_02201314
    cmp r0, #0x1
    bne .L_022012fc
    mov r1, #0x0
    str r1, [r5, #0xaa8]
    ldr r0, [r5, #0xab8]
    add r0, r0, #0x3
    str r0, [r5, #0xab8]
    ldr r0, [r5, #0xab4]
    subs r0, r0, #0x1
    str r0, [r5, #0xab4]
    bpl .L_02201314
    str r1, [r5, #0xab8]
    str r1, [r5, #0xabc]
    ldr r0, [r5, #0xb10]
    cmp r0, #0x0
    ldrne r1, [r0, #0xc]
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x2
    strneh r0, [r1, #0x24]
    b .L_02201314
.L_022012fc:
    cmp r0, #0x2
    moveq r0, #0x0
    streq r0, [r5, #0xaa8]
    ldreq r0, [r5, #0xab8]
    addeq r0, r0, #0x6
    streq r0, [r5, #0xab8]
.L_02201314:
    ldr r2, [r5, #0xaac]
    ldr r0, [r5, #0xaa8]
    mov r4, #0x0
    mov r1, r4
    cmp r0, r2
    beq .L_02201344
    addgt r0, r2, #0x2
    suble r0, r2, #0x2
    str r0, [r5, #0xaac]
    ldr r2, [r5, #0xaac]
    mov r1, #0x1
    mov r4, r2
.L_02201344:
    cmp r2, #0x0
    bne .L_02201380
    ldr r0, [r5, #0xab0]
    mov r1, #0x6
    add r2, r0, #0x1
    add r0, r2, r2, lsr #0x1f
    mov r0, r0, asr #0x1
    str r2, [r5, #0xab0]
    bl func_020befec
    mov r4, r1
    cmp r4, #0x3
    ldr r0, [r5, #0xaac]
    rsbge r4, r4, #0x6
    mov r1, #0x1
    add r4, r4, r0
.L_02201380:
    cmp r1, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, .L_022013d8
    mov r2, r4
    mov r1, #0xe
    bl func_020afce8
    ldr r1, [r5, #0xb10]
    cmp r1, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, #0x19
    mul r3, r4, r0
    ldr r0, [r1, #0x14]
    add r1, r3, #0x100
    mov r2, r1
    add r3, r3, #0x100
    bl func_02070958
    ldr r1, [r5, #0xb10]
    ldr r0, .L_022013dc
    ldr r1, [r1, #0xc]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueueStatePaletteUploads
    ldmia sp!, {r3, r4, r5, pc}
.L_022013d8: .word 0x4000050
.L_022013dc: .word data_020f4e14
    .size func_ov040_02201288, .-func_ov040_02201288
