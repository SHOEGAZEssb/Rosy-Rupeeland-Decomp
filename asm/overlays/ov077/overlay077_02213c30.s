.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern data_020c9670
.extern data_021052fc
.extern data_ov077_02216f4c
.extern data_ov077_02216f64
.extern data_ov077_02216fc8
.extern data_ov077_02216fd0
.extern data_ov077_022170d8
.extern func_02002e38
.extern func_02005810
.extern func_02072b68
.extern func_ov077_02212e60
.extern func_ov077_02212f18
.extern func_ov077_02214298
.extern func_ov077_022142b4
.extern func_ov077_022142c8
.extern func_ov077_022142e0
.extern func_ov090_0221c440
.extern func_ov090_0221c44c
.extern func_ov090_0221c73c
.extern func_ov090_0221ca34
.extern func_ov090_0221ca58

.global func_ov077_02213c30
func_ov077_02213c30:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x4c
    mov r10, r1
    mov r4, r2
    bl func_ov077_02212e60
    ldr r0, [r10, #0x10]
    tst r0, #0x1000000
    bne .L_02214274
    ldr r0, [r10, #0x24]
    ldr r6, [r4, #0x4]
    add r3, r10, #0x200
    ldrh r2, [r3, #0xfe]
    ldr r5, [r10, #0x20]
    mov r1, r0, asr #0xc
    ldr r7, [r10, #0x1c]
    mov r6, r6, asr #0xc
    ldr r0, [r4, #0x8]
    rsb r1, r1, r5, asr #0xc
    ldr r8, [r10, #0x2a8]
    rsb r6, r6, r7, asr #0xc
    ldr r5, [r10, #0x2ac]
    sub r0, r1, r0, asr #0xc
    ldr r9, [r10, #0x2b8]
    add r7, r6, r8, asr #0xc
    ldr r6, [r10, #0x2bc]
    add r1, r0, r5, asr #0xc
    cmp r2, #0x0
    add r0, r7, r9, asr #0xc
    add r1, r1, r6, asr #0xc
    beq .L_02213d3c
    sub r2, r2, #0x1
    strh r2, [r3, #0xfe]
    ldrh r5, [r3, #0xf2]
    add r2, r10, #0xfe
    add r6, r2, #0x200
    mov r2, r5, lsl #0x1a
    movs r2, r2, lsr #0x1e
    beq .L_02213cd4
    cmp r2, #0x1
    beq .L_02213cf8
    b .L_02213d44
.L_02213cd4:
    ldrh r5, [r6, #0x0]
    add r2, r10, #0x300
    sub r5, r5, #0x1
    strh r5, [r6, #0x0]
    ldrh r5, [r3, #0xfc]
    ldrh r2, [r2, #0x0]
    sub r2, r5, r2
    strh r2, [r3, #0xfc]
    b .L_02213d44
.L_02213cf8:
    ldrh r5, [r3, #0xfe]
    mov r2, r5, lsl #0x1c
    mov r2, r2, lsr #0x10
    mov r3, r2, asr #0x4
    ldr r2, .L_0221427c
    mov r3, r3, lsl #0x2
    ldrsh r2, [r2, r3]
    cmp r5, #0x10
    movhi r5, #0x10
    mov r5, r5, lsl #0x1
    mul r6, r5, r2
    mov r2, r6, asr #0x3
    add r2, r6, r2, lsr #0x1c
    add r3, r10, #0x200
    mov r2, r2, asr #0x4
    strh r2, [r3, #0xfc]
    b .L_02213d44
.L_02213d3c:
    mov r2, #0x0
    strh r2, [r3, #0xfc]
.L_02213d44:
    ldr r2, [r10, #0x2c4]
    str r0, [r2, #0x18]
    ldr r0, [r10, #0x2c4]
    str r1, [r0, #0x1c]
    ldrsh r0, [r10, #0xda]
    ldr r1, [r10, #0x54]
    cmp r0, #0x1
    ldrh r0, [r1, #0x28]
    mvnle r1, #0x0
    movgt r1, #0x1
    add r0, r1, r0
    mov r1, r0, lsl #0x10
    ldr r0, [r10, #0x2c4]
    mov r1, r1, asr #0x10
    bl func_ov077_02214298
    ldr r1, [r10, #0x54]
    ldr r0, [r10, #0x2c4]
    ldrb r1, [r1, #0x3a]
    bl func_ov077_022142b4
    bl func_02002e38
    mvn r1, #0xbf
    sub r2, r1, r0
    ldr r1, .L_02214280
    mov r0, #0x0
    str r0, [sp, #0x44]
    str r1, [sp, #0x40]
    str r2, [sp, #0x48]
    add r0, r10, #0x200
    ldr r2, [r10, #0x2c4]
    ldrsh r3, [r0, #0xfc]
    ldr r1, [r2, #0x4]
    add r0, sp, #0x4
    strh r3, [r1, #0x30]
    ldr r2, [r2, #0x8]
    add r1, sp, #0x40
    strh r3, [r2, #0x30]
    bl func_ov077_02212f18
    ldr r0, [r10, #0x2c4]
    add r1, sp, #0x4
    bl func_02005810
    add r0, r10, #0x200
    ldrh r2, [r0, #0xfc]
    ldr r1, [r10, #0x54]
    strh r2, [r1, #0x30]
    ldrsb r0, [r0, #0xe4]
    mov r0, r0, lsl #0x1c
    movs r0, r0, asr #0x1c
    bne .L_0221402c
    ldr r0, [r10, #0x54]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x10
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    movne r0, #0x0
    bne .L_02213e74
    ldr r0, [r10, #0x2c4]
    ldr r0, [r0, #0x4]
    ldrb r1, [r0, #0x38]
    ldrb r2, [r0, #0x39]
    cmp r1, #0x4
    beq .L_02213e44
    sub r0, r1, #0x5
    cmp r0, #0x1
    bhi .L_02213e54
.L_02213e44:
    cmp r2, #0x1
    movlt r0, #0x1
    movge r0, #0x0
    b .L_02213e74
.L_02213e54:
    sub r0, r1, #0x7
    cmp r0, #0x2
    bhi .L_02213e70
    cmp r2, #0x3
    movge r0, #0x1
    movlt r0, #0x0
    b .L_02213e74
.L_02213e70:
    mov r0, #0x1
.L_02213e74:
    cmp r0, #0x0
    beq .L_02214008
    ldr r0, .L_02214284
    ldr r2, [r4, #0x4]
    ldr r0, [r0, #0x0]
    ldr r1, [r4, #0x8]
    add r0, r0, #0x2000
    ldr r3, [r0, #0xea4]
    mov r4, r2, asr #0xc
    ldr r0, [r3, #0x24]
    ldr r2, [r3, #0x20]
    ldr r5, [r3, #0x1c]
    mov r0, r0, asr #0xc
    rsb r0, r0, r2, asr #0xc
    rsb r11, r4, r5, asr #0xc
    sub r5, r0, r1, asr #0xc
    ldr r3, .L_02214288
    add r2, sp, #0x28
    mov r9, #0x0
    mov r1, #0xc
.L_02213ec4:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_02213ec4
    ldr r3, .L_0221428c
    add r2, sp, #0x10
    mov r1, #0xc
.L_02213ee0:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_02213ee0
    add r4, r10, #0x200
.L_02213ef4:
    ldrh r0, [r4, #0xfc]
    ldrsh r8, [r10, #0xda]
    mov r1, r9, lsl #0x1
    mov r0, r0, asr #0x4
    mov r3, r0, lsl #0x1
    ldr r0, .L_0221427c
    mov r2, r3, lsl #0x1
    ldrsh r6, [r0, r2]
    add r0, r0, r3, lsl #0x1
    ldrsh r3, [r0, #0x2]
    mov r0, #0x6
    smulbb r2, r8, r0
    add r0, sp, #0x10
    add r0, r0, r2
    add r7, sp, #0x28
    add r2, r7, r2
    ldrsh r0, [r1, r0]
    ldrsh r7, [r1, r2]
    smulbb r1, r6, r0
    mla r2, r3, r7, r1
    smulbb r1, r3, r0
    smulbb r0, r6, r7
    sub r1, r1, r0
    mov r0, r2, lsl #0x4
    mov r6, r0, asr #0x10
    mov r0, r1, lsl #0x4
    mov r7, r0, asr #0x10
    ldrh r0, [r4, #0xf2]
    mov r1, r0, lsl #0x10
    movs r1, r1, lsr #0x17
    bne .L_02213f7c
    mov r0, r0, lsl #0x19
    movs r0, r0, lsr #0x1f
    beq .L_02213f84
.L_02213f7c:
    mov r8, #0x4
    b .L_02213fb8
.L_02213f84:
    ldrsh r0, [r10, #0xd6]
    cmp r0, #0x3
    bne .L_02213fa0
    ldrsh r0, [r4, #0xe6]
    cmp r0, #0x0
    movgt r8, #0x6
    bgt .L_02213fb8
.L_02213fa0:
    ldrh r0, [r4, #0xf2]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldreqh r0, [r4, #0xfe]
    cmpeq r0, #0x0
    movne r8, #0x5
.L_02213fb8:
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x2d4]
    mov r1, #0x1
    bl func_ov090_0221ca34
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x2d4]
    mov r1, r6
    mov r2, r7
    bl func_ov090_0221ca58
    str r8, [sp, #0x0]
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0x2d4]
    ldr r1, [r10, #0x2c4]
    mov r2, r11
    mov r3, r5
    bl func_ov090_0221c73c
    add r9, r9, #0x1
    cmp r9, #0x3
    blt .L_02213ef4
    b .L_0221402c
.L_02214008:
    mov r5, #0x0
    mov r4, r5
.L_02214010:
    add r0, r10, r5, lsl #0x2
    ldr r0, [r0, #0x2d4]
    mov r1, r4
    bl func_ov090_0221ca34
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_02214010
.L_0221402c:
    ldr r0, [r10, #0x2c4]
    mov r4, #0x0
    ldr r0, [r0, #0x4]
    ldrsh r0, [r0, #0x28]
    add r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r5, r0, asr #0x10
    b .L_02214080
.L_0221404c:
    ldr r0, [r10, #0x298]
    mov r1, r4
    bl func_ov090_0221c440
    ldr r6, [r0, #0x4]
    mov r1, r5
    mov r0, r6
    bl func_ov077_02214298
    ldr r1, [r10, #0x2c4]
    mov r0, r6
    ldr r1, [r1, #0x4]
    ldrb r1, [r1, #0x3a]
    bl func_ov077_022142b4
    add r4, r4, #0x1
.L_02214080:
    ldr r0, [r10, #0x298]
    bl func_ov090_0221c44c
    cmp r4, r0
    blt .L_0221404c
    add r0, r10, #0x200
    ldrsb r0, [r0, #0xe4]
    mov r0, r0, lsl #0x1c
    movs r0, r0, asr #0x1c
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_022140dc
    mov r0, r10
    bl func_ov077_022142c8
    cmp r0, #0x0
    movne r0, #0x4
    bne .L_022140e0
    mov r0, r10
    bl func_ov077_022142e0
    cmp r0, #0x0
    movne r0, #0x8
    moveq r0, #0x0
    b .L_022140e0
.L_022140dc:
    mov r0, #0x0
.L_022140e0:
    ldr r1, .L_02214290
    ldr r3, [r10, #0x218]
    ldr r1, [r1, #0x8]
    mov r4, #0x1
    cmp r3, r1
    ldr r1, .L_02214294
    bne .L_02214110
    ldr r2, [r10, #0x21c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq r4, #0x0
.L_02214110:
    add r1, r10, #0x200
    cmp r4, #0x0
    ldrsb r1, [r1, #0xe4]
    bne .L_022141a8
    mov r1, r1, lsl #0x1c
    movs r1, r1, asr #0x1c
    ldr r2, [r10, #0x29c]
    moveq r1, #0x1
    movne r1, #0x0
    ldr r4, [r2, #0x54]
    cmp r1, #0x0
    beq .L_0221416c
    mov r0, r10
    bl func_ov077_022142c8
    cmp r0, #0x0
    movne r3, #0x7
    bne .L_02214200
    mov r0, r10
    bl func_ov077_022142e0
    cmp r0, #0x0
    movne r3, #0xb
    moveq r3, #0x3
    b .L_02214200
.L_0221416c:
    ldrb r2, [r4, #0x38]
    add r1, r0, #0x2
    add r3, r0, #0x3
    cmp r2, r1
    ble .L_02214200
    cmp r3, r2
    bne .L_022141a0
    ldrh r1, [r4, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    addne r3, r0, #0x4
    b .L_02214200
.L_022141a0:
    add r3, r0, #0x4
    b .L_02214200
.L_022141a8:
    mov r1, r1, lsl #0x1c
    movs r1, r1, asr #0x1c
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    ldrsh r1, [r10, #0xda]
    beq .L_022141fc
    cmp r1, #0x2
    addle r3, r1, r0
    ble .L_02214200
    mov r0, r10
    bl func_ov077_022142c8
    cmp r0, #0x0
    movne r3, #0xd
    bne .L_02214200
    mov r0, r10
    bl func_ov077_022142e0
    cmp r0, #0x0
    movne r3, #0xe
    moveq r3, #0xc
    b .L_02214200
.L_022141fc:
    add r3, r1, r0
.L_02214200:
    ldr r0, [r10, #0x29c]
    ldr r0, [r0, #0x54]
    ldrb r1, [r0, #0x38]
    cmp r3, r1
    beq .L_02214274
    and r1, r3, #0xff
    bl func_02072b68
    add r0, r10, #0x200
    ldrsb r0, [r0, #0xe4]
    mov r0, r0, lsl #0x1c
    movs r0, r0, asr #0x1c
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_02214260
    ldrsh r0, [r10, #0xda]
    cmp r0, #0x3
    blt .L_02214260
    ldr r0, [r10, #0x29c]
    ldr r1, [r0, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02214274
.L_02214260:
    ldr r0, [r10, #0x29c]
    ldr r1, [r0, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
.L_02214274:
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0221427c: .word data_020c9670
.L_02214280: .word data_ov077_022170d8
.L_02214284: .word data_021052fc
.L_02214288: .word data_ov077_02216f4c
.L_0221428c: .word data_ov077_02216f64
.L_02214290: .word data_ov077_02216fc8
.L_02214294: .word data_ov077_02216fd0
.size func_ov077_02213c30, . - func_ov077_02213c30
