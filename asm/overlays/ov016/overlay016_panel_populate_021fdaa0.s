    .text
    .extern data_020f4e18
    .extern ActorDescriptor_GetPrimaryLabel
    .extern ActorDescriptor_GetComponent
    .extern ActorDescriptor_GetPanelImage
    .extern ActorDescriptor_GetSecondaryLabel
    .extern ActorDescriptor_GetKind0Animation
    .extern ActorDescriptorComponent_GetCharacterResourceId
    .extern ActorDescriptorComponent_GetPaletteResourceId
    .extern ActorDescriptorComponent_GetCellResourceId
    .extern ActorDescriptorComponent_GetAnimation
    .extern func_02071ee0
    .extern GraphicsSpriteState_SetAnimationIndex
    .extern func_02073e48
    .extern GraphicsSpriteGroup_CreateStateFromSource
    .extern GraphicsSpriteRenderer_SetFontResource
    .extern GraphicsSpriteRenderer_DrawText
    .extern GraphicsSpriteCanvas_FillRect
    .extern func_02091b98
    .extern func_ov016_021fd9dc
    .extern gSystemState

/* Exact fallback; see src/overlays/ov016/overlay016_panel_populate.c. */
    .global func_ov016_021fdaa0

func_ov016_021fdaa0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x2c
    ldr r7, [r1, #0x0]
    str r1, [sp, #0xc]
    mov r10, r0
    mov r4, r2
    cmp r7, #0x0
    beq L_021fdf1c
    add r0, r10, #0xf8
    mov r1, #0x78
    bl func_02091b98
    mov r0, r10
    mov r1, #0x0
    bl func_ov016_021fd9dc
    add r1, r4, #0x32
    ldr r0, [r10, #0x84]
    and r1, r1, #0xff
    ldr r4, [r7, #0x0]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r2, [r10, #0x84]
    add r0, r4, #0x4
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    bl ActorDescriptor_GetPanelImage
    add r0, r0, #0x6
    and r1, r0, #0xff
    ldr r0, [r10, #0x88]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r3, [r10, #0x88]
    add r0, r4, #0x4
    ldrh r2, [r3, #0x24]
    mov r1, #0x0
    bic r2, r2, #0x4
    strh r2, [r3, #0x24]
    bl ActorDescriptor_GetComponent
    bl ActorDescriptorComponent_GetCharacterResourceId
    mov r6, r0
    add r0, r4, #0x4
    mov r1, #0x0
    bl ActorDescriptor_GetComponent
    bl ActorDescriptorComponent_GetPaletteResourceId
    mov r5, r0
    add r0, r4, #0x4
    mov r1, #0x0
    bl ActorDescriptor_GetComponent
    bl ActorDescriptorComponent_GetCellResourceId
    str r0, [sp, #0x0]
    ldr r1, L_021fdf48
    mov r2, r6
    ldr r1, [r1, #0x0]
    mov r3, r5
    add r0, r10, #0x18
    bl func_02071ee0
    ldr r0, [r10, #0x4]
    add r1, r10, #0x18
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r5, r0
    add r0, r4, #0x4
    mov r1, #0x0
    bl ActorDescriptor_GetComponent
    bl ActorDescriptorComponent_GetAnimation
    mov r2, #0x1
    str r2, [sp, #0x0]
    mov r2, #0x0
    str r2, [sp, #0x4]
    mov r1, r0
    str r2, [sp, #0x8]
    mov r0, r5
    mov r2, #0x44
    mov r3, #0x36
    bl func_02073e48
    ldr r0, L_021fdf4c
    ldr r1, [r7, #0x0]
    ldrb r0, [r0, #0x5f]
    mov r5, #0x0
    ldr r11, [r1, #0x100]
    cmp r0, #0x0
    add r0, r10, #0x24
    mov r6, r5
    subne r5, r5, #0x10
    mov r9, #0x0
    str r0, [sp, #0x14]
L_021fdbf0:
    cmp r9, r11
    bge L_021fdd38
    mov r0, #0xc
    mul r0, r9, r0
    ldr r1, [r7, #0x0]
    str r0, [sp, #0x18]
    add r1, r1, #0x28
    mov r0, #0x24
    mla r8, r9, r0, r1
    mov r0, r8
    mov r1, #0x0
    bl ActorDescriptor_GetComponent
    bl ActorDescriptorComponent_GetCharacterResourceId
    str r0, [sp, #0x1c]
    mov r0, r8
    mov r1, #0x0
    bl ActorDescriptor_GetComponent
    bl ActorDescriptorComponent_GetPaletteResourceId
    str r0, [sp, #0x20]
    mov r0, r8
    mov r1, #0x0
    bl ActorDescriptor_GetComponent
    bl ActorDescriptorComponent_GetCellResourceId
    str r0, [sp, #0x0]
    ldr r1, [sp, #0x14]
    ldr r0, [sp, #0x18]
    ldr r2, [sp, #0x1c]
    add r0, r1, r0
    ldr r1, L_021fdf48
    ldr r3, [sp, #0x20]
    ldr r1, [r1, #0x0]
    bl func_02071ee0
    ldr r1, [sp, #0x14]
    ldr r0, [sp, #0x18]
    mov r2, #0x2
    add r1, r1, r0
    ldr r0, [r10, #0x4]
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [sp, #0x24]
    mov r0, r8
    mov r1, #0x0
    bl ActorDescriptor_GetComponent
    bl ActorDescriptorComponent_GetAnimation
    mov r1, #0x1
    str r1, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    mov r1, r0
    ldr r0, [sp, #0x24]
    add r2, r5, #0x26
    add r3, r6, #0x60
    bl func_02073e48
    ldr r0, [sp, #0xc]
    add r0, r0, r9
    ldrb r0, [r0, #0xe]
    cmp r0, #0x2
    ldreq r0, [sp, #0x24]
    moveq r1, #0x1
    streqh r1, [r0, #0x2a]
    ldrh r1, [r8, #0x4]
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0xa4]
    sub r1, r1, #0x1
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    add r3, r10, r9, lsl #0x2
    ldr r2, [r3, #0xa4]
    mov r0, r8
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldr r2, [r3, #0x8c]
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    bl ActorDescriptor_GetKind0Animation
    add r0, r0, #0x12
    and r1, r0, #0xff
    add r0, r10, r9, lsl #0x2
    ldr r0, [r0, #0xbc]
    bl GraphicsSpriteState_SetAnimationIndex
L_021fdd38:
    cmp r9, #0x2
    add r6, r6, #0x22
    bne L_021fdd5c
    ldr r0, L_021fdf4c
    add r5, r5, #0x6c
    ldrb r0, [r0, #0x5f]
    mov r6, #0x0
    cmp r0, #0x0
    addne r5, r5, #0x10
L_021fdd5c:
    add r9, r9, #0x1
    cmp r9, #0x6
    blt L_021fdbf0
    mov r0, #0x47
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldr r0, [r10, #0x0]
    mov r1, #0x59
    mov r2, #0x27
    mov r3, #0xd9
    bl GraphicsSpriteCanvas_FillRect
    ldr r0, [r10, #0x0]
    ldr r1, [r10, #0xdc]
    bl GraphicsSpriteRenderer_SetFontResource
    add r0, r4, #0x4
    bl ActorDescriptor_GetPrimaryLabel
    mov r1, r0
    mov r0, #0xe
    str r0, [sp, #0x0]
    mov r0, #0x6
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, [r10, #0x0]
    mov r2, #0x59
    mov r3, #0x27
    bl GraphicsSpriteRenderer_DrawText
    ldr r0, L_021fdf4c
    ldr r1, [r10, #0xd8]
    ldrb r0, [r0, #0x5f]
    mov r5, #0x3b
    cmp r0, #0x0
    ldr r0, [r10, #0x0]
    subne r5, r5, #0x2
    bl GraphicsSpriteRenderer_SetFontResource
    add r0, r4, #0x4
    bl ActorDescriptor_GetSecondaryLabel
    mov r1, #0xe
    str r1, [sp, #0x0]
    mov r1, #0x4
    str r1, [sp, #0x4]
    mov r1, #0x0
    str r1, [sp, #0x8]
    mov r1, r0
    ldr r0, [r10, #0x0]
    mov r3, r5
    mov r2, #0x6b
    bl GraphicsSpriteRenderer_DrawText
    ldr r0, L_021fdf4c
    mov r6, #0x0
    ldrb r0, [r0, #0x5f]
    mov r4, #0x40
    mov r8, r6
    cmp r0, #0x0
    subne r6, r6, #0x10
    addne r4, r4, #0x10
    mov r5, #0x0
L_021fde44:
    add r0, r8, #0x63
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    add r1, r6, #0x3a
    ldr r0, [r10, #0x0]
    add r2, r8, #0x53
    add r3, r1, r4
    bl GraphicsSpriteCanvas_FillRect
    cmp r5, r11
    bge L_021fdee8
    mov r0, #0x24
    mul r0, r5, r0
    str r0, [sp, #0x28]
    mov r0, #0xe
    str r0, [sp, #0x10]
    ldr r0, [sp, #0xc]
    ldr r1, [r7, #0x0]
    add r0, r0, r5
    ldrb r0, [r0, #0xe]
    add r9, r1, #0x28
    ldr r1, [r10, #0xd4]
    cmp r0, #0x2
    moveq r0, #0x5
    streq r0, [sp, #0x10]
    ldr r0, [r10, #0x0]
    bl GraphicsSpriteRenderer_SetFontResource
    ldr r0, [sp, #0x28]
    add r0, r9, r0
    bl ActorDescriptor_GetPrimaryLabel
    ldr r1, [sp, #0x10]
    add r2, r6, #0x3a
    str r1, [sp, #0x0]
    mov r1, #0x4
    str r1, [sp, #0x4]
    mov r1, #0x0
    str r1, [sp, #0x8]
    mov r1, r0
    ldr r0, [r10, #0x0]
    add r3, r8, #0x53
    bl GraphicsSpriteRenderer_DrawText
L_021fdee8:
    cmp r5, #0x2
    add r8, r8, #0x22
    bne L_021fdf0c
    ldr r0, L_021fdf4c
    add r6, r6, #0x6c
    ldrb r0, [r0, #0x5f]
    mov r8, #0x0
    cmp r0, #0x0
    addne r6, r6, #0x10
L_021fdf0c:
    add r5, r5, #0x1
    cmp r5, #0x6
    blt L_021fde44
    b L_021fdf40
L_021fdf1c:
    mov r1, #0x1
    bl func_ov016_021fd9dc
    ldr r0, [r10, #0x84]
    and r1, r4, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r10, #0x84]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
L_021fdf40:
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fdf48: .word data_020f4e18
L_021fdf4c: .word gSystemState

    .size func_ov016_021fdaa0, . - func_ov016_021fdaa0
