; Matching retail form; see src/game/type7_actor_motion_update.c.
.text
.extern data_020c9670
.extern data_020e16b0
.extern data_020e1700
.extern data_020e1718
.extern data_020e1770
.extern func_02005058
.extern func_020050a4
.extern VecFx32_Subtract
.extern Type7Actor_HasSpecialCallbackPair
.extern func_0204cfa4
.extern func_020adae4
.extern func_020ae024
.global Type7Actor_SetMotionTarget
.global Type7Actor_SetMotionTargetWithTimer
.global Type7Actor_UpdateMotionTowardTransform
.type Type7Actor_SetMotionTarget, @function
.type Type7Actor_SetMotionTargetWithTimer, @function
.type Type7Actor_UpdateMotionTowardTransform, @function
Type7Actor_SetMotionTarget: ; 0x020478b0
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x224
    bl func_020050a4
    ldr r1, [r4, #0x268]
    add r0, r4, #0x200
    orr r1, r1, #0x4
    str r1, [r4, #0x268]
    mov r1, #0xb4
    strh r1, [r0, #0x50]
    ldmia sp!, {r4, pc}

Type7Actor_SetMotionTargetWithTimer: ; 0x020478dc
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r3, [r5, #0x268]
    add r0, r5, #0x224
    orr r3, r3, #0xc
    mov r4, r2
    str r3, [r5, #0x268]
    bl func_020050a4
    add r0, r5, #0x200
    strh r4, [r0, #0x50]
    ldmia sp!, {r3, r4, r5, pc}

Type7Actor_UpdateMotionTowardTransform: ; 0x02047908
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r5, r0
    add r0, r5, #0x78
    bl func_020050a4
    add r0, sp, #0x0
    add r1, r5, #0x78
    add r2, r5, #0x18
    bl VecFx32_Subtract
    ldr r0, [sp, #0x4]
    ldr r1, [sp, #0x8]
    bl func_0204cfa4
    cmp r0, #0x4000
    ble .L_02047c6c
    ldr r0, [r5, #0xd0]
    tst r0, #0x2
    beq .L_02047b74
    mov r0, r5
    bl Type7Actor_HasSpecialCallbackPair
    cmp r0, #0x0
    beq .L_02047a10
    ldr r0, [r5, #0x29c]
    ldrb r0, [r0, #0x54]
    cmp r0, #0x1
    bne .L_0204799c
    ldr r2, [r5, #0x23c]
    mov r0, #0x1800
    umull r4, r3, r2, r0
    mov r1, #0x0
    mla r3, r2, r1, r3
    mov r1, r2, asr #0x1f
    adds r2, r4, #0x800
    mla r3, r1, r0, r3
    adc r0, r3, #0x0
    mov r4, r2, lsr #0xc
    orr r4, r4, r0, lsl #0x14
    b .L_02047b68
.L_0204799c:
    cmp r0, #0x0
    bne .L_020479d4
    ldr r2, [r5, #0x23c]
    mov r0, #0x1400
    umull r4, r3, r2, r0
    mov r1, #0x0
    mla r3, r2, r1, r3
    mov r1, r2, asr #0x1f
    adds r2, r4, #0x800
    mla r3, r1, r0, r3
    adc r0, r3, #0x0
    mov r4, r2, lsr #0xc
    orr r4, r4, r0, lsl #0x14
    b .L_02047b68
.L_020479d4:
    add r0, r5, #0x200
    ldrh r1, [r0, #0xa4]
    cmp r1, #0x0
    ldreq r4, [r5, #0x23c]
    beq .L_02047b68
    mov r0, #0x18
    mul r0, r1, r0
    ldr r1, [r5, #0x23c]
    add r0, r0, #0x1000
    smull r2, r0, r1, r0
    adds r1, r2, #0x800
    adc r0, r0, #0x0
    mov r4, r1, lsr #0xc
    orr r4, r4, r0, lsl #0x14
    b .L_02047b68
.L_02047a10:
    ldr r0, .L_02047d24
    ldr r2, [r5, #0x208]
    ldr r0, [r0, #0x68]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_02047d28
    bne .L_02047a40
    ldr r1, [r5, #0x20c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_02047a40:
    cmp r3, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02047ae0
    ldr r1, [r5, #0x280]
    cmp r1, #0x0
    beq .L_02047ad8
    ldr r0, [r1, #0x1c]
    ldr r3, [r5, #0x1c]
    ldr r2, [r5, #0x20]
    ldr r1, [r1, #0x20]
    sub r0, r3, r0
    sub r1, r2, r1
    bl func_0204cfa4
    add r1, r5, #0x200
    ldrsh r1, [r1, #0x48]
    cmp r1, #0x28
    cmpgt r0, #0x40000
    ble .L_02047ad0
    ldr r1, [r5, #0x29c]
    ldrb r1, [r1, #0x54]
    cmp r1, #0x2
    moveq r2, #0x1400
    ldrne r2, .L_02047d2c
    ldr r1, [r5, #0x23c]
    smull r3, r2, r1, r2
    adds r3, r3, #0x800
    adc r1, r2, #0x0
    cmp r0, #0x46000
    ldrgt r0, [r5, #0x268]
    mov r4, r3, lsr #0xc
    orrgt r0, r0, #0x400000
    orr r4, r4, r1, lsl #0x14
    strgt r0, [r5, #0x268]
    b .L_02047b68
.L_02047ad0:
    ldr r4, [r5, #0x23c]
    b .L_02047b68
.L_02047ad8:
    ldr r4, [r5, #0x23c]
    b .L_02047b68
.L_02047ae0:
    ldr r0, .L_02047d24
    ldr r2, [r5, #0x208]
    ldr r0, [r0, #0xc0]
    mov r3, #0x1
    cmp r2, r0
    ldr r0, .L_02047d30
    bne .L_02047b10
    ldr r1, [r5, #0x20c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_02047b10:
    cmp r3, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02047b64
    ldr r0, [r5, #0x29c]
    ldrb r0, [r0, #0x54]
    cmp r0, #0x1
    bne .L_02047b64
    ldr r2, [r5, #0x23c]
    mov r0, #0x1800
    umull r4, r3, r2, r0
    mov r1, #0x0
    mla r3, r2, r1, r3
    mov r1, r2, asr #0x1f
    adds r2, r4, #0x800
    mla r3, r1, r0, r3
    adc r0, r3, #0x0
    mov r4, r2, lsr #0xc
    orr r4, r4, r0, lsl #0x14
    b .L_02047b68
.L_02047b64:
    ldr r4, [r5, #0x23c]
.L_02047b68:
    mov r0, #0xa
    strh r0, [r5, #0xd6]
    b .L_02047bbc
.L_02047b74:
    ldr r0, .L_02047d24
    ldr r2, [r5, #0x208]
    ldr r0, [r0, #0x50]
    ldr r4, [r5, #0x238]
    cmp r2, r0
    mov r3, #0x1
    ldr r0, .L_02047d34
    bne .L_02047ba8
    ldr r1, [r5, #0x20c]
    ldr r0, [r0, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq r3, #0x0
.L_02047ba8:
    cmp r3, #0x0
    moveq r0, #0x9
    streqh r0, [r5, #0xd6]
    movne r0, #0x8
    strneh r0, [r5, #0xd6]
.L_02047bbc:
    ldr r0, [r5, #0x268]
    tst r0, #0x2
    ldr r0, [r5, #0x14]
    movne r4, r4, lsl #0x1
    tst r0, #0x40
    beq .L_02047be4
    mov r0, r4
    mov r1, #0xa
    bl func_020adae4
    mov r4, r0
.L_02047be4:
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0x4]
    bl func_020ae024
    mov r0, r0, asr #0x4
    mov r3, r0, lsl #0x1
    add r0, r3, #0x1
    ldr r1, .L_02047d38
    mov r2, r0, lsl #0x1
    mov r0, r3, lsl #0x1
    ldrsh r2, [r1, r2]
    ldrsh r0, [r1, r0]
    add r1, r5, #0x200
    mul r3, r4, r2
    mul r2, r4, r0
    mov r0, r3, asr #0xc
    str r0, [r5, #0x3c]
    mov r6, r2, asr #0xc
    str r6, [r5, #0x40]
    str r4, [r5, #0x240]
    ldrsh r1, [r1, #0x46]
    cmp r1, #0x0
    bne .L_02047cb8
    mov r1, #0x40
    bl func_020adae4
    ldr r2, [r5, #0x8c]
    mov r1, #0x40
    add r2, r2, r0
    mov r0, r6
    str r2, [r5, #0x8c]
    bl func_020adae4
    ldr r1, [r5, #0x90]
    add r0, r1, r0
    str r0, [r5, #0x90]
    b .L_02047cb8
.L_02047c6c:
    ldr r0, [r5, #0x8c]
    ldr r1, [r5, #0x90]
    bl func_0204cfa4
    ldr r1, .L_02047d3c
    cmp r0, r1
    ble .L_02047ca0
    ldr r0, [r5, #0xd0]
    tst r0, #0x2
    movne r0, #0xa
    strneh r0, [r5, #0xd6]
    moveq r0, #0x8
    streqh r0, [r5, #0xd6]
    b .L_02047ca8
.L_02047ca0:
    mov r0, #0x1
    strh r0, [r5, #0xd6]
.L_02047ca8:
    mov r0, #0x0
    str r0, [r5, #0x40]
    str r0, [r5, #0x3c]
    str r0, [r5, #0x240]
.L_02047cb8:
    ldr r0, [r5, #0x14]
    tst r0, #0x40
    bne .L_02047cd8
    ldr r1, [r5, #0x1dc]
    ldr r0, [r5, #0x24]
    cmp r1, r0
    movlt r0, #0xb
    strlth r0, [r5, #0xd6]
.L_02047cd8:
    ldr r0, [r5, #0xd0]
    tst r0, #0x4
    beq .L_02047d14
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x30]
    blx r1
    cmp r0, #0x0
    beq .L_02047d14
    mov r0, #0x0
    str r0, [r5, #0x94]
    str r0, [r5, #0x90]
    str r0, [r5, #0x8c]
    mov r0, #0x8
    strh r0, [r5, #0xd6]
.L_02047d14:
    add r0, sp, #0x0
    bl func_02005058
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_02047d24: .word data_020e16b0
.L_02047d28: .word data_020e1718
.L_02047d2c: .word 0x159a
.L_02047d30: .word data_020e1770
.L_02047d34: .word data_020e1700
.L_02047d38: .word data_020c9670
.L_02047d3c: .word 0x19a

.size Type7Actor_SetMotionTarget, Type7Actor_SetMotionTargetWithTimer - Type7Actor_SetMotionTarget
.size Type7Actor_SetMotionTargetWithTimer, Type7Actor_UpdateMotionTowardTransform - Type7Actor_SetMotionTargetWithTimer
.size Type7Actor_UpdateMotionTowardTransform, . - Type7Actor_UpdateMotionTowardTransform

