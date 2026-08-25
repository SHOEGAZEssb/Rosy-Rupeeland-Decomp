    .text
    .extern data_020f4e14
    .extern data_021e9ac0
    .extern ActorDescriptor_GetPrimaryLabel
    .extern ActorDescriptorState_FindInactiveQuantity
    .extern GraphicsSpriteRenderer_SetFontResource
    .extern GraphicsSpriteRenderer_DrawText
    .extern GraphicsSpriteRenderer_MeasureText
    .extern GraphicsSpriteCanvas_FillRect
    .extern GraphicsSpriteRenderer_DrawDecimal
    .extern SpriteMotionController_Update
    .extern SpriteMotionController_SetAnimation
    .extern func_ov001_021fb81c
    .extern func_ov001_021fb87c
    .extern func_ov001_021fbf7c
    .extern func_ov001_021fc7e4
    .extern gDebugFont
    .extern gSystemState

/* Exact fallbacks; see src/overlays/ov015/overlay015_record_runtime.c. */
    .global Overlay015_UpdateRecords
    .global func_ov015_021fd6c8
    .global func_ov015_021fd8a8

Overlay015_UpdateRecords:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldr r0, [r4, #0xdc]
    cmp r0, #0x0
    beq L_021fd6a4
    bl func_ov001_021fbf7c
L_021fd6a4:
    add r5, r4, #0xfc
    mov r6, #0x0
    mov r4, #0xac
L_021fd6b0:
    mla r0, r6, r4, r5
    bl SpriteMotionController_Update
    add r6, r6, #0x1
    cmp r6, #0x3
    blt L_021fd6b0
    ldmia sp!, {r4, r5, r6, pc}

    .global func_ov015_021fd6c8
func_ov015_021fd6c8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x10
    mov r6, r0
    ldr r0, [r6, #0xdc]
    bl func_ov001_021fc7e4
    ldr r1, [r6, #0xec]
    mov r4, r0
    cmp r1, #0x0
    beq L_021fd854
    ldr r0, L_021fd898
    ldrh r1, [r1, #0x0]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x1c
    bl ActorDescriptorState_FindInactiveQuantity
    ldr r1, L_021fd89c
    mov r5, r0
    ldrb r0, [r1, #0x5f]
    mov r7, #0x7c
    ldr r1, [r6, #0x78]
    cmp r0, #0x0
    ldr r0, L_021fd8a0
    addne r7, r7, #0x2
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_SetFontResource
    str r7, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    ldr r0, L_021fd8a0
    mov r1, #0x40
    ldr r0, [r0, #0x0]
    mov r2, #0x74
    mov r3, #0x58
    bl GraphicsSpriteCanvas_FillRect
    mov r1, #0xe
    cmp r5, #0x63
    movge r1, #0x3
    mov r0, #0x74
    stmia sp, {r0, r1}
    mov r0, #0x8
    str r0, [sp, #0x8]
    mov r1, #0x1
    str r1, [sp, #0xc]
    ldr r0, L_021fd8a0
    mov r1, r5
    ldr r0, [r0, #0x0]
    mov r2, #0xa
    mov r3, #0x40
    bl GraphicsSpriteRenderer_DrawDecimal
    mov r0, #0x16
    str r0, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    ldr r0, L_021fd8a4
    mov r1, #0x40
    ldr r0, [r0, #0x0]
    mov r2, #0x6
    mov r3, #0xc0
    bl GraphicsSpriteCanvas_FillRect
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    ldreq r1, [r6, #0x70]
    ldreqh r0, [r1, #0x24]
    orreq r0, r0, #0x4
    streqh r0, [r1, #0x24]
    beq L_021fd890
    ldr r2, [r6, #0x70]
    ldr r0, L_021fd8a4
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldr r0, [r0, #0x0]
    ldr r1, [r6, #0x7c]
    bl GraphicsSpriteRenderer_SetFontResource
    ldr r0, [r4, #0xc]
    bl ActorDescriptor_GetPrimaryLabel
    ldr r2, L_021fd8a4
    mov r1, r0
    ldr r0, [r2, #0x0]
    mov r2, #0x8
    mov r3, #0x0
    bl GraphicsSpriteRenderer_MeasureText
    mov r5, r0
    ldr r0, [r4, #0xc]
    bl ActorDescriptor_GetPrimaryLabel
    add r1, r5, r5, lsr #0x1f
    mov r1, r1, asr #0x1
    rsb r2, r1, #0x80
    mov r1, r0
    mov r0, #0xe
    str r0, [sp, #0x0]
    mov r0, #0x8
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, L_021fd8a4
    mov r3, #0x6
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_DrawText
    b L_021fd890
L_021fd854:
    ldr r1, [r4, #0xc]
    ldr r0, [r6, #0xf4]
    cmp r1, #0x0
    beq L_021fd87c
    mov r2, #0x1
    bl func_ov001_021fb87c
    ldr r0, [r6, #0x4c]
    orr r0, r0, #0x2
    str r0, [r6, #0x4c]
    b L_021fd890
L_021fd87c:
    mov r1, #0x1
    bl func_ov001_021fb81c
    ldr r0, [r6, #0x4c]
    bic r0, r0, #0x2
    str r0, [r6, #0x4c]
L_021fd890:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_021fd898: .word data_021e9ac0
L_021fd89c: .word gSystemState
L_021fd8a0: .word gDebugFont
L_021fd8a4: .word data_020f4e14

    .global func_ov015_021fd8a8
func_ov015_021fd8a8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r3, [r4, #0x300]
    cmp r3, #0x3
    ldmgeia sp!, {r4, pc}
    mov r0, #0xac
    mla r2, r3, r0, r4
    str r1, [r2, #0x1a4]
    ldr r2, [r4, #0x300]
    add r3, r4, #0xfc
    mla r0, r2, r0, r3
    and r1, r1, #0xff
    bl SpriteMotionController_SetAnimation
    ldr r0, [r4, #0x300]
    add r0, r0, #0x1
    str r0, [r4, #0x300]
    ldmia sp!, {r4, pc}

    .size Overlay015_UpdateRecords, func_ov015_021fd6c8 - Overlay015_UpdateRecords
    .size func_ov015_021fd6c8, func_ov015_021fd8a8 - func_ov015_021fd6c8
    .size func_ov015_021fd8a8, . - func_ov015_021fd8a8
