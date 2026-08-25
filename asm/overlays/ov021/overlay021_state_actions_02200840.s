    .text
/* Exact fallback; see src/overlays/ov021/overlay021_state_actions.c. */
    .extern data_020f4e14
    .extern data_ov021_02202e98
    .extern DisplayBrightness_IsMainTransitionComplete
    .extern GraphicsSpriteRenderer_ClearTextBuffer
    .extern SceneSound_PlayPackedEffect
    .extern DisplayBrightness_StartMaskedTransitions
    .extern func_ov002_021fbdc0
    .extern Overlay002_UpdateFooterAnimation
    .extern func_ov002_021fbe60
    .extern Overlay021_Descriptor_GetCategory
    .extern Overlay021_List_Hide
    .extern Overlay021_SetTransition
    .extern Overlay021_SetupAlternateMainBackground
    .extern Overlay021_ResetSceneSprites
    .extern Overlay021_DestroyPrimaryPanel
    .extern Overlay021_DestroySecondaryPanel
    .extern Overlay021_CreateAuxiliaryPanel
    .extern Overlay021_UpdateScene
    .extern Overlay021_Dialog_ShowMessage
    .extern Overlay021_Dialog_UpdatePrompt
    .extern Overlay021Descriptor_GetFlags16_19

.global Overlay021_UpdateAuxiliaryAction
Overlay021_UpdateAuxiliaryAction:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Overlay021_Dialog_UpdatePrompt
    ldr r0, [r4, #0x4]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_022009c4
L_0220085c: ; jump table
    b L_0220086c ; case 0
    b L_0220087c ; case 1
    b L_022008f4 ; case 2
    b L_02200970 ; case 3
L_0220086c:
    add r0, r0, #0x1
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
L_0220087c:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_022009c4
    ldr r0, [r4, #0x354]
    cmp r0, #0x0
    beq L_022008a0
    mov r0, r4
    bl Overlay021_DestroyPrimaryPanel
    b L_022008c0
L_022008a0:
    ldr r0, [r4, #0x358]
    cmp r0, #0x0
    beq L_022008b8
    mov r0, r4
    bl Overlay021_DestroySecondaryPanel
    b L_022008c0
L_022008b8:
    ldr r0, [r4, #0x2c0]
    bl Overlay021_List_Hide
L_022008c0:
    mov r0, r4
    bl Overlay021_ResetSceneSprites
    ldr r0, L_022009d4
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    mov r0, r4
    bl Overlay021_CreateAuxiliaryPanel
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_022009c4
L_022008f4:
    mov r0, r4
    bl Overlay021_SetupAlternateMainBackground
    ldr r0, [r4, #0x3e0]
    cmp r0, #0x0
    bne L_02200944
    ldr r0, [r4, #0x2bc]
    bl Overlay021_Descriptor_GetCategory
    cmp r0, #0x1
    bne L_02200928
    mov r0, r4
    mov r1, #0x4
    bl Overlay021_Dialog_ShowMessage
    b L_02200944
L_02200928:
    ldr r0, [r4, #0x2bc]
    bl Overlay021Descriptor_GetFlags16_19
    cmp r0, #0x1
    bne L_02200944
    mov r0, r4
    mov r1, #0x5
    bl Overlay021_Dialog_ShowMessage
L_02200944:
    mov r0, #0x1
    mov r1, #0x0
    bl DisplayBrightness_StartMaskedTransitions
    ldr r0, [r4, #0x390]
    bl func_ov002_021fbdc0
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_022009c4
L_02200970:
    ldr r0, [r4, #0x390]
    bl Overlay002_UpdateFooterAnimation
    cmp r0, #0x0
    beq L_022009b4
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_022009b4
    ldr r1, L_022009d8
    mov r0, r4
    bl SceneSound_PlayPackedEffect
    mov r0, #0x0
    ldr r1, L_022009dc
    str r0, [r4, #0x3fc]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
    b L_022009c4
L_022009b4:
    ldr r0, [r4, #0x390]
    bl func_ov002_021fbe60
    rsb r0, r0, #0x0
    str r0, [r4, #0x3fc]
L_022009c4:
    mov r0, r4
    bl Overlay021_UpdateScene
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_022009d4: .word data_020f4e14
L_022009d8: .word 0x3c84
L_022009dc: .word data_ov021_02202e98
    .size Overlay021_UpdateAuxiliaryAction, . - Overlay021_UpdateAuxiliaryAction

