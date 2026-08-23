.text
/* Exact fallback; see overlay040_motion_update.c for portable C. */
    .extern func_020adc40
    .extern Graphics3dPresentation_RemoveSpriteEffect
    .extern func_020a25c8
    .extern Graphics3dPresentation_SetSpriteEffectVertexDepth
    .extern Sound_Play
    .extern data_ov040_0220386c
    .extern data_ov040_02207d2c
    .extern gSoundContext

    .global func_ov040_02203678
func_ov040_02203678:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x24
    ldr r5, .L_02203804
    add r4, sp, #0xc
    mov r10, r0
    mov r9, r1
    mov r7, r4
    ldmia r5!, {r0, r1, r2, r3}
    stmia r4!, {r0, r1, r2, r3}
    ldmia r5, {r0, r1}
    mov r2, #0x50
    stmia r4, {r0, r1}
    mov r4, #0x0
    mov r11, #0x800
    sub r8, r2, #0x1
    mov r6, r4
    mov r5, r11
.L_022036bc:
    add r1, r10, r8, lsl #0x2
    ldr r0, [r1, #0x824]
    cmp r0, #0x0
    beq .L_022037f0
    cmp r0, #0x7
    bge .L_022037f0
    ldr r0, [r1, #0x6e4]
    cmp r0, #0x0
    ble .L_022037f0
    add r2, r10, r8, lsl #0x4
    ldr r0, [r9, #0x8]
    ldr r1, [r2, #0xaac]
    sub r0, r0, #0xa000
    sub r1, r1, r0
    ldr r3, [r2, #0xaa8]
    ldr r2, [r9, #0x4]
    smull ip, r0, r1, r1
    sub r3, r3, r2
    smull r2, r1, r3, r3
    adds r3, r2, r11
    adc r2, r1, r4
    adds r1, ip, r5
    mov r3, r3, lsr #0xc
    adc r0, r0, r6
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bl func_020adc40
    add r2, r10, r8, lsl #0x2
    ldr r1, [r2, #0x824]
    add r3, r7, r1, lsl #0x2
    ldr r3, [r3, #-0x4]
    cmp r0, r3
    bge .L_022037f0
    ldr r4, [r10, #0x0]
    ldr r0, .L_02203808
    ldr r3, [r4, #0x48]
    ldr r1, [r0, r1, lsl #0x2]
    mov r0, #0x0
    add r1, r3, r1
    str r1, [r4, #0x48]
    str r0, [r2, #0x824]
    ldr r1, [r2, #0x964]
    cmp r1, #0xff
    beq .L_02203780
    ldr r0, [r10, #0x0]
    ldr r0, [r0, #0x10]
    bl Graphics3dPresentation_RemoveSpriteEffect
.L_02203780:
    mov r0, #0x1c
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, #0x2
    str r0, [sp, #0x8]
    add r0, r10, r8, lsl #0x4
    ldr r3, [r10, #0x0]
    ldr r1, [r0, #0xaa8]
    ldr r0, [r0, #0xaac]
    mov r2, r1, asr #0xc
    mov r1, r0, asr #0xc
    ldr r0, [r3, #0x10]
    sub r2, r2, #0xe
    sub r3, r1, #0x13
    mov r1, #0x0
    bl func_020a25c8
    ldr r2, [r10, #0x0]
    mov r1, r0
    ldr r0, [r2, #0x10]
    mvn r2, #0x13
    bl Graphics3dPresentation_SetSpriteEffectVertexDepth
    ldr r0, .L_0220380c
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0xf
    bl Sound_Play
    mov r0, #0x1
    b .L_022037fc
.L_022037f0:
    subs r8, r8, #0x1
    bpl .L_022036bc
    mov r0, #0x0
.L_022037fc:
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02203804: .word data_ov040_0220386c
.L_02203808: .word data_ov040_02207d2c
.L_0220380c: .word gSoundContext
    .size func_ov040_02203678, .-func_ov040_02203678

