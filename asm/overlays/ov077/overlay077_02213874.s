.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_ov077_02213768
.extern func_ov077_02213c08

.global func_ov077_02213874
func_ov077_02213874:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    ldrsh r0, [r5, #0xd6]
    cmp r0, #0x13
    addls pc, pc, r0, lsl #0x2
    b .L_02213bdc
.L_0221388c:
    b .L_02213bdc
    b .L_02213bdc
    b .L_022138dc
    b .L_02213974
    b .L_02213bdc
    b .L_02213a10
    b .L_02213ac4
    b .L_02213bdc
    b .L_02213bdc
    b .L_02213bdc
    b .L_02213bdc
    b .L_02213bdc
    b .L_02213bdc
    b .L_02213b10
    b .L_02213a78
    b .L_02213bdc
    b .L_02213b5c
    b .L_02213bdc
    b .L_02213bdc
    b .L_02213b9c
.L_022138dc:
    add r0, r5, #0x200
    ldrsb r0, [r0, #0xe4]
    ldrsh r4, [r5, #0xda]
    mov r0, r0, lsl #0x1c
    movs r0, r0, asr #0x1c
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0221390c
    cmp r4, #0x3
    movgt r4, #0x3
    b .L_02213914
.L_0221390c:
    cmp r4, #0x3
    movge r4, #0x2
.L_02213914:
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldrsh r0, [r5, #0xda]
    ldr r6, [r5, #0x2c4]
    and r7, r0, #0xff
    ldr r0, [r6, #0x4]
    mov r1, r7
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r6, #0x8]
    mov r1, r7
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r5, #0x2c4]
    mov r1, #0x1
    bl func_ov077_02213c08
    ldr r0, [r5, #0x2c4]
    mov r1, #0x2
    bl func_ov077_02213768
    b .L_02213be0
.L_02213974:
    add r0, r5, #0x200
    ldrsb r0, [r0, #0xe4]
    mov r0, r0, lsl #0x1c
    movs r0, r0, asr #0x1c
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldrsh r0, [r5, #0xda]
    beq .L_022139a4
    cmp r0, #0x3
    movgt r0, #0x3
    b .L_022139ac
.L_022139a4:
    cmp r0, #0x3
    movge r0, #0x2
.L_022139ac:
    ldr r1, [r5, #0x54]
    add r4, r0, #0xd
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldrsh r0, [r5, #0xda]
    ldr r6, [r5, #0x2c4]
    and r7, r0, #0xff
    ldr r0, [r6, #0x4]
    mov r1, r7
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r6, #0x8]
    mov r1, r7
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r5, #0x2c4]
    mov r1, #0x1
    bl func_ov077_02213c08
    ldr r0, [r5, #0x2c4]
    mov r1, #0x2
    bl func_ov077_02213768
    b .L_02213be0
.L_02213a10:
    ldr r2, [r5, #0x54]
    ldrsh r3, [r5, #0xda]
    ldrh r0, [r2, #0x24]
    mov r1, #0x4
    cmp r3, #0x3
    bic r0, r0, #0x1
    strh r0, [r2, #0x24]
    ldr r2, [r5, #0x54]
    movge r3, #0x2
    ldrh r0, [r2, #0x24]
    add r4, r3, #0x4
    orr r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r6, [r5, #0x2c4]
    ldr r0, [r6, #0x4]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r6, #0x8]
    mov r1, #0x4
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r5, #0x2c4]
    mov r1, #0x1
    bl func_ov077_02213c08
    ldr r0, [r5, #0x2c4]
    mov r1, #0x2
    bl func_ov077_02213768
    b .L_02213be0
.L_02213a78:
    ldr r2, [r5, #0x54]
    ldrsh r3, [r5, #0xda]
    ldrh r0, [r2, #0x24]
    mov r1, #0x4
    cmp r3, #0x3
    bic r0, r0, #0x3
    strh r0, [r2, #0x24]
    ldr r6, [r5, #0x2c4]
    movge r3, #0x2
    ldr r0, [r6, #0x4]
    add r4, r3, #0x4
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r6, #0x8]
    mov r1, #0x4
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r5, #0x2c4]
    mov r1, #0x3
    bl func_ov077_02213c08
    b .L_02213be0
.L_02213ac4:
    ldr r2, [r5, #0x54]
    ldrsh r3, [r5, #0xda]
    ldrh r0, [r2, #0x24]
    mov r1, #0x5
    cmp r3, #0x3
    bic r0, r0, #0x3
    strh r0, [r2, #0x24]
    ldr r6, [r5, #0x2c4]
    movge r3, #0x2
    ldr r0, [r6, #0x4]
    add r4, r3, #0x7
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r6, #0x8]
    mov r1, #0x5
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r5, #0x2c4]
    mov r1, #0x3
    bl func_ov077_02213c08
    b .L_02213be0
.L_02213b10:
    ldr r2, [r5, #0x54]
    ldrsh r3, [r5, #0xda]
    ldrh r0, [r2, #0x24]
    mov r1, #0x5
    cmp r3, #0x3
    bic r0, r0, #0x3
    strh r0, [r2, #0x24]
    ldr r6, [r5, #0x2c4]
    movge r3, #0x2
    ldr r0, [r6, #0x4]
    add r4, r3, #0x7
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r6, #0x8]
    mov r1, #0x5
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r5, #0x2c4]
    mov r1, #0x3
    bl func_ov077_02213c08
    b .L_02213be0
.L_02213b5c:
    ldr r2, [r5, #0x54]
    mov r1, #0xa
    ldrh r0, [r2, #0x24]
    mov r4, #0x10
    bic r0, r0, #0x3
    strh r0, [r2, #0x24]
    ldr r6, [r5, #0x2c4]
    ldr r0, [r6, #0x4]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r6, #0x8]
    mov r1, #0xa
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r5, #0x2c4]
    mov r1, #0x3
    bl func_ov077_02213c08
    b .L_02213be0
.L_02213b9c:
    ldr r2, [r5, #0x54]
    mov r1, #0x7
    ldrh r0, [r2, #0x24]
    mov r4, #0x4
    bic r0, r0, #0x3
    strh r0, [r2, #0x24]
    ldr r6, [r5, #0x2c4]
    ldr r0, [r6, #0x4]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r6, #0x8]
    mov r1, #0x7
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r5, #0x2c4]
    mov r1, #0x3
    bl func_ov077_02213c08
    b .L_02213be0
.L_02213bdc:
    mov r4, #0x0
.L_02213be0:
    ldr r0, [r5, #0x54]
    and r1, r4, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r5, #0x54]
    mov r1, #0x100
    strh r1, [r0, #0x36]
    ldr r0, [r5, #0x54]
    mov r1, #0x0
    strh r1, [r0, #0x30]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.size func_ov077_02213874, . - func_ov077_02213874
