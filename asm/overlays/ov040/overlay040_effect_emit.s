.text
/* Exact fallback; see overlay040_object_update.c for portable C. */
    .extern func_020befec
    .extern genrand_int32
    .extern func_020bf1f8
    .extern data_ov040_02207d48

    .global func_ov040_02202f1c
func_ov040_02202f1c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r9, r1
    cmp r9, #0x2
    mov r10, r0
    mov r5, r2
    mov r6, r3
    mov r11, #0x0
    movle r4, #0x14
    ble .L_02202f4c
    cmp r9, #0x3
    moveq r4, #0x5
    movne r4, #0x1
.L_02202f4c:
    cmp r9, #0x0
    bne .L_02202f68
    ldr r0, [r10, #0x0]
    mov r1, #0x5
    ldr r0, [r0, #0x4c]
    bl func_020befec
    mov r11, r0
.L_02202f68:
    ldr r1, .L_02203138
    mov r0, #0x28
    mla r7, r9, r0, r1
    mov r5, r5, lsl #0xc
    mov r6, r6, lsl #0xc
    b .L_02203128
.L_02202f80:
    mov r0, #0x50
    sub r8, r0, #0x1
.L_02202f88:
    add r0, r10, r8, lsl #0x2
    ldr r0, [r0, #0x824]
    cmp r0, #0x0
    bne .L_02203120
    add r1, r10, r8, lsl #0x4
    str r5, [r1, #0xaa8]
    str r6, [r1, #0xaac]
    mov r0, #0x0
    str r0, [r1, #0xab0]
    cmp r9, #0x2
    bne .L_02203010
    bl genrand_int32
    ldr r1, .L_0220313c
    ldr r2, .L_02203140
    and ip, r0, r1
    mov r0, #0x0
    umull r3, r1, ip, r2
    mla r1, ip, r0, r1
    mov r0, ip, asr #0x1f
    mla r1, r0, r2, r1
    adds r0, r3, #0x800
    mov r2, r0, lsr #0xc
    adc r1, r1, #0x0
    ldr r0, .L_02203144
    orr r2, r2, r1, lsl #0x14
    add r1, r2, r0
    add r0, r10, r8, lsl #0x4
    str r1, [r0, #0x8]
    bl genrand_int32
    ldr r1, .L_02203148
    add r2, r10, r8, lsl #0x4
    and r0, r0, r1
    sub r0, r0, #0x5000
    b .L_0220305c
.L_02203010:
    bl genrand_int32
    ldr r1, .L_0220313c
    mov r2, #0x800
    and r3, r0, r1
    mov r0, r3, asr #0x1f
    mov r0, r0, lsl #0xd
    adds r1, r2, r3, lsl #0xd
    orr r0, r0, r3, lsr #0x13
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    sub r1, r1, #0x1000
    add r0, r10, r8, lsl #0x4
    str r1, [r0, #0x8]
    bl genrand_int32
    ldr r1, .L_0220313c
    add r2, r10, r8, lsl #0x4
    and r0, r0, r1
    sub r0, r0, #0x4000
.L_0220305c:
    str r0, [r2, #0xc]
    add r0, r10, r8, lsl #0x1
    add r1, r10, r8, lsl #0x4
    mov r2, #0x0
    str r2, [r1, #0x10]
    add r0, r0, #0x500
    strh r2, [r0, #0x4]
    bl genrand_int32
    ldr r1, .L_0220314c
    add r2, r10, r8, lsl #0x2
    and r0, r0, r1
    sub r0, r0, #0x100
    str r0, [r2, #0x5a4]
    cmp r9, #0x2
    bgt .L_022030bc
    cmp r4, #0xa
    ldrlt r1, [r7, r4, lsl #0x2]
    blt .L_022030b0
    bl genrand_int32
    and r0, r0, #0x3
    add r1, r0, #0x7
.L_022030b0:
    add r0, r10, r8, lsl #0x2
    str r1, [r0, #0x824]
    b .L_022030f4
.L_022030bc:
    cmp r9, #0x3
    bne .L_022030e0
    bl genrand_int32
    mov r1, #0x3
    bl func_020bf1f8
    add r1, r1, #0x4
    add r0, r10, r8, lsl #0x2
    str r1, [r0, #0x824]
    b .L_022030f4
.L_022030e0:
    bl genrand_int32
    and r0, r0, #0x3
    add r1, r0, #0x7
    add r0, r10, r8, lsl #0x2
    str r1, [r0, #0x824]
.L_022030f4:
    add r1, r10, r8, lsl #0x2
    mov r0, #0x0
    str r0, [r1, #0x6e4]
    mov r0, #0xff
    str r0, [r1, #0x964]
    cmp r9, #0x3
    ldreq r1, [r10, #0x0]
    ldreq r0, [r1, #0x4c]
    addeq r0, r0, #0x1
    streq r0, [r1, #0x4c]
    b .L_02203128
.L_02203120:
    subs r8, r8, #0x1
    bpl .L_02202f88
.L_02203128:
    sub r4, r4, #0x1
    cmp r4, r11
    bge .L_02202f80
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02203138: .word data_ov040_02207d48
.L_0220313c: .word 0xfff
.L_02203140: .word 0x2666
.L_02203144: .word 0xffffeccd
.L_02203148: .word 0x1fff
.L_0220314c: .word 0x1ff
    .size func_ov040_02202f1c, .-func_ov040_02202f1c

