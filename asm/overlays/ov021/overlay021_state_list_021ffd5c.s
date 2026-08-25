    .text
/* Exact fallback; see src/overlays/ov021/overlay021_state_list.c. */
    .extern data_020f4e14
    .extern data_ov021_02202ef0
    .extern data_ov021_02202ef8
    .extern DisplayBrightness_IsMainTransitionComplete
    .extern GraphicsSpriteRenderer_ClearTextBuffer
    .extern SceneSound_PlayPackedEffect
    .extern DisplayBrightness_StartMaskedTransitions
    .extern TitleDialog_ClearTextRect
    .extern InventoryScroll_SetSelectedRow
    .extern InventoryScroll_SaveOrigins
    .extern InventoryScroll_MoveSelectionUp
    .extern InventoryScroll_MoveSelectionDown
    .extern InventoryScroll_PageUp
    .extern InventoryScroll_PageDown
    .extern InventoryScroll_UpdateInterpolation
    .extern InventoryScroll_TestUpperArrowPress
    .extern InventoryScroll_TestLowerArrowPress
    .extern InventoryScroll_TestUpperArrowHold
    .extern InventoryScroll_TestLowerArrowHold
    .extern InventoryScroll_TestMarkerHit
    .extern InventoryScroll_UpdateSelectionMovement
    .extern InventoryScroll_ResetPresentationState
    .extern SpriteMotionController_BeginHitResponse
    .extern Overlay021_List_Hide
    .extern Overlay021_List_UpdateSelectionDisplay
    .extern Overlay021_List_HitTestRow
    .extern Overlay021_List_UpdateVisibleRows
    .extern Overlay021_SetTransition
    .extern Overlay021_ShowListMarker
    .extern Overlay021_UpdateScene
    .extern Overlay021_Dialog_UpdatePrompt
    .extern Overlay021_BeginSelectedAction

