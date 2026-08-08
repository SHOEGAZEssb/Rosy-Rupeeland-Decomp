    .text
/* Exact fallback; see overlay040_state_setup.c for portable C. */
    .extern Sound_Play
    .extern func_02005058
    .extern func_ov040_02200108
    .extern func_ov040_02202244
    .extern data_ov040_022038d0
    .extern data_ov040_02203ea4
    .extern data_ov040_02203fbc
    .extern data_ov040_02204114
    .extern gSoundContext
.global func_ov040_022022dc
func_ov040_022022dc: ; 0x022022dc
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r6, r0
    ldr r1, [r6, #0xbc0]
    cmp r1, #0x0
    subgt r0, r1, #0x1
    strgt r0, [r6, #0xbc0]
    bgt .L_0220253c
    ldr r1, [r6, #0xae4]
    cmp r1, #0x0
    bgt .L_0220253c
    ldr r1, [r6, #0xbb0]
    cmp r1, #0x9
    bne .L_02202330
    mov r1, #0x11
    bl func_ov040_02202244
    mov r0, #0x1e
    str r0, [r6, #0xbc0]
    mov r0, #0xa
    str r0, [r6, #0xbb0]
    b .L_0220253c
.L_02202330:
    ldr r1, [r6, #0xbbc]
    subs r1, r1, #0x1
    str r1, [r6, #0xbbc]
    bpl .L_0220253c
    mov r1, #0x0
    bl func_ov040_02202244
    ldr r0, [r6, #0xb34]
    ldr r4, .L_02202544
    cmp r0, #0x1
    ldreq r4, .L_02202548
    beq .L_02202364
    cmp r0, #0x2
    ldreq r4, .L_0220254c
.L_02202364:
    ldr r0, [r6, #0xbb8]
    ldr r0, [r4, r0, lsl #0x3]
    cmp r0, #0x0
    movlt r0, #0x0
    strlt r0, [r6, #0xbb8]
    ldr r0, [r6, #0xbb8]
    ldr r0, [r4, r0, lsl #0x3]
    cmp r0, #0x4
    beq .L_02202520
    str r0, [r6, #0xbb0]
    ldr r0, [r6, #0xbb8]
    add r0, r4, r0, lsl #0x3
    ldr r0, [r0, #0x4]
    sub r0, r0, #0x1e
    str r0, [r6, #0xbb4]
    ldr r1, [r6, #0xbb0]
    cmp r1, #0x2
    bhi .L_022023f8
    ldr r0, .L_02202550
    mov r2, #0x0
    ldr r0, [r0, r1, lsl #0x2]
    mov r1, #0x4800
    str r0, [r6, #0xadc]
    ldr r3, [r6, #0x848]
    mov r0, r6
    umull ip, r5, r3, r1
    mla r5, r3, r2, r5
    mov r2, r3, asr #0x1f
    adds r3, ip, #0x800
    mla r5, r2, r1, r5
    adc r1, r5, #0x0
    mov r2, r3, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    mov r1, #0x3
    str r2, [r6, #0xae0]
    bl func_ov040_02202244
    b .L_0220249c
.L_022023f8:
    cmp r1, #0x3
    bne .L_0220249c
    ldr r1, [r6, #0xb44]
    add r0, sp, #0x0
    ldr r5, [r6, #0x78]
    bl func_ov040_02200108
    ldr r1, [sp, #0x4]
    add r0, sp, #0x0
    rsb r1, r1, #0x80000
    str r1, [r6, #0xadc]
    bl func_02005058
    ldr r2, [r6, #0xadc]
    ldr r0, .L_02202554
    mov r1, #0x0
    umull ip, r3, r2, r0
    mla r3, r2, r1, r3
    mov r1, r2, asr #0x1f
    mla r3, r1, r0, r3
    adds ip, ip, #0x800
    adc r0, r3, #0x0
    mov r1, ip, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    cmp r5, r1
    str r1, [r6, #0xadc]
    addeq r0, r1, #0xa000
    streq r0, [r6, #0xadc]
    ldr r2, [r6, #0x848]
    mov r0, #0x4800
    mov r1, #0x0
    umull r5, r3, r2, r0
    mla r3, r2, r1, r3
    mov r1, r2, asr #0x1f
    mla r3, r1, r0, r3
    adds r2, r5, #0x800
    adc r0, r3, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    mov r0, r6
    mov r1, #0x3
    str r2, [r6, #0xae0]
    bl func_ov040_02202244
.L_0220249c:
    ldr r0, [r6, #0xbb0]
    cmp r0, #0x5
    bne .L_022024d0
    mov r0, r6
    mov r1, #0x4
    bl func_ov040_02202244
    mov r1, #0x1
    ldr r0, .L_02202558
    str r1, [r6, #0xae4]
    ldr r0, [r0, #0x0]
    mov r1, #0x12c
    mov r2, #0xd
    bl Sound_Play
.L_022024d0:
    ldr r0, [r6, #0xbb0]
    cmp r0, #0x6
    bne .L_022024fc
    mov r0, r6
    mov r1, #0x6
    bl func_ov040_02202244
    mov r0, #0x1
    str r0, [r6, #0xae4]
    mov r0, #0x0
    str r0, [r6, #0xbd4]
    b .L_02202520
.L_022024fc:
    cmp r0, #0x7
    bne .L_02202520
    mov r0, r6
    mov r1, #0xa
    bl func_ov040_02202244
    mov r0, #0x1
    str r0, [r6, #0xae4]
    mov r0, #0x4
    str r0, [r6, #0xbd4]
.L_02202520:
    ldr r0, [r6, #0xbb8]
    add r0, r4, r0, lsl #0x3
    ldr r0, [r0, #0x4]
    str r0, [r6, #0xbbc]
    ldr r0, [r6, #0xbb8]
    add r0, r0, #0x1
    str r0, [r6, #0xbb8]
.L_0220253c:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_02202544: .word data_ov040_02204114
.L_02202548: .word data_ov040_02203ea4
.L_0220254c: .word data_ov040_02203fbc
.L_02202550: .word data_ov040_022038d0
.L_02202554: .word 0x1333
.L_02202558: .word gSoundContext
    .size func_ov040_022022dc, . - func_ov040_022022dc
