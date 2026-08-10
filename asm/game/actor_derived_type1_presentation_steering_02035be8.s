; Matching retail form; see src/game/actor_derived_type1_presentation_steering.c.
.text
.extern SceneManager_GetCurrent
.extern data_0210568c
.extern data_02105690
.extern func_02005030
.extern func_02005058
.extern func_02031758
.extern func_02031cac
.extern AttachmentController_SetEnabled
.extern func_0204cfa4
.extern func_0206dcac
.extern func_020adae4
.extern func_020adc90
.extern gSceneManager
.extern gSceneTouchInitialData

    .global ActorDerivedType1_UpdatePresentationSteering
    .type ActorDerivedType1_UpdatePresentationSteering, @function
ActorDerivedType1_UpdatePresentationSteering: ; 0x02035be8
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x2c
    mov r4, r2
    mov r10, r0
    mov r9, r1
    add r0, sp, #0x1c
    mov r1, r4
    bl func_02005030
    ldr r1, [r9, #0x270]
    cmp r1, #0x0
    beq .L_02035c44
    ldrb r0, [r1, #0x10]
    tst r0, #0x1
    beq .L_02035c44
    ldr r2, [sp, #0x20]
    ldr r0, [r1, #0x1c]
    ldr r1, [sp, #0x24]
    add r0, r2, r0
    str r0, [sp, #0x20]
    ldr r0, [r9, #0x270]
    ldr r0, [r0, #0x20]
    add r0, r1, r0
    str r0, [sp, #0x24]
.L_02035c44:
    add r2, sp, #0x1c
    mov r0, r10
    mov r1, r9
    bl func_02031758
    ldr r0, [r9, #0x270]
    cmp r0, #0x0
    beq .L_02035c70
    ldr r2, [r0, #0x0]
    ldrb r1, [r9, #0xd4]
    ldr r2, [r2, #0xc]
    blx r2
.L_02035c70:
    ldr r0, .L_02036018
    ldr r0, [r0, #0x0]
    bl SceneManager_GetCurrent
    ldr r0, [r0, #0x4]
    cmp r0, #0x1
    cmpne r0, #0x16
    beq .L_02035c98
    add r0, r9, #0x2a8
    mov r1, #0x0
    bl AttachmentController_SetEnabled
.L_02035c98:
    add r0, sp, #0xc
    add r1, r9, #0x18
    bl func_02005030
    ldrsh r2, [r9, #0x6a]
    ldr r3, [sp, #0x14]
    ldr r1, .L_0203601c
    add r0, r9, #0x2a8
    smlabb r1, r2, r1, r3
    str r1, [sp, #0x14]
    ldr r5, [r0, #0x0]
    add r2, sp, #0xc
    ldr r5, [r5, #0xc]
    mov r1, r4
    mov r3, #0x0
    blx r5
    add r0, sp, #0xc
    bl func_02005058
    ldr r1, [r9, #0x244]
    mov r0, #0x5c
    mul r0, r1, r0
    mov r1, #0x64
    bl func_020adae4
    str r0, [r9, #0x244]
    ldr r0, [r9, #0x230]
    tst r0, #0x20
    bne .L_02035fc8
    ldr r0, .L_02036020
    ldrsh r0, [r0, #0x2]
    cmp r0, #0x0
    addle r1, r9, #0x200
    ldrlesh r0, [r1, #0x9e]
    cmple r0, #0x0
    ble .L_02035f68
    mov r5, #0x0
    mov r6, r5
    mov r7, r5
    mov r8, r5
    ldr r4, .L_02036024
    ldr r11, .L_02036020
    b .L_02035d78
.L_02035d38:
    ldr r0, [r4, r8, lsl #0x2]
    ldr r1, [r0, #0x260]
    tst r1, #0x1000
    movne r1, #0x1
    moveq r1, #0x0
    cmp r1, #0x0
    beq .L_02035d74
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1c8]
    blx r1
    ldr r1, [r0, #0x4]
    ldr r0, [r0, #0x8]
    add r5, r5, r1
    add r6, r6, r0
    add r7, r7, #0x1
.L_02035d74:
    add r8, r8, #0x1
.L_02035d78:
    ldrsh r0, [r11, #0x2]
    cmp r8, r0
    blt .L_02035d38
    add r1, r9, #0x200
    ldrsh r2, [r1, #0x9e]
    cmp r2, #0x0
    ble .L_02035dc8
    ldrsh r0, [r1, #0x9c]
    ldr r3, [r9, #0x20]
    ldrsh r1, [r1, #0x9a]
    rsb r4, r0, r3, asr #0xc
    mul r3, r4, r4
    ldr r8, [r9, #0x1c]
    mul r4, r2, r2
    rsb r8, r1, r8, asr #0xc
    mla r2, r8, r8, r3
    cmp r4, r2
    addgt r5, r5, r1, lsl #0xc
    addgt r6, r6, r0, lsl #0xc
    addgt r7, r7, #0x1
.L_02035dc8:
    cmp r7, #0x0
    beq .L_02035f04
    mov r0, r5
    mov r1, r7
    bl func_020adae4
    mov r4, r0
    mov r0, r6
    mov r1, r7
    bl func_020adae4
    ldr r1, [r9, #0x1c]
    mov r5, r0
    sub r0, r4, r1
    mov r0, r0, lsl #0x1
    mov r1, #0x5
    bl func_020adae4
    ldr r1, [r9, #0x20]
    mov r4, r0
    sub r0, r5, r1
    mov r0, r0, lsl #0x1
    mov r1, #0x5
    bl func_020adae4
    mov r5, r0
    mov r0, r4
    mov r1, r5
    bl func_0204cfa4
    mov r6, r0
    cmp r6, #0x30000
    ble .L_02035e60
    mov r0, #0x30
    mul r0, r4, r0
    mov r1, r6
    bl func_020adc90
    mov r1, #0x30
    mov r4, r0
    mul r0, r5, r1
    mov r1, r6
    bl func_020adc90
    mov r5, r0
.L_02035e60:
    add r0, r9, #0x200
    ldrsh r1, [r0, #0x4e]
    add r1, r1, #0x1
    strh r1, [r0, #0x4e]
    ldrsh r1, [r0, #0x4e]
    cmp r1, #0x258
    movgt r1, #0x258
    strgth r1, [r0, #0x4e]
    add r0, r9, #0x200
    ldrsh r0, [r0, #0x4e]
    mov r1, #0x258
    mov r0, r0, lsl #0xc
    bl func_020adae4
    ldr r2, [r9, #0x23c]
    rsb r1, r0, #0x1000
    smull r3, r6, r2, r1
    adds r7, r3, #0x800
    smull r3, r2, r4, r0
    adc r4, r6, #0x0
    adds r3, r3, #0x800
    mov r6, r7, lsr #0xc
    adc r2, r2, #0x0
    mov r3, r3, lsr #0xc
    orr r6, r6, r4, lsl #0x14
    orr r3, r3, r2, lsl #0x14
    add r2, r6, r3
    str r2, [r9, #0x23c]
    ldr r3, [r9, #0x240]
    smull r2, r0, r5, r0
    smull r4, r1, r3, r1
    adds r4, r4, #0x800
    adc r3, r1, #0x0
    adds r1, r2, #0x800
    mov r2, r4, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r2, r2, r3, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r2, r1
    str r0, [r9, #0x240]
    b .L_02035fd4
.L_02035f04:
    add r1, r9, #0x200
    mov r0, #0x0
    strh r0, [r1, #0x4e]
    ldr r3, [r9, #0x23c]
    ldr r1, .L_02036028
    mov r2, r3, asr #0x1f
    umull r5, r4, r3, r1
    mla r4, r3, r0, r4
    adds r3, r5, #0x800
    mla r4, r2, r1, r4
    adc r2, r4, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    str r3, [r9, #0x23c]
    ldr r2, [r9, #0x240]
    umull r4, r3, r2, r1
    adds r4, r4, #0x800
    mla r3, r2, r0, r3
    mov r0, r2, asr #0x1f
    mla r3, r0, r1, r3
    adc r0, r3, #0x0
    mov r1, r4, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r9, #0x240]
    b .L_02035fd4
.L_02035f68:
    mov r0, #0x0
    strh r0, [r1, #0x4e]
    ldr r3, [r9, #0x23c]
    ldr r1, .L_02036028
    mov r2, r3, asr #0x1f
    umull r5, r4, r3, r1
    mla r4, r3, r0, r4
    adds r3, r5, #0x800
    mla r4, r2, r1, r4
    adc r2, r4, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    str r3, [r9, #0x23c]
    ldr r2, [r9, #0x240]
    umull r4, r3, r2, r1
    adds r4, r4, #0x800
    mla r3, r2, r0, r3
    mov r0, r2, asr #0x1f
    mla r3, r0, r1, r3
    adc r0, r3, #0x0
    mov r1, r4, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r9, #0x240]
    b .L_02035fd4
.L_02035fc8:
    add r0, r9, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x4e]
.L_02035fd4:
    ldr r0, [r9, #0x26c]
    cmp r0, #0x0
    beq .L_02035fe4
    bl func_0206dcac
.L_02035fe4:
    ldr r0, .L_0203602c
    add r1, sp, #0x0
    str r0, [sp, #0x0]
    ldr r2, [r10, #0x4]
    mov r0, r9
    str r2, [sp, #0x4]
    ldr r2, [r10, #0x8]
    str r2, [sp, #0x8]
    bl func_02031cac
    add r0, sp, #0x1c
    bl func_02005058
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02036018: .word gSceneManager
.L_0203601c: .word 0xb33
.L_02036020: .word data_0210568c
.L_02036024: .word data_02105690
.L_02036028: .word 0xf48
.L_0203602c: .word gSceneTouchInitialData
    .size ActorDerivedType1_UpdatePresentationSteering, . - ActorDerivedType1_UpdatePresentationSteering

    .global ActorDerivedType1_UpdateAttachmentPresentation