.global func_ov021_021ffd5c
func_ov021_021ffd5c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldr r1, [r5, #0x2c0]
    ldr r4, [r1, #0x58]
    bl Overlay021_Dialog_UpdatePrompt
    ldr r0, [r5, #0x4]
    cmp r0, #0xa
    addls pc, pc, r0, lsl #0x2
    b L_022000d4
L_021ffd80: ; jump table
    b L_021ffdac ; case 0
    b L_021ffdc8 ; case 1
    b L_021ffe0c ; case 2
    b L_02200044 ; case 3
    b L_022000d4 ; case 4
    b L_022000d4 ; case 5
    b L_022000d4 ; case 6
    b L_022000d4 ; case 7
    b L_022000d4 ; case 8
    b L_022000d4 ; case 9
    b L_022000b8 ; case 10
L_021ffdac:
    mov r0, r4
    bl InventoryScroll_ResetPresentationState
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
L_021ffdc8:
    mov r0, r4
    bl InventoryScroll_UpdateInterpolation
    cmp r0, #0x0
    beq L_021ffdf0
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_021ffe0c
L_021ffdf0:
    ldr r0, [r5, #0x2c0]
    bl Overlay021_List_UpdateVisibleRows
    cmp r0, #0x0
    beq L_022000d4
    mov r0, r5
    bl Overlay021_ShowListMarker
    b L_022000d4
L_021ffe0c:
    mov r0, r4
    bl InventoryScroll_SaveOrigins
    ldr r0, [r5, #0x2c]
    ldrh r0, [r0, #0x0]
    tst r0, #0x40
    beq L_021ffe30
    mov r0, r4
    bl InventoryScroll_MoveSelectionUp
    b L_02200010
L_021ffe30:
    tst r0, #0x80
    beq L_021ffe44
    mov r0, r4
    bl InventoryScroll_MoveSelectionDown
    b L_02200010
L_021ffe44:
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    beq L_02200010
    ldr r0, [r5, #0x2c0]
    add r1, r5, #0x30
    bl Overlay021_List_HitTestRow
    mov r6, r0
    mov r0, r4
    add r1, r5, #0x30
    bl InventoryScroll_TestUpperArrowHold
    cmp r0, #0x0
    mov r0, r4
    beq L_021ffe84
    bl InventoryScroll_PageUp
    b L_02200010
L_021ffe84:
    add r1, r5, #0x30
    bl InventoryScroll_TestLowerArrowHold
    cmp r0, #0x0
    beq L_021ffea0
    mov r0, r4
    bl InventoryScroll_PageDown
    b L_02200010
L_021ffea0:
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_02200010
    mov r0, r4
    add r1, r5, #0x30
    bl InventoryScroll_TestUpperArrowPress
    cmp r0, #0x0
    mov r0, r4
    beq L_021ffee4
    bl InventoryScroll_PageUp
    cmp r0, #0x0
    bne L_02200010
    mov r0, r5
    mov r1, #0x16
    bl SceneSound_PlayPackedEffect
    b L_02200010
L_021ffee4:
    add r1, r5, #0x30
    bl InventoryScroll_TestLowerArrowPress
    cmp r0, #0x0
    mov r0, r4
    beq L_021fff14
    bl InventoryScroll_PageDown
    cmp r0, #0x0
    bne L_02200010
    mov r0, r5
    mov r1, #0x16
    bl SceneSound_PlayPackedEffect
    b L_02200010
L_021fff14:
    add r1, r5, #0x30
    bl InventoryScroll_TestMarkerHit
    cmp r0, #0x0
    beq L_021fff38
    ldr r1, L_022000e4
    mov r0, r5
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
    b L_022000d4
L_021fff38:
    cmp r6, #0x0
    blt L_021fff90
    ldr r0, [r4, #0x14]
    cmp r6, r0
    mov r0, r5
    beq L_021fff88
    mov r1, #0x0
    bl SceneSound_PlayPackedEffect
    mov r0, r4
    mov r1, r6
    bl InventoryScroll_SetSelectedRow
    ldr r0, [r5, #0x2c0]
    bl Overlay021_List_UpdateSelectionDisplay
    mov r0, r5
    bl Overlay021_ShowListMarker
    mov r0, #0xa
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0x8]
    b L_022000d4
L_021fff88:
    bl Overlay021_BeginSelectedAction
    b L_022000d4
L_021fff90:
    ldr r1, [r5, #0x2c4]
    add r2, r5, #0x14c
    mov r0, #0xac
    mla r0, r1, r0, r2
    add r1, r5, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl SpriteMotionController_BeginHitResponse
    cmp r0, #0x0
    beq L_021fffc4
    mov r0, r5
    bl Overlay021_BeginSelectedAction
    b L_022000d4
L_021fffc4:
    add r0, r5, #0xa0
    add r1, r5, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl SpriteMotionController_BeginHitResponse
    cmp r0, #0x0
    beq L_02200010
    mov r0, r5
    mov r1, #0x3
    bl SceneSound_PlayPackedEffect
    mov r0, #0x1
    sub r1, r0, #0x11
    bl DisplayBrightness_StartMaskedTransitions
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_022000d4
L_02200010:
    mov r0, r4
    bl InventoryScroll_UpdateSelectionMovement
    cmp r0, #0x0
    beq L_022000d4
    mov r0, r5
    mov r1, #0x0
    bl SceneSound_PlayPackedEffect
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_022000d4
L_02200044:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_022000d4
    ldr r0, [r5, #0x388]
    bl TitleDialog_ClearTextRect
    ldr r0, L_022000e8
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, [r5, #0x48]
    bic r0, r0, #0x2
    str r0, [r5, #0x48]
    ldr r1, [r5, #0x98]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r1, [r5, #0x9c]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r0, [r5, #0x2c0]
    bl Overlay021_List_Hide
    mov r0, #0x1
    mov r1, #0x0
    bl DisplayBrightness_StartMaskedTransitions
    ldr r1, L_022000ec
    mov r0, r5
    ldmia r1, {r1, r2}
    bl Overlay021_SetTransition
    b L_022000d4
L_022000b8:
    ldr r0, [r5, #0x8]
    add r0, r0, #0x1
    str r0, [r5, #0x8]
    cmp r0, #0x8
    movgt r0, #0x0
    strgt r0, [r5, #0x4]
    strgt r0, [r5, #0x8]
L_022000d4:
    mov r0, r5
    bl Overlay021_UpdateScene
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
L_022000e4: .word data_ov021_02202ef8
L_022000e8: .word data_020f4e14
L_022000ec: .word data_ov021_02202ef0
    .size func_ov021_021ffd5c, . - func_ov021_021ffd5c

