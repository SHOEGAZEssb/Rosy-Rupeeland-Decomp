.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern data_021052fc
.extern VecFx32Object_Init
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern func_0201e0ec
.extern func_020a27a0
.extern func_ov077_02213768
.extern func_ov090_0221c3dc

.global func_ov077_022169bc
func_ov077_022169bc:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r0
    mov r2, #0x0
    add r0, r5, #0x200
    strh r2, [r0, #0xee]
    mov r0, #0x12
    strh r0, [r5, #0xd6]
    ldrb r1, [r5, #0x2e4]
    ldr r0, .L_02216ca8
    bic r1, r1, #0x80
    strb r1, [r5, #0x2e4]
    ldr r1, [r5, #0x260]
    bic r1, r1, #0x3
    str r1, [r5, #0x260]
    str r2, [r5, #0x40]
    str r2, [r5, #0x3c]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    ldrb r3, [r5, #0x2e4]
    mov r4, r0
    mov r1, r3, lsl #0x19
    movs r1, r1, lsr #0x1d
    bne .L_02216aa4
    add r1, r5, #0x200
    ldrsh r2, [r1, #0xec]
    cmp r2, #0x0
    ble .L_02216a74
    sub r2, r2, #0x1
    strh r2, [r1, #0xec]
    ldrsh r1, [r1, #0xec]
    mov r2, r1, lsr #0x1f
    rsb r1, r2, r1, lsl #0x1d
    adds r1, r2, r1, ror #0x1d
    bne .L_02216c9c
    ldr r1, [r5, #0x24]
    ldr r2, [r5, #0x1c]
    ldr r3, [r5, #0x20]
    mov r1, r1, asr #0xc
    mov r2, r2, asr #0xc
    rsb r3, r1, r3, asr #0xc
    mov r1, #0x1
    bl func_020a27a0
    b .L_02216c9c
.L_02216a74:
    bic r0, r3, #0x70
    orr r0, r0, #0x10
    strb r0, [r5, #0x2e4]
    ldr r1, [r5, #0x14]
    mov r0, #0x2000
    bic r1, r1, #0x40
    str r1, [r5, #0x14]
    ldr r1, [r5, #0xd0]
    orr r1, r1, #0x2000
    str r1, [r5, #0xd0]
    str r0, [r5, #0x44]
    b .L_02216c9c
.L_02216aa4:
    cmp r1, #0x1
    bne .L_02216c28
    add r0, sp, #0x0
    bl VecFx32Object_Init
    ldr r1, [r5, #0x29c]
    add r0, sp, #0x0
    cmp r1, #0x0
    beq .L_02216ad0
    add r1, r1, #0x18
    bl VecFx32Object_Assign
    b .L_02216ad8
.L_02216ad0:
    add r1, r5, #0x22c
    bl VecFx32Object_Assign
.L_02216ad8:
    mov r0, r5
    ldr r2, [r0, #0x0]
    add r1, sp, #0x0
    ldr r2, [r2, #0xd0]
    blx r2
    ldr r0, [r5, #0x44]
    cmp r0, #0x0
    ldreq r1, [r5, #0x24]
    ldreq r0, [r5, #0x1dc]
    cmpeq r1, r0
    bne .L_02216c1c
    add r0, r5, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x80]
    ldrb r2, [r5, #0x2e4]
    mov r0, r4
    bic r2, r2, #0x70
    orr r2, r2, #0x20
    strb r2, [r5, #0x2e4]
    ldr r2, [r5, #0x24]
    ldr ip, [r5, #0x1c]
    ldr r3, [r5, #0x20]
    mov r2, r2, asr #0xc
    rsb r3, r2, r3, asr #0xc
    mov r2, ip, asr #0xc
    add r3, r3, #0x18
    bl func_020a27a0
    ldr r0, [r5, #0x24]
    ldr r2, [r5, #0x1c]
    ldr r1, [r5, #0x20]
    mov r0, r0, asr #0xc
    mov r2, r2, asr #0xc
    rsb r1, r0, r1, asr #0xc
    mov r0, r4
    sub r2, r2, #0x18
    sub r3, r1, #0x8
    mov r1, #0x1
    bl func_020a27a0
    ldr r0, [r5, #0x24]
    ldr r2, [r5, #0x1c]
    ldr r1, [r5, #0x20]
    mov r0, r0, asr #0xc
    mov r2, r2, asr #0xc
    rsb r1, r0, r1, asr #0xc
    mov r0, r4
    add r2, r2, #0x18
    sub r3, r1, #0x8
    mov r1, #0x1
    bl func_020a27a0
    mov r0, r4
    mov r1, #0x1
    ldr r2, [r5, #0x1c]
    ldr ip, [r5, #0x20]
    mov r2, r2, asr #0xc
    sub r2, r2, #0xc
    ldr r3, [r5, #0x24]
    mov r3, r3, asr #0xc
    rsb r3, r3, ip, asr #0xc
    sub r3, r3, #0x14
    bl func_020a27a0
    mov r0, r4
    mov r1, #0x1
    ldr r2, [r5, #0x1c]
    ldr ip, [r5, #0x20]
    mov r2, r2, asr #0xc
    add r2, r2, #0xc
    ldr r3, [r5, #0x24]
    mov r3, r3, asr #0xc
    rsb r3, r3, ip, asr #0xc
    sub r3, r3, #0x14
    bl func_020a27a0
    mov r0, r4
    mov r1, #0x1
    ldr r2, [r5, #0x1c]
    ldr r4, [r5, #0x20]
    mov r2, r2, asr #0xc
    ldr r3, [r5, #0x24]
    mov r3, r3, asr #0xc
    rsb r3, r3, r4, asr #0xc
    sub r3, r3, #0x18
    bl func_020a27a0
.L_02216c1c:
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    b .L_02216c9c
.L_02216c28:
    cmp r1, #0x2
    bne .L_02216c60
    mov r0, #0x10
    strh r0, [r5, #0xd6]
    ldr r0, [r5, #0x54]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    ldrneb r0, [r5, #0x2e4]
    bicne r0, r0, #0x70
    orrne r0, r0, #0x30
    strneb r0, [r5, #0x2e4]
    b .L_02216c9c
.L_02216c60:
    ldr r2, [r5, #0x54]
    mov r1, #0x10
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x10
    strh r0, [r2, #0x24]
    ldr r0, [r5, #0x2c4]
    bl func_ov077_02213768
    ldr r0, [r5, #0x298]
    mov r1, #0x0
    bl func_ov090_0221c3dc
    ldr r0, [r5, #0x29c]
    ldr r1, [r0, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
.L_02216c9c:
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_02216ca8: .word data_021052fc
.size func_ov077_022169bc, . - func_ov077_022169bc
