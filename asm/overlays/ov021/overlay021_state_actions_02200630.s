    .text
/* Exact fallback; see src/overlays/ov021/overlay021_state_actions.c. */
    .extern data_020f4e14
    .extern data_ov021_02202ea0
    .extern data_ov021_02202ea8
    .extern data_ov021_02202eb0
    .extern data_ov021_02202eb8
    .extern data_ov021_02202ec0
    .extern DisplayBrightness_IsMainTransitionComplete
    .extern GraphicsSpriteRenderer_ClearTextBuffer
    .extern TitlePalette_SetMainBackdrop
    .extern DisplayBrightness_StartMaskedTransitions
    .extern Overlay021_List_Show
    .extern Overlay021_List_RenderVisibleRows
    .extern Overlay021_List_UpdateSelectionDisplay
    .extern Overlay021_SetTransition
    .extern Overlay021_SetupMainBackground
    .extern Overlay021_CreateLists
    .extern Overlay021_DestroyListsAndSavePositions
    .extern Overlay021_RefreshListButtonAnimations
    .extern Overlay021_ShowListMarker
    .extern Overlay021_UpdateScene

.global func_ov021_02200630
func_ov021_02200630:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b L_02200818
L_02200648: ; jump table
    b L_02200658 ; case 0
    b L_02200668 ; case 1
    b L_022006a0 ; case 2
    b L_022007fc ; case 3
L_02200658:
    add r0, r1, #0x1
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
L_02200668:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02200818
    ldr r0, L_02200828
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    mov r0, r4
    bl Overlay021_DestroyListsAndSavePositions
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02200818
L_022006a0:
    bl Overlay021_CreateLists
    mov r0, r4
    bl Overlay021_RefreshListButtonAnimations
    ldr r0, [r4, #0x3d8]
    cmp r0, #0x0
    beq L_022006d8
    mov r0, #0x0
    str r0, [r4, #0x48]
    bl TitlePalette_SetMainBackdrop
    ldr r1, L_0220082c
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
    b L_02200818
L_022006d8:
    ldr r0, [r4, #0x2c4]
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x2a4]
    cmp r0, #0x0
    ldr r0, [r4, #0x37c]
    bne L_02200760
    cmp r0, #0x0
    ldreq r0, [r4, #0x380]
    cmpeq r0, #0x0
    beq L_02200714
    mov r0, r4
    bl Overlay021_SetupMainBackground
    mov r0, #0x0
    str r0, [r4, #0x37c]
    str r0, [r4, #0x380]
L_02200714:
    ldr r1, [r4, #0x48]
    mov r0, #0x1
    bic r1, r1, #0x2
    str r1, [r4, #0x48]
    ldr r3, [r4, #0x98]
    mov r1, #0x0
    ldrh r2, [r3, #0x24]
    orr r2, r2, #0x4
    strh r2, [r3, #0x24]
    ldr r3, [r4, #0x9c]
    ldrh r2, [r3, #0x24]
    orr r2, r2, #0x4
    strh r2, [r3, #0x24]
    bl DisplayBrightness_StartMaskedTransitions
    ldr r1, L_02200830
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
    b L_02200818
L_02200760:
    cmp r0, #0x0
    beq L_02200784
    mov r0, #0x0
    ldr r1, L_02200834
    str r0, [r4, #0x37c]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
    b L_02200818
L_02200784:
    ldr r0, [r4, #0x380]
    cmp r0, #0x0
    beq L_022007ac
    mov r0, #0x0
    ldr r1, L_02200838
    str r0, [r4, #0x380]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
    b L_02200818
L_022007ac:
    mov r0, #0x1
    mov r1, #0x0
    bl DisplayBrightness_StartMaskedTransitions
    ldr r0, [r4, #0x2c4]
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x2a4]
    str r0, [r4, #0x2c0]
    bl Overlay021_List_Show
    ldr r0, [r4, #0x2c0]
    bl Overlay021_List_RenderVisibleRows
    ldr r0, [r4, #0x2c0]
    bl Overlay021_List_UpdateSelectionDisplay
    mov r0, r4
    bl Overlay021_ShowListMarker
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02200818
L_022007fc:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_02200818
    ldr r1, L_0220083c
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
L_02200818:
    mov r0, r4
    bl Overlay021_UpdateScene
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_02200828: .word data_020f4e14
L_0220082c: .word data_ov021_02202ec0
L_02200830: .word data_ov021_02202eb8
L_02200834: .word data_ov021_02202eb0
L_02200838: .word data_ov021_02202ea8
L_0220083c: .word data_ov021_02202ea0
    .size func_ov021_02200630, . - func_ov021_02200630

