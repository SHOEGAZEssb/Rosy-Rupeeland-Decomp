.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern SceneManager_GetCurrent
.extern data_021052fc
.extern data_ov088_0221b6ac
.extern data_ov088_0221b6b0
.extern data_ov088_0221b6ec
.extern data_ov088_0221b6f0
.extern func_02005030
.extern func_02005058
.extern GraphicsSpriteState_SetScreenPositionCulled
.extern GraphicsSpriteState_SetDepthOrderedWorldPositionWithMargins
.extern ActorDerivedRuntime_ForwardTouchPoint
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_020adae4
.extern gSceneManager

.global func_ov088_022191d4
func_ov088_022191d4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x20
    mov r10, r1
    str r2, [sp, #0xc]
    bl ActorDerivedRuntime_ForwardTouchPoint
    add r0, sp, #0x10
    add r1, r10, #0x18
    bl func_02005030
    ldr r3, [r10, #0x54]
    ldr r1, [sp, #0x1c]
    ldrh r2, [r3, #0x28]
    ldr r0, [r10, #0x23c]
    ldrb r7, [r3, #0x3a]
    add r0, r1, r0
    sub r5, r2, #0x18
    str r0, [sp, #0x1c]
    ldr r0, [r10, #0x23c]
    cmp r0, #0x1000
    add r0, r10, #0x200
    movlt r4, #0x1
    ldrh r0, [r0, #0x1a]
    movge r4, #0x0
    tst r0, #0x10
    ldrne r1, [r10, #0x54]
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x10
    strneh r0, [r1, #0x24]
    bne .L_02219264
    ldr r1, [r10, #0x54]
    cmp r4, #0x0
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x10
    strneh r0, [r1, #0x24]
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x10
    streqh r0, [r1, #0x24]
.L_02219264:
    ldr r0, [r10, #0x224]
    cmp r0, #0x0
    beq .L_022192ac
    ldr r1, [sp, #0x18]
    mov r2, #0x8
    str r1, [sp, #0x0]
    ldr r3, [sp, #0x1c]
    ldr r1, [sp, #0xc]
    str r3, [sp, #0x4]
    str r2, [sp, #0x8]
    ldr r3, [sp, #0x14]
    add r2, r10, #0x68
    bl GraphicsSpriteState_SetDepthOrderedWorldPositionWithMargins
    ldr r0, [r10, #0x224]
    sub r1, r5, #0x2
    strb r7, [r0, #0x3a]
    ldr r0, [r10, #0x224]
    strh r1, [r0, #0x28]
.L_022192ac:
    ldrb r0, [r10, #0xd4]
    mov r1, #0x1
    cmp r0, #0x2
    bls .L_022192c4
    cmp r0, #0x6
    movlo r1, #0x0
.L_022192c4:
    ldr r2, [r10, #0x228]
    cmp r1, #0x0
    movne r9, #0x2
    mvneq r9, #0x2
    cmp r2, #0x0
    beq .L_02219344
    ldr r0, [r10, #0x224]
    cmp r4, #0x0
    ldrsh r1, [r0, #0x2e]
    ldrsh r0, [r0, #0x2c]
    strh r0, [r2, #0x2c]
    strh r1, [r2, #0x2e]
    ldr r0, [r10, #0x228]
    movne r2, #0x18
    strb r7, [r0, #0x3a]
    ldr r1, [r10, #0x228]
    moveq r2, #0x0
    add r0, r5, #0x3
    add r0, r0, r2
    strh r0, [r1, #0x28]
    ldr r2, [r10, #0x228]
    mov r0, #0x10000
    ldrh r1, [r2, #0x24]
    rsb r0, r0, #0x0
    and r0, r1, r0
    strh r0, [r2, #0x24]
    ldr r2, [r10, #0x228]
    ldr r0, [r10, #0x224]
    ldrh r1, [r2, #0x24]
    ldrh r0, [r0, #0x24]
    orr r0, r1, r0
    strh r0, [r2, #0x24]
.L_02219344:
    ldr r0, [r10, #0x22c]
    cmp r0, #0x0
    beq .L_022193a8
    strb r7, [r0, #0x3a]
    ldr r0, [r10, #0x22c]
    add r1, r5, #0x1
    strh r1, [r0, #0x28]
    ldr r1, [r10, #0x224]
    mov r0, #0x10000
    ldrsh r3, [r1, #0x2e]
    ldrsh r1, [r1, #0x2c]
    ldr r2, [r10, #0x22c]
    rsb r0, r0, #0x0
    strh r1, [r2, #0x2c]
    strh r3, [r2, #0x2e]
    ldr r2, [r10, #0x22c]
    ldrh r1, [r2, #0x24]
    and r0, r1, r0
    strh r0, [r2, #0x24]
    ldr r2, [r10, #0x22c]
    ldr r0, [r10, #0x224]
    ldrh r1, [r2, #0x24]
    ldrh r0, [r0, #0x24]
    orr r0, r1, r0
    strh r0, [r2, #0x24]
.L_022193a8:
    add r0, r10, #0x200
    ldrsh r0, [r0, #0x30]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02219494
    ldr r0, .L_02219624
    ldr r0, [r0, #0x0]
    bl SceneManager_GetCurrent
    ldr r0, [r0, #0x4]
    cmp r0, #0xe
    beq .L_022194a4
    ldr r0, .L_02219628
    ldr r2, [r10, #0x238]
    ldr r0, [r0, #0x0]
    ldrb r1, [r10, #0xd4]
    add r0, r0, #0x2000
    ldr r11, [r0, #0xea4]
    ldr r3, .L_0221962c
    ldr r8, [r11, #0x54]
    ldr r0, .L_02219630
    ldrsh r2, [r2, #0x18]
    ldr r3, [r3, r1, lsl #0x3]
    ldr r6, [r10, #0x23c]
    rsb ip, r2, r3, asr #0xc
    ldrsh r3, [r8, #0x2c]
    ldr r4, [r0, r1, lsl #0x3]
    ldrsh r2, [r8, #0x2e]
    sub r6, ip, r6, asr #0xc
    mov r0, r8
    add r1, r3, r4, asr #0xc
    add r2, r6, r2
    mov r3, #0x8
    bl GraphicsSpriteState_SetScreenPositionCulled
    strb r7, [r8, #0x3a]
    sub r0, r5, #0x1
    strh r0, [r8, #0x28]
    ldrh r0, [r8, #0x24]
    and r0, r0, #0x8
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    bne .L_022194a4
    ldr r0, [r11, #0x2ac]
    ldrh r1, [r0, #0x24]
    and r1, r1, #0x4
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    beq .L_022194a4
    ldrsh r1, [r0, #0x2c]
    add r1, r1, r4, asr #0xc
    strh r1, [r0, #0x2c]
    ldrsh r1, [r0, #0x2e]
    add r1, r6, r1
    strh r1, [r0, #0x2e]
    b .L_022194a4
.L_02219494:
    ldr r1, [r10, #0x258]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x10
    strh r0, [r1, #0x24]
.L_022194a4:
    ldr r0, [r10, #0x250]
    cmp r0, #0x0
    beq .L_0221954c
    ldrb r4, [r10, #0xd4]
    ldr r1, .L_02219634
    ldr r2, [r10, #0x224]
    ldr r1, [r1, r4, lsl #0x3]
    ldr r3, .L_02219638
    cmp r2, #0x0
    ldr r6, [r3, r4, lsl #0x3]
    mov r1, r1, asr #0xc
    mov r3, #0x8
    beq .L_022194f0
    ldrsh r4, [r2, #0x2c]
    ldrsh r2, [r2, #0x2e]
    add r1, r1, r4
    add r2, r2, r6, asr #0xc
    bl GraphicsSpriteState_SetScreenPositionCulled
    b .L_02219520
.L_022194f0:
    ldr r2, [sp, #0x18]
    str r2, [sp, #0x0]
    ldr r4, [sp, #0x1c]
    mov r2, #0x0
    str r4, [sp, #0x4]
    str r3, [sp, #0x8]
    add r6, r2, r1, lsl #0xc
    ldr r3, [sp, #0x14]
    ldr r1, [sp, #0xc]
    add r2, r10, #0x68
    add r3, r3, r6
    bl GraphicsSpriteState_SetDepthOrderedWorldPositionWithMargins
.L_02219520:
    ldr r0, [r10, #0x250]
    add r1, r5, r9
    strb r7, [r0, #0x3a]
    ldr r0, [r10, #0x250]
    strh r1, [r0, #0x28]
    ldr r0, [r10, #0x250]
    ldrb r1, [r10, #0xd4]
    ldrb r2, [r0, #0x38]
    cmp r1, r2
    beq .L_0221954c
    bl GraphicsSpriteState_SetAnimationIndex
.L_0221954c:
    add r0, r10, #0x200
    ldrh r0, [r0, #0x1a]
    tst r0, #0x2000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_022195c4
    add r0, r10, #0x200
    ldr r2, [r10, #0x258]
    ldrsh r1, [r0, #0x6c]
    ldrb r4, [r2, #0x38]
    cmp r1, #0x0
    subgt r1, r1, #0x1
    strgth r1, [r0, #0x6c]
    movgt r1, #0x8
    bgt .L_022195b0
    ldr r1, [r10, #0x238]
    ldrsh r2, [r0, #0x1c]
    ldrsh r1, [r1, #0x16]
    mov r0, #0x3c
    add r2, r2, #0x3b
    smulbb r1, r1, r0
    rsb r0, r2, r2, lsl #0x3
    bl func_020adae4
    rsb r1, r0, #0x7
.L_022195b0:
    cmp r4, r1
    beq .L_022195c4
    ldr r0, [r10, #0x258]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
.L_022195c4:
    add r0, r10, #0x200
    ldrsh r0, [r0, #0x30]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_022195f0
    add r0, r10, #0x200
    ldrh r0, [r0, #0x1a]
    tst r0, #0x1000
    beq .L_02219604
.L_022195f0:
    ldr r1, [r10, #0x258]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x10
    strh r0, [r1, #0x24]
    b .L_02219614
.L_02219604:
    ldr r1, [r10, #0x258]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x10
    strh r0, [r1, #0x24]
.L_02219614:
    add r0, sp, #0x10
    bl func_02005058
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02219624: .word gSceneManager
.L_02219628: .word data_021052fc
.L_0221962c: .word data_ov088_0221b6b0
.L_02219630: .word data_ov088_0221b6ac
.L_02219634: .word data_ov088_0221b6ec
.L_02219638: .word data_ov088_0221b6f0
.size func_ov088_022191d4, . - func_ov088_022191d4
