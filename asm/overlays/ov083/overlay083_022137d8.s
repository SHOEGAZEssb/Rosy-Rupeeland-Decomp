.text
; Matching fallback for the portable implementation in src/overlays/ov083/overlay083_recovery.c.
.extern ActorExtendedLinkSource_UpdateFrame
.extern func_020adc90
.extern func_ov083_02213968

.global func_ov083_022137d8
func_ov083_022137d8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldr r0, [r4, #0x14]
    tst r0, #0x200000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r4
    bl ActorExtendedLinkSource_UpdateFrame
    ldr r0, [r4, #0x29c]
    tst r0, #0x1
    beq .L_02213828
    add r0, r4, #0x200
    mov r1, #0x0
    strh r1, [r0, #0xb0]
    ldr r0, [r4, #0x14]
    orr r0, r0, #0x6
    str r0, [r4, #0x14]
    b .L_0221390c
.L_02213828:
    ldr r1, [r4, #0x2a4]
    mov r0, #0x1800
    umull r5, r3, r1, r0
    mov r2, #0x0
    mla r3, r1, r2, r3
    mov r1, r1, asr #0x1f
    mla r3, r1, r0, r3
    adds r5, r5, #0x800
    adc r1, r3, #0x0
    mov r3, r5, lsr #0xc
    ldr r5, [r4, #0x2a0]
    orr r3, r3, r1, lsl #0x14
    add r1, r5, r3
    str r1, [r4, #0x2a0]
    ldr r3, [r4, #0x2a8]
    ldr r1, .L_02213964
    umull r6, r5, r3, r0
    mla r5, r3, r2, r5
    mov r3, r3, asr #0x1f
    mla r5, r3, r0, r5
    adds r6, r6, #0x800
    adc r0, r5, #0x0
    mov r3, r6, lsr #0xc
    orr r3, r3, r0, lsl #0x14
    ldr r5, [r4, #0x2a4]
    sub r0, r2, #0x1
    add r6, r5, r3
    umull r5, r3, r6, r1
    mla r3, r6, r0, r3
    mov r0, r6, asr #0x1f
    mla r3, r0, r1, r3
    adds r0, r5, #0x800
    str r6, [r4, #0x2a4]
    ldr lr, [r4, #0x2a0]
    mov r2, r1, asr #0x2
    adc r3, r3, #0x0
    mov r0, r0, lsr #0xc
    orr r0, r0, r3, lsl #0x14
    mov r3, r1, asr #0xa
    umull r6, r5, lr, r2
    mla r5, lr, r3, r5
    mov ip, lr, asr #0x1f
    adds r3, r6, #0x800
    mla r5, ip, r2, r5
    adc r2, r5, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    ldr r1, [r4, #0x2ac]
    add r0, r0, r3
    bl func_020adc90
    str r0, [r4, #0x2a8]
    ldr r2, [r4, #0x2a0]
    add r1, r4, #0x200
    mov r0, r2, asr #0x3
    add r0, r2, r0, lsr #0x1c
    mov r0, r0, asr #0x4
    strh r0, [r1, #0xb0]
.L_0221390c:
    add r0, r4, #0x200
    ldrh r1, [r0, #0xb0]
    ldr r0, [r4, #0x54]
    strh r1, [r0, #0x30]
    ldr r0, [r4, #0x298]
    cmp r0, #0x0
    beq .L_02213954
    bl func_ov083_02213968
    cmp r0, #0x0
    beq .L_02213954
    mov r0, r4
    bl func_ov083_02213968
    cmp r0, #0x0
    bne .L_02213954
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x100]
    blx r1
.L_02213954:
    ldr r0, [r4, #0x260]
    bic r0, r0, #0x2
    str r0, [r4, #0x260]
    ldmia sp!, {r4, r5, r6, pc}
.L_02213964: .word 0xfffffccd
.size func_ov083_022137d8, . - func_ov083_022137d8
