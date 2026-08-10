; Matching retail form; see src/game/dual_screen_ui_grid_state.c.
.text
.extern Sound_Play
.extern data_021052fc
.extern data_02105310
.extern ActorRuntimeCollection_GetPendingAttachmentFlag
.extern ActorRuntimeCollection_GetBusyState
.extern func_02026514
.extern func_02026588
.extern func_02026990
.extern func_020269a4
.extern func_02026e44
.extern func_02026ed4
.extern func_02072b68
.extern func_020740a4
.extern func_02074110
.extern func_020adc90
.extern func_020befec
.extern gSoundContext

    .global func_020269f8
    .type func_020269f8, @function
func_020269f8: ; 0x020269f8
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    ldrb r0, [r6, #0x8c]
    ands r1, r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, .L_02026e28
    cmp r1, #0x0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r5, [r0, #0xea8]
    bne .L_02026a3c
    ldr r0, [r6, #0x0]
    cmp r0, #0x0
    ldrne r0, [r0, #0x20]
    cmpne r0, #0x0
    movne r0, #0x1
    bne .L_02026a40
.L_02026a3c:
    mov r0, #0x0
.L_02026a40:
    cmp r0, #0x0
    beq .L_02026a94
    cmp r5, #0x0
    bne .L_02026a5c
    mov r0, r6
    bl func_02026514
    b .L_02026ab8
.L_02026a5c:
    ldrsh r1, [r6, #0x74]
    ldrh r0, [r5, #0x4e]
    cmp r1, r0
    beq .L_02026ab8
    mov r0, r5
    bl func_020269a4
    cmp r0, #0x0
    mov r0, r6
    beq .L_02026a8c
    mov r1, #0x1
    bl func_02026588
    b .L_02026ab8
.L_02026a8c:
    bl func_02026514
    b .L_02026ab8
.L_02026a94:
    cmp r5, #0x0
    beq .L_02026ab8
    mov r0, r5
    bl func_020269a4
    cmp r0, #0x0
    beq .L_02026ab8
    mov r0, r6
    mov r1, #0x1
    bl func_02026588
.L_02026ab8:
    ldr r0, [r6, #0x0]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r5, #0x0
    beq .L_02026e14
    ldrb r0, [r6, #0x8c]
    tst r0, #0x1
    bne .L_02026e14
    mov r0, r5
    bl func_020269a4
    cmp r0, #0x0
    beq .L_02026e14
    ldr r0, [r6, #0x0]
    mov r1, #0x1
    str r1, [r0, #0x20]
    ldr r0, [r5, #0x1fc]
    mov r1, #0x64
    add r0, r0, #0x63
    bl func_020befec
    ldrsh r1, [r6, #0x7a]
    mov r0, r0, lsl #0x10
    cmp r1, #0x0
    subgt r0, r1, #0x1
    strgth r0, [r6, #0x7a]
    bgt .L_02026b50
    ldrsh r1, [r6, #0x78]
    cmp r1, r0, asr #0x10
    beq .L_02026b50
    mov r2, #0x1
    strh r2, [r6, #0x7a]
    ldrsh r1, [r6, #0x78]
    cmp r1, r0, asr #0x10
    ldrsh r1, [r6, #0x78]
    subgt r2, r2, #0x2
    mov r0, r6
    add r1, r1, r2
    strh r1, [r6, #0x78]
    bl func_02026e44
.L_02026b50:
    mov r0, r6
    bl func_02026ed4
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    beq .L_02026b88
    ldrb r0, [r6, #0x8c]
    tst r0, #0x2
    bne .L_02026b88
    add r0, r6, #0x7c
    mov r1, #0x6000
    bl func_02026990
.L_02026b88:
    ldr r1, [r5, #0x1fc]
    mov r0, #0x0
    cmp r1, #0x12c
    bgt .L_02026bc4
    ldr r3, [r6, #0x70]
    mov r0, #0x5a
    ldrh r2, [r3, #0x24]
    mov r1, #0x12c
    mov r4, #0x1
    bic r2, r2, #0x4
    strh r2, [r3, #0x24]
    ldr r2, [r5, #0x1fc]
    mul r0, r2, r0
    bl func_020befec
    b .L_02026bdc
.L_02026bc4:
    ldr r2, [r6, #0x70]
    mov r4, r0
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    strb r0, [r6, #0x8d]
.L_02026bdc:
    ldr r2, [r6, #0x6c]
    ldrb r1, [r2, #0x38]
    cmp r4, r1
    beq .L_02026c84
    mov r0, r2
    and r1, r4, #0xff
    bl func_02072b68
    ldr r1, [r6, #0x6c]
    cmp r4, #0x0
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    beq .L_02026cf0
    ldr r0, [r6, #0x70]
    mov r1, #0x0
    bl func_02072b68
    ldr r1, [r6, #0x70]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldrb r0, [r6, #0x8d]
    cmp r0, #0x4
    bhs .L_02026cf0
    cmp r0, #0x0
    beq .L_02026c74
    ldr r0, .L_02026e2c
    bl ActorRuntimeCollection_GetPendingAttachmentFlag
    cmp r0, #0x0
    bne .L_02026c74
    ldr r0, .L_02026e2c
    bl ActorRuntimeCollection_GetBusyState
    cmp r0, #0x0
    bne .L_02026c74
    ldr r0, .L_02026e30
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x71
    bl Sound_Play
.L_02026c74:
    ldrb r0, [r6, #0x8d]
    add r0, r0, #0x1
    strb r0, [r6, #0x8d]
    b .L_02026cf0
.L_02026c84:
    ldrh r1, [r2, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq .L_02026cf0
    cmp r4, #0x0
    ldrgtsh r1, [r6, #0x76]
    addgt r1, r1, #0x1
    strgth r1, [r6, #0x76]
    ldrgtsh r1, [r6, #0x76]
    cmpgt r1, r0
    ble .L_02026cf0
    mov r1, #0x0
    strh r1, [r6, #0x76]
    ldr r2, [r6, #0x6c]
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x1
    strh r0, [r2, #0x24]
    ldr r0, [r6, #0x6c]
    bl func_02072b68
    ldr r2, [r6, #0x70]
    mov r1, #0x0
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x1
    strh r0, [r2, #0x24]
    ldr r0, [r6, #0x70]
    bl func_02072b68
.L_02026cf0:
    ldr r1, [r6, #0x80]
    mov r0, #0x1800
    umull r4, r3, r1, r0
    mov r2, #0x0
    mla r3, r1, r2, r3
    mov r1, r1, asr #0x1f
    mla r3, r1, r0, r3
    adds r4, r4, #0x800
    adc r1, r3, #0x0
    mov r3, r4, lsr #0xc
    ldr r4, [r6, #0x7c]
    orr r3, r3, r1, lsl #0x14
    add r1, r4, r3
    str r1, [r6, #0x7c]
    ldr r3, [r6, #0x84]
    ldr r1, .L_02026e34
    umull r7, r4, r3, r0
    mla r4, r3, r2, r4
    mov r3, r3, asr #0x1f
    mla r4, r3, r0, r4
    adds r7, r7, #0x800
    adc r0, r4, #0x0
    mov r3, r7, lsr #0xc
    orr r3, r3, r0, lsl #0x14
    ldr r4, [r6, #0x80]
    sub r0, r2, #0x1
    add r7, r4, r3
    umull r4, r3, r7, r1
    mla r3, r7, r0, r3
    mov r0, r7, asr #0x1f
    mla r3, r0, r1, r3
    adds r0, r4, #0x800
    str r7, [r6, #0x80]
    ldr ip, [r6, #0x7c]
    adc r2, r3, #0x0
    mov r0, r0, lsr #0xc
    orr r0, r0, r2, lsl #0x14
    mov r2, r1, asr #0x2
    mov r3, r1, asr #0xa
    umull r7, lr, ip, r2
    mla lr, ip, r3, lr
    mov r4, ip, asr #0x1f
    adds r3, r7, #0x800
    mla lr, r4, r2, lr
    adc r2, lr, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    ldr r1, [r6, #0x88]
    add r0, r0, r3
    bl func_020adc90
    str r0, [r6, #0x84]
    ldr r3, [r6, #0x7c]
    ldr r2, [r6, #0x6c]
    mov r1, r3, asr #0x3
    add r1, r3, r1, lsr #0x1c
    mov r1, r1, lsl #0xc
    mov r1, r1, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r3, r1, asr #0x10
    strh r3, [r2, #0x30]
    ldr r1, [r6, #0x68]
    mov r0, r5
    strh r3, [r1, #0x30]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    ldrb r0, [r6, #0x8c]
    orrne r0, r0, #0x2
    strneb r0, [r6, #0x8c]
    biceq r0, r0, #0x2
    streqb r0, [r6, #0x8c]
    b .L_02026e1c
.L_02026e14:
    ldr r0, [r6, #0x0]
    bl func_02074110
.L_02026e1c:
    ldr r0, [r6, #0x0]
    bl func_020740a4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02026e28: .word data_021052fc
.L_02026e2c: .word data_02105310
.L_02026e30: .word gSoundContext
.L_02026e34: .word 0xfffffccd
    .size func_020269f8, . - func_020269f8
