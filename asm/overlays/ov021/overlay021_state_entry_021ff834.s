    .text
/* Exact fallback; see src/overlays/ov021/overlay021_state_entry.c. */
    .extern data_020f4e14
    .extern data_021f5128
    .extern data_021f5ed0
    .extern data_ov021_02202f30
    .extern data_ov021_02202f38
    .extern DisplayBrightness_IsMainTransitionComplete
    .extern GraphicsSpriteRenderer_ClearTextBuffer
    .extern RecordCategory_PublishById
    .extern RecordDescriptor_GetMessage
    .extern TitlePalette_SetMainBackdrop
    .extern DisplayBrightness_StartMaskedTransitions
    .extern TitleDialog_UpdateTextPage
    .extern TitleDialog_ClearTextRect
    .extern Overlay021_SetTransition
    .extern Overlay021_CreateLists
    .extern Overlay021_DestroyListsAndSavePositions
    .extern Overlay021_RefreshListButtonAnimations
    .extern Overlay021_UpdateScene
    .extern Overlay021_Dialog_ShowContent
    .extern Overlay021_Dialog_UpdatePrompt
    .extern Overlay021_Descriptor_HasFlag29
    .extern func_ov045_0220c028

.global func_ov021_021ff834
func_ov021_021ff834:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b L_021ff9e8
L_021ff850: ; jump table
    b L_021ff864 ; case 0
    b L_021ff884 ; case 1
    b L_021ff8e8 ; case 2
    b L_021ff94c ; case 3
    b L_021ff98c ; case 4
L_021ff864:
    mov r0, #0x1
    sub r1, r0, #0x9
    bl DisplayBrightness_StartMaskedTransitions
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021ff884:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_021ff9e8
    ldr r0, [r4, #0x2bc]
    mov r1, #0x0
    bl RecordDescriptor_GetMessage
    mov r1, r0
    mov r0, r4
    bl Overlay021_Dialog_ShowContent
    ldr r0, [r4, #0x388]
    ldr r1, L_021ff9fc
    bl TitleDialog_UpdateTextPage
    mov r1, r0, lsl #0x16
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    movs r0, r1, asr #0x1f
    bne L_021ff8d0
    ldr r0, [r4, #0x38c]
    bl func_ov045_0220c028
L_021ff8d0:
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ff9e8
L_021ff8e8:
    bl Overlay021_Dialog_UpdatePrompt
    cmp r0, #0x0
    beq L_021ff9e8
    mov r0, #0x1
    sub r1, r0, #0x11
    bl DisplayBrightness_StartMaskedTransitions
    ldr r0, [r4, #0x2bc]
    bl Overlay021_Descriptor_HasFlag29
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r4, #0x3d8]
    ldr r1, [r4, #0x2bc]
    ldr r0, L_021ffa00
    ldr r1, [r1, #0x4]
    ldr r2, [r0, #0x0]
    ldr r0, [r4, #0x54]
    ldrh r1, [r1, #0x0]
    ldr r0, [r2, r0, lsl #0x2]
    bl RecordCategory_PublishById
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ff9e8
L_021ff94c:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_021ff9e8
    ldr r0, [r4, #0x388]
    bl TitleDialog_ClearTextRect
    ldr r0, L_021ffa04
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    mov r0, r4
    bl Overlay021_DestroyListsAndSavePositions
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ff9e8
L_021ff98c:
    bl Overlay021_CreateLists
    mov r0, r4
    bl Overlay021_RefreshListButtonAnimations
    ldr r0, [r4, #0x3d8]
    cmp r0, #0x0
    beq L_021ff9c4
    mov r0, #0x0
    str r0, [r4, #0x48]
    bl TitlePalette_SetMainBackdrop
    ldr r1, L_021ffa08
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
    b L_021ff9e8
L_021ff9c4:
    mov r0, #0x1
    mov r1, #0x0
    bl DisplayBrightness_StartMaskedTransitions
    mvn r0, #0x0
    ldr r1, L_021ffa0c
    str r0, [r4, #0x3e4]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
L_021ff9e8:
    mov r0, r4
    bl Overlay021_UpdateScene
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
L_021ff9fc: .word data_021f5ed0
L_021ffa00: .word data_021f5128
L_021ffa04: .word data_020f4e14
L_021ffa08: .word data_ov021_02202f38
L_021ffa0c: .word data_ov021_02202f30
    .size func_ov021_021ff834, . - func_ov021_021ff834
