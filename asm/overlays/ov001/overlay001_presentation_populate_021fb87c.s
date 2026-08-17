    .text
    .extern func_ov001_021fb81c
    .extern ActorDescriptor_LoadDetailResource
    .extern TitleDialog_SetText
    .extern TitleDialog_ClearTextRect
    .extern TitleDialog_UpdateTextPage
    .extern GraphicsSpriteRenderer_SetFontResource
    .extern GraphicsSpriteCanvas_FillRect
    .extern ActorDescriptor_GetSecondaryLabel
    .extern GraphicsSpriteRenderer_DrawText
    .extern GraphicsSpriteGroup_CreateStateFromSource
    .extern ActorDescriptor_GetPresentationAnimation
    .extern func_02073e48
    .extern ActorDescriptor_GetPrimaryLabel
    .extern ActorDescriptor_GetComponent
    .extern ActorDescriptorComponent_GetCharacterResourceId
    .extern ActorDescriptorComponent_GetPaletteResourceId
    .extern ActorDescriptorComponent_GetCellResourceId
    .extern func_02071ee0
    .extern ActorDescriptorComponent_GetAnimation
    .extern gSystemState
    .extern data_020f4e18
    .global func_ov001_021fb87c
func_ov001_021fb87c: ; 0x021fb87c
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    movs r5, r1
    mov r6, r0
    mov r4, r2
    beq L_021fba90
    mov r1, #0x0
    bl func_ov001_021fb81c
    mov r0, r5
    bl ActorDescriptor_LoadDetailResource
    mov r1, r0
    ldr r0, [r6, #0x44]
    mov r2, #0x1
    bl TitleDialog_SetText
    ldr r0, [r6, #0x44]
    bl TitleDialog_ClearTextRect
    ldr r0, [r6, #0x44]
    mov r1, #0x0
    bl TitleDialog_UpdateTextPage
    ldr r0, L_021fbaa0
    mov r7, #0x58
    ldrb r0, [r0, #0x5f]
    ldr r1, [r6, #0x24]
    cmp r0, #0x0
    ldr r0, [r6, #0x0]
    subne r7, r7, #0x2
    bl GraphicsSpriteRenderer_SetFontResource
    str r7, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldr r0, [r6, #0x0]
    mov r1, #0x70
    mov r2, #0x4c
    mov r3, #0xe0
    bl GraphicsSpriteCanvas_FillRect
    mov r0, r5
    bl ActorDescriptor_GetSecondaryLabel
    mov r1, r0
    mov r0, #0xe
    str r0, [sp, #0x0]
    mov r0, #0x6
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, [r6, #0x0]
    mov r2, #0x70
    mov r3, #0x4c
    bl GraphicsSpriteRenderer_DrawText
    ldr r0, [r6, #0x4]
    add r1, r6, #0x8
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r7, r0
    mov r0, r5
    bl ActorDescriptor_GetPresentationAnimation
    mov r2, #0x1
    str r2, [sp, #0x0]
    mov r2, #0x0
    str r2, [sp, #0x4]
    mov r1, r0
    str r2, [sp, #0x8]
    mov r0, r7
    mov r2, #0x5c
    mov r3, #0x48
    bl func_02073e48
    ldr r0, [r6, #0x0]
    ldr r1, [r6, #0x28]
    bl GraphicsSpriteRenderer_SetFontResource
    mov r0, #0x48
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldr r0, [r6, #0x0]
    mov r1, #0x5c
    mov r2, #0x38
    mov r3, #0xcc
    bl GraphicsSpriteCanvas_FillRect
    mov r0, r5
    bl ActorDescriptor_GetPrimaryLabel
    mov r1, r0
    mov r0, #0xe
    str r0, [sp, #0x0]
    mov r0, #0x6
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, [r6, #0x0]
    mov r2, #0x5c
    mov r3, #0x38
    bl GraphicsSpriteRenderer_DrawText
    cmp r4, #0x0
    beq L_021fba98
    mov r0, r5
    mov r1, #0x0
    bl ActorDescriptor_GetComponent
    bl ActorDescriptorComponent_GetCharacterResourceId
    mov r7, r0
    mov r0, r5
    mov r1, #0x0
    bl ActorDescriptor_GetComponent
    bl ActorDescriptorComponent_GetPaletteResourceId
    mov r4, r0
    mov r0, r5
    mov r1, #0x0
    bl ActorDescriptor_GetComponent
    bl ActorDescriptorComponent_GetCellResourceId
    mov r2, r7
    mov r3, r4
    str r0, [sp, #0x0]
    add r0, r6, #0x14
    ldr r1, L_021fbaa4
    ldr r1, [r1, #0x0]
    bl func_02071ee0
    ldr r0, [r6, #0x4]
    add r1, r6, #0x14
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r4, r0
    mov r0, r5
    mov r1, #0x0
    bl ActorDescriptor_GetComponent
    bl ActorDescriptorComponent_GetAnimation
    mov r1, r0
    mov r0, r4
    mov r2, #0x1
    str r2, [sp, #0x0]
    mov r2, #0x0
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    mov r2, #0x48
    mov r3, r2
    bl func_02073e48
    b L_021fba98
L_021fba90:
    mov r1, #0x1
    bl func_ov001_021fb81c
L_021fba98:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
L_021fbaa0: .word gSystemState
L_021fbaa4: .word data_020f4e18
    .size func_ov001_021fb87c, .-func_ov001_021fb87c
