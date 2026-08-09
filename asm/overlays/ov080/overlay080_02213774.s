.text
; Matching fallback for the portable implementation in src/overlays/ov080/overlay080_recovery.c.
.extern data_020c9670
.extern data_021052fc
.extern data_0210576e
.extern func_02005030
.extern func_02005058
.extern func_020adcac
.extern func_ov080_02213b24

.global func_ov080_02213774
func_ov080_02213774:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    ldr r2, .L_02213948
    mov r4, r0
    ldrb r0, [r2, #0x0]
    mov r7, r1
    cmp r0, #0x0
    moveq r0, #0x14
    streqb r0, [r2, #0x0]
    ldr r1, [r4, #0xd0]
    mov r0, #0x6
    orr r1, r1, #0x2
    str r1, [r4, #0xd0]
    ldr r2, [r4, #0x260]
    mov r1, #0x0
    bic r2, r2, #0x1
    str r2, [r4, #0x260]
    strh r0, [r4, #0xd6]
    mov r0, r4
    strb r1, [r4, #0x24c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x38]
    blx r1
    cmp r0, #0x0
    movne r0, #0x0
    bne .L_02213940
    mov r0, r4
    bl func_ov080_02213b24
    ldr r0, .L_0221394c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r6, [r0, #0xea8]
    ldr r5, [r0, #0xea4]
    cmp r6, #0x0
    beq .L_02213850
    ldr r0, [r6, #0xd0]
    tst r0, #0x100
    bne .L_02213850
    adds r1, r4, #0x18
    add r0, r6, #0x18
    addne r1, r1, #0x4
    cmp r0, #0x0
    addne r0, r0, #0x4
    bl func_020adcac
    mov r8, r0
    adds r1, r4, #0x18
    add r0, r5, #0x18
    addne r1, r1, #0x4
    cmp r0, #0x0
    addne r0, r0, #0x4
    bl func_020adcac
    cmp r8, r0
    strlt r6, [r4, #0x228]
    strge r5, [r4, #0x228]
    b .L_02213854
.L_02213850:
    str r5, [r4, #0x228]
.L_02213854:
    ldr r5, [r4, #0x228]
    add r0, sp, #0x0
    add r1, r4, #0x18
    bl func_02005030
    ldrb r0, [r4, #0x299]
    ldr r3, [r4, #0x20]
    ldr r2, [r5, #0x20]
    mov r1, r0, lsl #0x8
    sub r2, r3, r2
    mov ip, r1, asr #0x4
    mov r6, r2, asr #0xc
    ldrsh r1, [r7, #0x12]
    mul r2, r6, r6
    ldr r7, [r4, #0x1c]
    ldr r3, [r5, #0x1c]
    add r0, r0, #0x2
    sub r3, r7, r3
    strb r0, [r4, #0x299]
    ldr r0, [r4, #0x228]
    mov r5, r3, asr #0xc
    ldr r3, [r0, #0x0]
    ldr r7, .L_02213950
    mov ip, ip, lsl #0x2
    ldrsh ip, [r7, ip]
    mla r7, r5, r5, r2
    ldr r3, [r3, #0xa8]
    add r8, r1, ip, asr #0x9
    blx r3
    cmp r0, #0x0
    bne .L_022138f4
    mul r0, r8, r8
    cmp r7, r0
    bge .L_022138f4
    ldr r1, [sp, #0x4]
    ldr r0, [sp, #0x8]
    add r1, r1, r5, lsl #0xc
    add r0, r0, r6, lsl #0xc
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    b .L_0221390c
.L_022138f4:
    ldr r1, [sp, #0x4]
    ldr r0, [sp, #0x8]
    sub r1, r1, r5, lsl #0xc
    sub r0, r0, r6, lsl #0xc
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
.L_0221390c:
    mov r0, r4
    ldr r2, [r0, #0x0]
    add r1, sp, #0x0
    ldr r2, [r2, #0xd0]
    blx r2
    add r0, r4, #0x200
    ldrh r0, [r0, #0xa2]
    cmp r0, #0x0
    movne r0, #0xd
    strneh r0, [r4, #0xd6]
    add r0, sp, #0x0
    bl func_02005058
    mov r0, #0x0
.L_02213940:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02213948: .word data_0210576e
.L_0221394c: .word data_021052fc
.L_02213950: .word data_020c9670
.size func_ov080_02213774, . - func_ov080_02213774
