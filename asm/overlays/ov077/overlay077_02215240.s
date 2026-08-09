.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern func_020349b8
.extern func_020be334
.extern func_ov077_02213c08
.extern func_ov077_022142c8
.extern func_ov077_022142e0
.extern func_ov090_0221c3dc

.global func_ov077_02215240
func_ov077_02215240:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    mov r0, #0x0
    add r1, r4, #0x200
    strh r0, [r1, #0xee]
    mov r2, #0x13
    strh r2, [r4, #0xd6]
    ldrb r2, [r4, #0x2e4]
    bic r2, r2, #0x80
    strb r2, [r4, #0x2e4]
    ldr r2, [r4, #0x260]
    bic r2, r2, #0x3
    str r2, [r4, #0x260]
    str r0, [r4, #0x40]
    str r0, [r4, #0x3c]
    ldrb r2, [r4, #0x2e4]
    mov r2, r2, lsl #0x19
    movs r2, r2, lsr #0x1d
    bne .L_0221533c
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x10
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x58]
    cmp r1, #0x0
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x10
    strneh r0, [r1, #0x24]
    ldr r0, [r4, #0x298]
    mov r1, #0x1
    bl func_ov090_0221c3dc
    ldr r0, [r4, #0x2c4]
    mov r1, #0x10
    bl func_ov077_02213c08
    mov r0, #0x13
    strh r0, [r4, #0xd6]
    ldr r0, [r4, #0x54]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02215430
    ldrb r1, [r4, #0x2e4]
    mov r0, r4
    bic r1, r1, #0x70
    orr r1, r1, #0x10
    strb r1, [r4, #0x2e4]
    ldr r1, [r4, #0x14]
    orr r1, r1, #0x40
    str r1, [r4, #0x14]
    bl func_ov077_022142c8
    cmp r0, #0x0
    ldrne r1, .L_02215438
    bne .L_0221532c
    mov r0, r4
    bl func_ov077_022142e0
    cmp r0, #0x0
    ldrne r1, .L_0221543c
    ldreq r1, .L_02215440
.L_0221532c:
    mov r0, r4
    mov r2, #0x0
    bl func_020349b8
    b .L_02215430
.L_0221533c:
    cmp r2, #0x1
    bne .L_022153ec
    mov r1, #0x2
    strh r1, [r4, #0xd6]
    ldr r2, [r4, #0x1dc]
    ldr r5, [r4, #0x24]
    rsb r1, r1, #0xfb0
    umull r7, r6, r5, r1
    add r3, r2, #0x20000
    mov r2, #0x52
    mla r6, r5, r0, r6
    umull lr, ip, r3, r2
    mov r5, r5, asr #0x1f
    mla r6, r5, r1, r6
    adds r7, r7, #0x800
    adc r5, r6, r0
    mov r6, r7, lsr #0xc
    mla ip, r3, r0, ip
    mov r1, r3, asr #0x1f
    mla ip, r1, r2, ip
    adds lr, lr, #0x800
    adc r0, ip, r0
    mov r1, lr, lsr #0xc
    orr r6, r6, r5, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r1, r6, r1
    str r1, [r4, #0x24]
    ldr r0, [r4, #0x1dc]
    add r0, r0, #0x20000
    sub r0, r1, r0
    bl func_020be334
    cmp r0, #0x1000
    bge .L_02215430
    ldrb r2, [r4, #0x2e4]
    add r0, r4, #0x200
    mov r1, #0x78
    bic r2, r2, #0x70
    orr r2, r2, #0x20
    strb r2, [r4, #0x2e4]
    strh r1, [r0, #0xec]
    add r0, r4, #0x300
    mov r1, #0x800
    strh r1, [r0, #0x2]
    b .L_02215430
.L_022153ec:
    cmp r2, #0x2
    bne .L_02215430
    mov r2, #0x2
    strh r2, [r4, #0xd6]
    ldr r2, [r4, #0x1dc]
    add r2, r2, #0x20000
    str r2, [r4, #0x24]
    str r0, [r4, #0x44]
    ldrsh r0, [r1, #0xec]
    cmp r0, #0x0
    ble .L_02215430
    sub r0, r0, #0x1
    strh r0, [r1, #0xec]
    ldrsh r0, [r1, #0xec]
    cmp r0, #0x0
    moveq r0, #0x100
    streqh r0, [r1, #0xec]
.L_02215430:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02215438: .word 0xa102
.L_0221543c: .word 0xa103
.L_02215440: .word 0xa101
.size func_ov077_02215240, . - func_ov077_02215240
