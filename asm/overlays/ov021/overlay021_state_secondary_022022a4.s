    .text
/* Exact fallback; see src/overlays/ov021/overlay021_state_secondary.c. */
    .extern data_020f4e14
    .extern data_ov021_02202d78
    .extern data_ov021_02202d80
    .extern DisplayBrightness_IsMainTransitionComplete
    .extern GraphicsSpriteRenderer_ClearTextBuffer
    .extern DisplayBrightness_StartMaskedTransitions
    .extern Overlay021_SetTransition
    .extern Overlay021_SetupPrimarySelectionBackground
    .extern Overlay021_RefreshSelectionBackground
    .extern Overlay021_CreatePrimaryPanel
    .extern Overlay021_DestroyPrimaryPanel
    .extern Overlay021_CreateSecondaryPanel
    .extern Overlay021_DestroySecondaryPanel
    .extern Overlay021_UpdateScene
    .extern Overlay021_Dialog_ShowMessage
    .extern Overlay021_Dialog_UpdatePrompt

.global Overlay021_UpdateCategoryPanelReopen
Overlay021_UpdateCategoryPanelReopen:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Overlay021_Dialog_UpdatePrompt
    ldr r0, [r4, #0x4]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_022023d4
L_022022c0: ; jump table
    b L_022022d0 ; case 0
    b L_022022f0 ; case 1
    b L_0220234c ; case 2
    b L_02202398 ; case 3
L_022022d0:
    mov r0, #0x1
    sub r1, r0, #0x11
    bl DisplayBrightness_StartMaskedTransitions
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_022022f0:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_022023d4
    ldr r0, L_022023e4
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, [r4, #0x354]
    cmp r0, #0x0
    mov r0, r4
    beq L_02202328
    bl Overlay021_DestroyPrimaryPanel
    mov r0, r4
    bl Overlay021_CreateSecondaryPanel
    b L_02202334
L_02202328:
    bl Overlay021_DestroySecondaryPanel
    mov r0, r4
    bl Overlay021_CreatePrimaryPanel
L_02202334:
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_022023d4
L_0220234c:
    ldr r0, [r4, #0x354]
    cmp r0, #0x0
    mov r0, r4
    beq L_02202364
    bl Overlay021_SetupPrimarySelectionBackground
    b L_02202368
L_02202364:
    bl Overlay021_RefreshSelectionBackground
L_02202368:
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
    b L_022023d4
L_02202398:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_022023d4
    ldr r0, [r4, #0x354]
    cmp r0, #0x0
    beq L_022023c4
    ldr r1, L_022023e8
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
    b L_022023d4
L_022023c4:
    ldr r1, L_022023ec
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
L_022023d4:
    mov r0, r4
    bl Overlay021_UpdateScene
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_022023e4: .word data_020f4e14
L_022023e8: .word data_ov021_02202d80
L_022023ec: .word data_ov021_02202d78
.size Overlay021_UpdateCategoryPanelReopen, . - Overlay021_UpdateCategoryPanelReopen
