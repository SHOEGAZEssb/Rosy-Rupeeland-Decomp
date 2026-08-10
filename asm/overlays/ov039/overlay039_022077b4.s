.text
/* Exact fallback; see overlay039_final_update.c for portable C. */
    .extern func_020befec
    .extern GraphicsSpriteState_SetAnimationIndex
    .extern func_ov039_0220760c
    .extern func_ov039_0220608c
    .extern func_020a68fc
    .extern func_ov007_021fc1d4
    .extern func_ov039_022074b0
    .extern func_ov007_021fc16c
    .extern VecFx32Object_Init
    .extern func_ov039_021fd880
    .extern func_ov039_022013e8
    .extern func_ov039_02205c18
    .extern VecFx32Object_Destroy
    .extern func_0201e0ec
    .extern func_020a27a0
    .extern func_ov039_02206ae0
    .extern VecFx32Object_Add
    .extern func_ov039_021ff458
    .extern data_021052fc
    .extern data_020c9670
    .global func_ov039_022077b4
func_ov039_022077b4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x10
    mov r7, r0
    ldrsh r1, [r7, #0xb8]
    ldr r5, [r7, #0x48]
    cmp r1, #0x1
    ble L_022077f8
    mov r0, #0x0
    str r0, [r7, #0x88]
    ldr r0, [r7, #0x8c]
    add r0, r0, #0xae
    add r0, r0, #0x300
    str r0, [r7, #0x8c]
    ldrsh r0, [r7, #0xb8]
    sub r0, r0, #0x1
    strh r0, [r7, #0xb8]
    b L_02207c84
L_022077f8:
    ldr r2, [r7, #0x80]
    ldr r1, [r2, #0x74]
    cmp r1, #0x1
    bne L_0220791c
    ldrsh r0, [r7, #0xc0]
    mov r1, #0xe
    sub r0, r0, #0x60
    bl func_020befec
    ldrsh r1, [r7, #0xc0]
    add r0, r0, #0x1
    sub r0, r1, r0
    strh r0, [r7, #0xc0]
    ldrsh r0, [r7, #0xc0]
    cmp r0, #0x60
    bge L_02207880
    mov r0, #0x60
    strh r0, [r7, #0xc0]
    ldrh r1, [r5, #0x42]
    mov r0, #0xa
    sub r2, r0, #0x1
    bic r0, r1, #0x4
    strh r0, [r5, #0x42]
L_02207850:
    add r0, r7, r2, lsl #0x2
    ldr r1, [r0, #0x58]
    subs r2, r2, #0x1
    ldrh r0, [r1, #0x42]
    bic r0, r0, #0x4
    strh r0, [r1, #0x42]
    bpl L_02207850
    ldr r1, [r7, #0x54]
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    b L_022078c0
L_02207880:
    ldrh r1, [r5, #0x42]
    mov r0, #0xa
    sub r2, r0, #0x1
    orr r0, r1, #0x4
    strh r0, [r5, #0x42]
L_02207894:
    add r0, r7, r2, lsl #0x2
    ldr r1, [r0, #0x58]
    subs r2, r2, #0x1
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    bpl L_02207894
    ldr r1, [r7, #0x54]
    ldrh r0, [r1, #0x42]
    bic r0, r0, #0x4
    strh r0, [r1, #0x42]
L_022078c0:
    ldrsh r1, [r7, #0xc2]
    mov r0, #0x4a
    add r1, r1, #0x1
    strh r1, [r7, #0xc2]
    ldrsh r1, [r7, #0xc2]
    rsb r2, r1, #0x50
    mul r1, r2, r2
    muls r2, r1, r0
    movmi r2, #0x0
    ldr r1, [r5, #0x34]
    ldr r0, [r7, #0x54]
    add r1, r2, r1
    sub r1, r1, #0x20000
    str r1, [r0, #0x34]
    str r2, [r7, #0xcc]
    cmp r2, #0x0
    bne L_02207c84
    ldr r0, [r7, #0x80]
    mov r1, #0x2
    str r1, [r0, #0x74]
    mov r0, #0x0
    strh r0, [r7, #0xc2]
    b L_02207c84
L_0220791c:
    cmp r1, #0x2
    bne L_02207948
    ldrsh r0, [r7, #0xc2]
    add r0, r0, #0x1
    strh r0, [r7, #0xc2]
    ldrsh r0, [r7, #0xc2]
    cmp r0, #0x46
    ldrgt r0, [r7, #0x80]
    movgt r1, #0x3
    strgt r1, [r0, #0x74]
    b L_02207c84
L_02207948:
    cmp r1, #0x17
    bne L_02207a00
    ldr r0, [r5, #0xc]
    mov r1, #0x1a
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x0
    str r0, [r7, #0x8c]
    str r0, [r7, #0x88]
    strh r0, [r5, #0x40]
    strb r0, [r7, #0xa4]
    ldr r0, [r7, #0x54]
    mov r1, #0x1
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x60
    strh r0, [r7, #0xc0]
    mov r2, #0x0
    strh r2, [r7, #0xc2]
    strh r2, [r7, #0xbc]
    strh r2, [r7, #0xb4]
    mov r0, r7
    mov r1, #0x1
    strh r2, [r7, #0xb6]
    bl func_ov039_0220760c
    mov r0, r7
    bl func_ov039_0220608c
    ldr r0, [r7, #0x80]
    mov r1, #0x18
    str r1, [r0, #0x74]
    ldr r1, [r7, #0x80]
    ldr r0, [r1, #0x14]
    cmp r0, #0x0
    beq L_022079f0
    add r0, r0, #0x1c00
    ldrh r0, [r0, #0xb2]
    cmp r0, #0x0
    bne L_022079f0
    ldr r0, [r1, #0xc4]
    mov r1, #0xc
    ldr r0, [r0, #0x34]
    mov r2, #0x1
    bl func_020a68fc
L_022079f0:
    ldr r0, [r7, #0x80]
    ldr r0, [r0, #0x20]
    bl func_ov007_021fc1d4
    b L_02207c84
L_02207a00:
    cmp r1, #0x18
    bne L_02207a68
    ldr r0, [r2, #0x14]
    cmp r0, #0x0
    addne r0, r0, #0x1c00
    ldrneh r0, [r0, #0xb2]
    moveq r0, #0x0
    cmp r0, #0x0
    bne L_02207c84
    ldr r0, [r5, #0x38]
    sub r0, r0, #0x33
    subs r0, r0, #0x300
    str r0, [r5, #0x38]
    bpl L_02207c84
    mov r1, #0x0
    mov r0, #0xa
    str r1, [r5, #0x38]
    sub r2, r0, #0x1
L_02207a48:
    add r0, r7, r2, lsl #0x2
    ldr r1, [r0, #0x58]
    subs r2, r2, #0x1
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
    bpl L_02207a48
    b L_02207c84
L_02207a68:
    cmp r1, #0x19
    bne L_02207a78
    bl func_ov039_022074b0
    b L_02207c84
L_02207a78:
    cmp r1, #0x1a
    bne L_02207abc
    ldrh r0, [r5, #0x42]
    orr r0, r0, #0x4
    strh r0, [r5, #0x42]
    ldr r1, [r7, #0x54]
    ldrh r0, [r1, #0x42]
    bic r0, r0, #0x4
    strh r0, [r1, #0x42]
    ldrsh r0, [r7, #0xc0]
    add r0, r0, #0x7
    strh r0, [r7, #0xc0]
    ldrsh r0, [r7, #0xc0]
    cmp r0, #0x200
    movgt r0, #0x200
    strgth r0, [r7, #0xc0]
    b L_02207c84
L_02207abc:
    cmp r1, #0x2c
    bne L_02207b10
    mov r0, #0x8
    strb r0, [r7, #0xa4]
    strh r0, [r5, #0x40]
    mov r1, r0, asr #0x1
    ldr r0, [r5, #0xc]
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x200000
    str r0, [r5, #0x30]
    mov r1, #0x1e0000
    mov r0, r7
    str r1, [r5, #0x34]
    bl func_ov039_0220608c
    ldr r0, [r7, #0x80]
    ldr r0, [r0, #0x20]
    bl func_ov007_021fc16c
    ldr r0, [r7, #0x80]
    mov r1, #0x2d
    str r1, [r0, #0x74]
    b L_02207c84
L_02207b10:
    cmp r1, #0x0
    bne L_02207c84
    ldrsh r0, [r7, #0xb6]
    cmp r0, #0x0
    bne L_02207b84
    ldrsh r0, [r7, #0xb4]
    cmp r0, #0x0
    bne L_02207bfc
    add r0, sp, #0x0
    bl VecFx32Object_Init
    ldr r1, [r7, #0x80]
    add r2, sp, #0x0
    ldr r0, [r1, #0x14]
    cmp r0, #0x0
    beq L_02207b58
    add r1, r5, #0x2c
    bl func_ov039_021fd880
    b L_02207b64
L_02207b58:
    ldr r0, [r1, #0x18]
    add r1, r5, #0x2c
    bl func_ov039_022013e8
L_02207b64:
    cmp r0, #0x0
    beq L_02207b78
    add r1, sp, #0x0
    mov r0, r7
    bl func_ov039_02205c18
L_02207b78:
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    b L_02207bfc
L_02207b84:
    sub r0, r0, #0x1
    strh r0, [r7, #0xb6]
    ldrsh r0, [r7, #0xb6]
    cmp r0, #0x0
    bne L_02207bc0
    ldrh r1, [r5, #0x40]
    ldr r0, [r5, #0xc]
    mov r1, r1, asr #0x1
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, r7
    bl func_ov039_0220608c
    ldr r0, [r7, #0x80]
    ldr r0, [r0, #0x20]
    bl func_ov007_021fc16c
L_02207bc0:
    ldrsh r0, [r7, #0xb6]
    cmp r0, #0x5
    ble L_02207bfc
    ldr r0, L_02207f08
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    ldr r1, [r5, #0x34]
    ldr r2, [r5, #0x30]
    sub r1, r1, #0x20000
    mov r2, r2, asr #0xc
    mov r3, r1, asr #0xc
    mov r1, #0x1
    bl func_020a27a0
L_02207bfc:
    mov r0, r7
    bl func_ov039_02206ae0
    ldr r0, [r7, #0xb0]
    cmp r0, #0x0
    ble L_02207c84
    add r0, r0, #0x320
    str r0, [r7, #0xb0]
    cmp r0, #0x4000
    ldrlt r0, [r7, #0xb0]
    ldr r2, L_02207f0c
    addlt r0, r0, #0x178
    addlt r0, r0, #0x400
    strlt r0, [r7, #0xb0]
    ldr r0, [r7, #0xb0]
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x4
    mov r1, r1, lsl #0x2
    ldrsh r3, [r2, r1]
    mov r1, #0x9000
    mov r2, #0x0
    umull r6, r4, r3, r1
    mla r4, r3, r2, r4
    mov r3, r3, asr #0x1f
    mla r4, r3, r1, r4
    adds r6, r6, #0x800
    adc r1, r4, #0x0
    mov r3, r6, lsr #0xc
    cmp r0, #0x8000
    orr r3, r3, r1, lsl #0x14
    rsb r0, r3, #0x10000
    strgt r2, [r7, #0xb0]
    movgt r0, #0x10000
    str r0, [r5, #0x38]
L_02207c84:
    ldr r0, [r7, #0x80]
    ldr r0, [r0, #0x74]
    cmp r0, #0x0
    beq L_02207ca4
    cmp r0, #0x2
    blt L_02207d20
    cmp r0, #0x9
    bgt L_02207d20
L_02207ca4:
    ldr r0, [r7, #0xd4]
    mov r1, #0x1bc
    add r0, r0, #0x1
    mov r2, #0x2bc
    mul r3, r0, r1
    mul r1, r0, r2
    mov r2, r3, lsl #0x10
    mov r3, r1, lsl #0x10
    mov r1, #0x14
    mov r6, r3, lsr #0x10
    str r0, [r7, #0xd4]
    mov r4, r2, lsr #0x10
    bl func_020befec
    mov r3, r4, asr #0x4
    mov r2, r6, asr #0x4
    mov r2, r2, lsl #0x1
    add r2, r2, #0x1
    ldr r4, L_02207f0c
    mov r3, r3, lsl #0x2
    mov r2, r2, lsl #0x1
    ldrsh r3, [r4, r3]
    mov r1, r0
    cmp r0, #0x2
    movgt r1, #0x2
    cmp r0, #0x3
    mul r3, r1, r3
    ldrsh r2, [r4, r2]
    movgt r0, #0x3
    str r3, [r7, #0xc8]
    mul r1, r0, r2
    str r1, [r7, #0xcc]
L_02207d20:
    ldr r0, [r7, #0xac]
    ldr r1, [r7, #0x50]
    cmp r0, #0x0
    ldreqh r0, [r1, #0x42]
    mov r4, #0x0
    orreq r0, r0, #0x4
    ldrneh r0, [r1, #0x42]
    bicne r0, r0, #0x4
    strh r0, [r1, #0x42]
    mov r0, #0xa
    sub r6, r0, #0x1
L_02207d4c:
    add r0, r7, r6, lsl #0x2
    ldr r2, [r0, #0x58]
    ldrh r1, [r2, #0x40]
    cmp r1, #0x0
    beq L_02207dec
    add r1, r1, #0x1
    strh r1, [r2, #0x40]
    ldr r3, [r0, #0x58]
    ldrh r1, [r3, #0x40]
    cmp r1, #0xa
    bne L_02207dc0
    ldr r1, [r3, #0x34]
    mov r2, r6, lsr #0x1f
    sub r1, r1, #0x1000
    str r1, [r3, #0x34]
    rsb r1, r2, r6, lsl #0x1e
    add r1, r2, r1, ror #0x1e
    ldr r2, [r0, #0x58]
    mov r0, r1, lsl #0x1
    add r1, r0, #0x1
    ldr r0, [r2, #0xc]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    add r0, r7, r6, lsl #0x2
    ldr r0, [r0, #0x58]
    ldr r1, [r0, #0xc]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
L_02207dc0:
    add r2, r7, r6, lsl #0x2
    ldr r1, [r2, #0x58]
    ldrh r0, [r1, #0x40]
    cmp r0, #0x28
    ldrh r0, [r1, #0x42]
    biclo r0, r0, #0x4
    strloh r0, [r1, #0x42]
    orrhs r0, r0, #0x4
    strhsh r0, [r1, #0x42]
    ldrhs r0, [r2, #0x58]
    strhsh r4, [r0, #0x40]
L_02207dec:
    subs r6, r6, #0x1
    bpl L_02207d4c
    add r0, r5, #0x2c
    add r1, r7, #0x84
    bl VecFx32Object_Add
    ldr r0, [r7, #0x80]
    ldr r0, [r0, #0x74]
    cmp r0, #0x17
    bge L_02207eac
    cmp r0, #0x1
    ldrne r1, [r5, #0x30]
    ldrne r0, [r7, #0x4c]
    strne r1, [r0, #0x30]
    ldrne r1, [r5, #0x34]
    ldrne r0, [r7, #0x4c]
    bne L_02207e4c
    ldr r1, [r7, #0x54]
    ldr r0, [r7, #0x4c]
    ldr r1, [r1, #0x30]
    str r1, [r0, #0x30]
    ldr r1, [r7, #0x54]
    ldr r0, [r7, #0x4c]
    ldr r1, [r1, #0x34]
    add r1, r1, #0x20000
L_02207e4c:
    str r1, [r0, #0x34]
    ldr r0, [r7, #0x80]
    mov r3, #0x0
    ldr r0, [r0, #0x14]
    cmp r0, #0x0
    beq L_02207e74
    ldr r1, [r7, #0x4c]
    add r1, r1, #0x2c
    bl func_ov039_021ff458
    mov r3, r0
L_02207e74:
    ldr r2, [r7, #0x4c]
    ldr r0, L_02207f10
    ldr r1, [r2, #0x34]
    sub r1, r1, r3
    str r1, [r2, #0x34]
    ldr r2, [r7, #0x4c]
    ldr r1, [r2, #0x34]
    cmp r1, r0
    ldrh r0, [r2, #0x42]
    biclt r0, r0, #0x4
    strlth r0, [r2, #0x42]
    orrge r0, r0, #0x4
    strgeh r0, [r2, #0x42]
    b L_02207ebc
L_02207eac:
    ldr r1, [r7, #0x4c]
    ldrh r0, [r1, #0x42]
    orr r0, r0, #0x4
    strh r0, [r1, #0x42]
L_02207ebc:
    ldrsh r1, [r7, #0xb4]
    cmp r1, #0x0
    ble L_02207f00
    ldrsh r0, [r7, #0xb8]
    cmp r0, #0x0
    bne L_02207f00
    sub r0, r1, #0x1
    strh r0, [r7, #0xb4]
    ldrsh r0, [r7, #0xb4]
    tst r0, #0x2
    mov r0, r7
    beq L_02207ef8
    mov r1, #0x0
    bl func_ov039_0220760c
    b L_02207f00
L_02207ef8:
    mov r1, #0x1
    bl func_ov039_0220760c
L_02207f00:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_02207f08: .word data_021052fc
L_02207f0c: .word data_020c9670
L_02207f10: .word 0x26f000
    .size func_ov039_022077b4, .-func_ov039_022077b4

