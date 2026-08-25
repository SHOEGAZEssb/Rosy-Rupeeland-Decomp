    .text
/* Exact fallback; see src/overlays/ov021/overlay021_state_entry.c. */
    .extern data_020f4e14
    .extern data_ov021_02202d28
    .extern data_ov021_02202e50
    .extern gDebugFont
    .extern gGameWork
    .extern gGamePhaseCurrencyHud
    .extern GameWork_ClearFlag
    .extern GameWork_TestFlag
    .extern GamePhaseCurrencyHud_SetVisible
    .extern GraphicsSpriteRenderer_SetFontResource
    .extern GraphicsSpriteRenderer_ClearTextBuffer
    .extern RecordDescriptor_GetMessage
    .extern SpriteMotionController_Hide
    .extern Overlay021_SetTransition
    .extern Overlay021_UpdateScene
    .extern Overlay021_Dialog_ShowMessage
    .extern func_ov045_0220c128
    .extern func_ov045_0220c9e8
    .extern Overlay045_DrawSelectorPreview

.global func_ov021_021ff6b8
func_ov021_021ff6b8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    bne L_021ff804
    ldr r0, L_021ff814
    ldr r1, L_021ff818
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne L_021ff6f4
    ldr r0, [r4, #0x54]
    mov r1, #0x0
    bl func_ov045_0220c9e8
    str r0, [r4, #0x2d0]
L_021ff6f4:
    ldr r0, L_021ff81c
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, L_021ff820
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    add r0, r4, #0xa0
    bl SpriteMotionController_Hide
    ldr r0, L_021ff824
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_SetVisible
    ldr r0, [r4, #0x3e4]
    cmp r0, #0x0
    blt L_021ff790
    mov r1, #0x0
    str r1, [r4, #0x2c4]
    add r0, r4, r1, lsl #0x2
    ldr r3, [r0, #0x2a4]
    mov r0, #0xc
    str r3, [r4, #0x2c0]
    ldr r2, [r4, #0x3e4]
    mul r0, r2, r0
    ldr r2, [r3, #0x4c]
    ldr r0, [r2, r0]
    str r0, [r4, #0x2bc]
    bl RecordDescriptor_GetMessage
    ldrh r2, [r0, #0x0]
    ldr r1, L_021ff828
    cmp r2, r1
    bne L_021ff77c
    ldrh r1, [r0, #0x2]
    ldr r0, [r4, #0x38c]
    bl func_ov045_0220c128
L_021ff77c:
    ldr r1, L_021ff82c
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
    b L_021ff7f4
L_021ff790:
    ldr r0, L_021ff814
    ldr r1, L_021ff818
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_021ff7d8
    ldr r0, L_021ff814
    ldr r1, L_021ff818
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, L_021ff820
    ldr r1, [r4, #0x58]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_SetFontResource
    ldr r0, [r4, #0x54]
    mov r1, #0x0
    bl Overlay045_DrawSelectorPreview
    b L_021ff7e4
L_021ff7d8:
    mov r0, r4
    mov r1, #0x0
    bl Overlay021_Dialog_ShowMessage
L_021ff7e4:
    ldr r1, L_021ff830
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
L_021ff7f4:
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x20]
L_021ff804:
    mov r0, r4
    bl Overlay021_UpdateScene
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021ff814: .word gGameWork
L_021ff818: .word 0x3b2
L_021ff81c: .word data_020f4e14
L_021ff820: .word gDebugFont
L_021ff824: .word gGamePhaseCurrencyHud
L_021ff828: .word 0xee0e
L_021ff82c: .word data_ov021_02202e50
L_021ff830: .word data_ov021_02202d28
    .size func_ov021_021ff6b8, . - func_ov021_021ff6b8
