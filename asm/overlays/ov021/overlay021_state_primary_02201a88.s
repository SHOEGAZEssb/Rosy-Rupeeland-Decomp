    .text
/* Exact fallback; see src/overlays/ov021/overlay021_state_primary.c. */
    .extern data_020f4e14
    .extern data_ov021_02202dd0
    .extern DisplayBrightness_IsMainTransitionComplete
    .extern GraphicsSpriteRenderer_ClearTextBuffer
    .extern DisplayBrightness_StartMaskedTransitions
    .extern SpriteMotionController_Hide
    .extern Overlay021_SetTransition
    .extern Overlay021_RefreshSelectionBackground
    .extern Overlay021_CreateSecondaryPanel
    .extern Overlay021_UpdateScene
    .extern Overlay021_SelectList
    .extern Overlay021_Dialog_ShowMessage
    .extern Overlay021_Dialog_UpdatePrompt
    .extern GameWork_ClearFlag
    .extern gGameWork

.global Overlay021_UpdateSecondaryInfoEntry
Overlay021_UpdateSecondaryInfoEntry:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Overlay021_Dialog_UpdatePrompt
    ldr r0, [r4, #0x4]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_02201b88
L_02201aa4: ; jump table
    b L_02201ab4 ; case 0
    b L_02201ae8 ; case 1
    b L_02201b34 ; case 2
    b L_02201b6c ; case 3
L_02201ab4:
    ldr r0, L_02201b98
    ldr r1, L_02201b9c
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, L_02201b98
    mov r1, #0x388
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_02201ae8:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02201b88
    add r0, r4, #0xa0
    bl SpriteMotionController_Hide
    ldr r1, [r4, #0x2c4]
    mov r0, r4
    bl Overlay021_SelectList
    ldr r0, L_02201ba0
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    mov r0, r4
    bl Overlay021_CreateSecondaryPanel
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02201b88
L_02201b34:
    mov r0, r4
    bl Overlay021_RefreshSelectionBackground
    mov r0, r4
    mov r1, #0x2
    bl Overlay021_Dialog_ShowMessage
    mov r0, #0x1
    mov r1, #0x0
    bl DisplayBrightness_StartMaskedTransitions
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02201b88
L_02201b6c:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02201b88
    ldr r1, L_02201ba4
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
L_02201b88:
    mov r0, r4
    bl Overlay021_UpdateScene
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_02201b98: .word gGameWork
L_02201b9c: .word 0x387
L_02201ba0: .word data_020f4e14
L_02201ba4: .word data_ov021_02202dd0
.size Overlay021_UpdateSecondaryInfoEntry, . - Overlay021_UpdateSecondaryInfoEntry
