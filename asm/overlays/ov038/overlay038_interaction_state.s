.text

/* Exact fallback; see src/overlays/ov038/overlay038_interaction_state.c for documented portable C. */

    .extern InventoryScroll_ResetPresentationState
    .extern InventoryScroll_UpdateInterpolation
    .extern func_ov038_021fd578
    .extern InventoryScroll_SaveOrigins
    .extern InventoryScroll_MoveSelectionUp
    .extern InventoryScroll_MoveSelectionDown
    .extern func_ov038_021fd670
    .extern InventoryScroll_TestUpperArrowHold
    .extern InventoryScroll_TestLowerArrowHold
    .extern InventoryScroll_TestUpperArrowPress
    .extern InventoryScroll_TestLowerArrowPress
    .extern InventoryScroll_TestMarkerHit
    .extern InventoryScroll_PageUp
    .extern InventoryScroll_PageDown
    .extern SceneSound_PlayPackedEffect
    .extern InventoryScroll_SetSelectedRow
    .extern func_ov038_021fd508
    .extern AreaInfoPanelPresentation_ShowIndex
    .extern func_ov046_0220c3bc
    .extern func_ov046_0220c410
    .extern func_ov046_0220c46c
    .extern func_ov038_021fd540
    .extern func_ov046_0220bffc
    .extern func_ov038_021fd624
    .extern SpriteMotionController_BeginHitResponse
    .extern InventoryScroll_UpdateSelectionMovement
    .extern func_ov038_021fce04
    .extern func_ov038_021fd37c
    .extern data_ov038_021fdca8
    .extern data_ov038_021fdcb8

    .global func_ov038_021fd7f8
func_ov038_021fd7f8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_021fd820
    cmp r0, #0x1
    beq L_021fd83c
    cmp r0, #0x2
    beq L_021fd870
    b L_021fdab4
L_021fd820:
    ldr r0, [r4, #0x314]
    bl InventoryScroll_ResetPresentationState
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021fd83c:
    ldr r0, [r4, #0x314]
    bl InventoryScroll_UpdateInterpolation
    cmp r0, #0x0
    beq L_021fd864
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fd870
L_021fd864:
    mov r0, r4
    bl func_ov038_021fd578
    b L_021fdab4
L_021fd870:
    ldr r0, [r4, #0x314]
    bl InventoryScroll_SaveOrigins
    ldr r0, [r4, #0x2c]
    ldrh r0, [r0, #0x0]
    tst r0, #0x40
    beq L_021fd894
    ldr r0, [r4, #0x314]
    bl InventoryScroll_MoveSelectionUp
    b L_021fda84
L_021fd894:
    tst r0, #0x80
    beq L_021fd8a8
    ldr r0, [r4, #0x314]
    bl InventoryScroll_MoveSelectionDown
    b L_021fda84
L_021fd8a8:
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    beq L_021fda84
    mov r0, r4
    bl func_ov038_021fd670
    mov r5, r0
    ldr r0, [r4, #0x314]
    add r1, r4, #0x30
    bl InventoryScroll_TestUpperArrowHold
    cmp r0, #0x0
    ldr r0, [r4, #0x314]
    beq L_021fd8e4
    bl InventoryScroll_PageUp
    b L_021fda84
L_021fd8e4:
    add r1, r4, #0x30
    bl InventoryScroll_TestLowerArrowHold
    cmp r0, #0x0
    beq L_021fd900
    ldr r0, [r4, #0x314]
    bl InventoryScroll_PageDown
    b L_021fda84
L_021fd900:
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_021fda84
    ldr r0, [r4, #0x314]
    add r1, r4, #0x30
    bl InventoryScroll_TestUpperArrowPress
    cmp r0, #0x0
    ldr r0, [r4, #0x314]
    beq L_021fd944
    bl InventoryScroll_PageUp
    cmp r0, #0x0
    bne L_021fda84
    mov r0, r4
    mov r1, #0x16
    bl SceneSound_PlayPackedEffect
    b L_021fda84
L_021fd944:
    add r1, r4, #0x30
    bl InventoryScroll_TestLowerArrowPress
    cmp r0, #0x0
    ldr r0, [r4, #0x314]
    beq L_021fd974
    bl InventoryScroll_PageDown
    cmp r0, #0x0
    bne L_021fda84
    mov r0, r4
    mov r1, #0x16
    bl SceneSound_PlayPackedEffect
    b L_021fda84
L_021fd974:
    add r1, r4, #0x30
    bl InventoryScroll_TestMarkerHit
    cmp r0, #0x0
    beq L_021fd998
    ldr r1, L_021fdac4
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov038_021fce04
    b L_021fdab4
L_021fd998:
    cmp r5, #0x0
    blt L_021fda4c
    ldr r0, [r4, #0x314]
    ldr r0, [r0, #0x14]
    cmp r5, r0
    beq L_021fda84
    mov r0, r4
    mov r1, #0x0
    bl SceneSound_PlayPackedEffect
    ldr r0, [r4, #0x314]
    mov r1, r5
    bl InventoryScroll_SetSelectedRow
    mov r0, r4
    bl func_ov038_021fd508
    mov r1, r0
    ldr r0, [r4, #0x344]
    bl AreaInfoPanelPresentation_ShowIndex
    mov r0, r4
    bl func_ov038_021fd508
    mov r1, r0
    ldr r0, [r4, #0x340]
    bl func_ov046_0220c3bc
    mov r5, r0
    mov r0, r4
    bl func_ov038_021fd508
    mov r1, r0
    ldr r0, [r4, #0x340]
    bl func_ov046_0220c410
    mov r1, r5
    mov r2, r0
    ldr r0, [r4, #0x340]
    bl func_ov046_0220c46c
    mov r0, r4
    bl func_ov038_021fd508
    mov r5, r0
    mov r0, r4
    bl func_ov038_021fd540
    mov r1, r5
    mov r3, r0
    ldr r0, [r4, #0x340]
    mov r2, #0x1
    bl func_ov046_0220bffc
    mov r0, r4
    bl func_ov038_021fd624
    b L_021fda84
L_021fda4c:
    add r0, r4, #0x64
    add r1, r4, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl SpriteMotionController_BeginHitResponse
    cmp r0, #0x0
    beq L_021fda84
    mov r0, r4
    mov r1, #0x3
    bl SceneSound_PlayPackedEffect
    ldr r1, L_021fdac8
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov038_021fce04
L_021fda84:
    ldr r0, [r4, #0x314]
    bl InventoryScroll_UpdateSelectionMovement
    cmp r0, #0x0
    beq L_021fdab4
    mov r0, r4
    mov r1, #0x0
    bl SceneSound_PlayPackedEffect
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021fdab4:
    mov r0, r4
    bl func_ov038_021fd37c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_021fdac4: .word data_ov038_021fdca8
L_021fdac8: .word data_ov038_021fdcb8
    .size func_ov038_021fd7f8, .-func_ov038_021fd7f8

