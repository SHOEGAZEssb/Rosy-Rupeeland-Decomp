.text

/* Exact fallback; see src/overlays/ov023/overlay023_state_machines.c. */
.extern data_ov023_021ffb30
.extern data_ov023_021ffb38
.extern data_ov023_021ffb58
.extern func_02092260
.extern IndexedSelectionController_SnapTransitionOrigin
.extern IndexedSelectionController_IncrementWrap
.extern IndexedSelectionController_DecrementWrap
.extern IndexedSelectionController_GetLastDirection
.extern IndexedSelectionController_AdvanceTransition
.extern IndexedSelectionController_AdvancePacing
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
.extern PresentationScalar_SetImmediate
.extern PresentationScalar_TransitionTo
.extern func_02095860
.extern func_ov023_021fd730
.extern func_ov023_021fd780
.extern func_ov023_021fd7a8
.extern func_ov023_021fd8e4
.extern func_ov023_021fd968
.extern func_ov023_021fd9d0
.extern func_ov023_021fe694
.extern func_ov023_021fe6bc
.extern func_ov023_021fe6e4
.extern func_ov023_021fe77c
.extern func_ov023_021fe994
.extern func_ov023_021fea34
.extern func_ov023_021fef54
.extern func_ov023_021ff2a0


    .global func_ov023_021ff2fc
func_ov023_021ff2fc:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldr r0, [r5, #0x478]
    ldr r1, [r5, #0x4]
    ldr r4, [r0, #0x48]
    cmp r1, #0xa
    bgt L_021ff350
    cmp r1, #0x0
    addge pc, pc, r1, lsl #0x2
    b L_021ff7bc
L_021ff324: ; jump table
    b L_021ff35c ; case 0
    b L_021ff38c ; case 1
    b L_021ff3d0 ; case 2
    b L_021ff6f8 ; case 3
    b L_021ff7bc ; case 4
    b L_021ff7bc ; case 5
    b L_021ff7bc ; case 6
    b L_021ff7bc ; case 7
    b L_021ff7bc ; case 8
    b L_021ff7bc ; case 9
    b L_021ff74c ; case 10
L_021ff350:
    cmp r1, #0x14
    beq L_021ff7a0
    b L_021ff7bc
L_021ff35c:
    bl func_ov023_021fd7a8
    ldr r0, [r5, #0x478]
    bl func_ov023_021fd730
    mov r0, r5
    bl func_ov023_021fe6e4
    mov r0, r4
    bl InventoryScroll_ResetPresentationState
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
L_021ff38c:
    mov r0, r4
    bl InventoryScroll_UpdateInterpolation
    cmp r0, #0x0
    beq L_021ff3b4
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_021ff3d0
L_021ff3b4:
    ldr r0, [r5, #0x478]
    bl func_ov023_021fd968
    cmp r0, #0x0
    beq L_021ff7bc
    mov r0, r5
    bl func_ov023_021fe6e4
    b L_021ff7bc
L_021ff3d0:
    mov r0, r4
    bl InventoryScroll_SaveOrigins
    add r0, r5, #0x480
    bl IndexedSelectionController_SnapTransitionOrigin
    ldr r0, [r5, #0x2c]
    ldrh r0, [r0, #0x0]
    tst r0, #0x40
    beq L_021ff3fc
    mov r0, r4
    bl InventoryScroll_MoveSelectionUp
    b L_021ff61c
L_021ff3fc:
    tst r0, #0x80
    beq L_021ff410
    mov r0, r4
    bl InventoryScroll_MoveSelectionDown
    b L_021ff61c
L_021ff410:
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    beq L_021ff61c
    ldr r0, [r5, #0x478]
    add r1, r5, #0x30
    bl func_ov023_021fd8e4
    mov r6, r0
    mov r0, r4
    add r1, r5, #0x30
    bl InventoryScroll_TestUpperArrowHold
    cmp r0, #0x0
    mov r0, r4
    beq L_021ff450
    bl InventoryScroll_PageUp
    b L_021ff61c
L_021ff450:
    add r1, r5, #0x30
    bl InventoryScroll_TestLowerArrowHold
    cmp r0, #0x0
    beq L_021ff46c
    mov r0, r4
    bl InventoryScroll_PageDown
    b L_021ff61c
L_021ff46c:
    mov r0, r5
    bl func_ov023_021fe694
    cmp r0, #0x0
    beq L_021ff488
    add r0, r5, #0x480
    bl IndexedSelectionController_IncrementWrap
    b L_021ff61c
L_021ff488:
    mov r0, r5
    bl func_ov023_021fe6bc
    cmp r0, #0x0
    beq L_021ff4a4
    add r0, r5, #0x480
    bl IndexedSelectionController_DecrementWrap
    b L_021ff61c
L_021ff4a4:
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_021ff61c
    mov r0, r4
    add r1, r5, #0x30
    bl InventoryScroll_TestUpperArrowPress
    cmp r0, #0x0
    mov r0, r4
    beq L_021ff4e8
    bl InventoryScroll_PageUp
    cmp r0, #0x0
    bne L_021ff61c
    mov r0, r5
    mov r1, #0x16
    bl func_02092260
    b L_021ff61c
L_021ff4e8:
    add r1, r5, #0x30
    bl InventoryScroll_TestLowerArrowPress
    cmp r0, #0x0
    mov r0, r4
    beq L_021ff518
    bl InventoryScroll_PageDown
    cmp r0, #0x0
    bne L_021ff61c
    mov r0, r5
    mov r1, #0x16
    bl func_02092260
    b L_021ff61c
L_021ff518:
    add r1, r5, #0x30
    bl InventoryScroll_TestMarkerHit
    cmp r0, #0x0
    beq L_021ff53c
    ldr r1, L_021ff7cc
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov023_021fd9d0
    b L_021ff7bc
L_021ff53c:
    cmp r6, #0x0
    blt L_021ff58c
    ldr r0, [r4, #0x14]
    cmp r6, r0
    mov r0, r5
    beq L_021ff584
    mov r1, #0x0
    bl func_02092260
    mov r0, r4
    mov r1, r6
    bl InventoryScroll_SetSelectedRow
    mov r0, r5
    bl func_ov023_021fe6e4
    mov r0, #0x14
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0x8]
    b L_021ff7bc
L_021ff584:
    bl func_ov023_021ff2a0
    b L_021ff7bc
L_021ff58c:
    add r0, r5, #0xd0
    add r1, r5, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl func_02095860
    cmp r0, #0x0
    beq L_021ff5b4
    mov r0, r5
    bl func_ov023_021ff2a0
    b L_021ff7bc
L_021ff5b4:
    add r0, r5, #0x17c
    add r1, r5, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl func_02095860
    cmp r0, #0x0
    mov r0, r5
    beq L_021ff5f0
    mov r1, #0x3
    bl func_02092260
    ldr r1, L_021ff7d0
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov023_021fd9d0
    b L_021ff61c
L_021ff5f0:
    bl func_ov023_021fea34
    str r0, [r5, #0x38c]
    cmp r0, #0x0
    bne L_021ff61c
    mov r0, r5
    mov r1, #0xb
    bl func_02092260
    mov r0, #0xa
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0x8]
L_021ff61c:
    mov r0, r4
    bl InventoryScroll_UpdateSelectionMovement
    cmp r0, #0x0
    beq L_021ff650
    mov r0, r5
    mov r1, #0x0
    bl func_02092260
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_021ff7bc
L_021ff650:
    add r0, r5, #0x480
    bl IndexedSelectionController_AdvanceTransition
    cmp r0, #0x0
    beq L_021ff7bc
    mov r0, r5
    mov r1, #0x0
    bl func_02092260
    add r0, r5, #0x480
    bl IndexedSelectionController_GetLastDirection
    cmp r0, #0x0
    beq L_021ff6a8
    ldr r0, [r5, #0x380]
    mov r1, #0x12000
    add r0, r0, #0x1c
    bl PresentationScalar_SetImmediate
    ldr r0, [r5, #0x380]
    mov r1, #0x1
    add r0, r0, #0x1c
    mov r2, #0x16000
    bl PresentationScalar_TransitionTo
    ldr r1, [r5, #0x380]
    b L_021ff6d0
L_021ff6a8:
    ldr r0, [r5, #0x384]
    mov r1, #0x4e000
    add r0, r0, #0x1c
    bl PresentationScalar_SetImmediate
    ldr r0, [r5, #0x384]
    mov r1, #0x1
    add r0, r0, #0x1c
    mov r2, #0x4a000
    bl PresentationScalar_TransitionTo
    ldr r1, [r5, #0x384]
L_021ff6d0:
    mov r0, #0x4
    str r0, [r1, #0x7c]
    mov r0, #0x0
    str r0, [r1, #0x80]
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_021ff7bc
L_021ff6f8:
    add r0, r5, #0x480
    bl IndexedSelectionController_AdvancePacing
    cmp r0, #0x0
    beq L_021ff7bc
    ldr r0, [r5, #0x478]
    bl func_ov023_021fd780
    ldr r0, [r5, #0x48c]
    add r0, r5, r0, lsl #0x2
    ldr r0, [r0, #0x430]
    str r0, [r5, #0x478]
    bl func_ov023_021fd730
    ldr r0, [r5, #0x478]
    bl func_ov023_021fd7a8
    mov r0, r5
    bl func_ov023_021fe6e4
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_021ff7bc
L_021ff74c:
    ldr r1, [r5, #0x38c]
    add r2, r5, #0x228
    mov r0, #0xac
    mla r0, r1, r0, r2
    bl func_ov023_021fef54
    cmp r0, #0x0
    beq L_021ff7bc
    ldr r0, [r5, #0x478]
    bl func_ov023_021fd780
    mov r0, #0x0
    str r0, [r5, #0x478]
    ldr r1, [r5, #0x38c]
    mov r0, r5
    bl func_ov023_021fe994
    mov r0, r5
    bl func_ov023_021fe6e4
    ldr r1, L_021ff7d4
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov023_021fd9d0
    b L_021ff7bc
L_021ff7a0:
    ldr r0, [r5, #0x8]
    add r0, r0, #0x1
    str r0, [r5, #0x8]
    cmp r0, #0x8
    movgt r0, #0x0
    strgt r0, [r5, #0x4]
    strgt r0, [r5, #0x8]
L_021ff7bc:
    mov r0, r5
    bl func_ov023_021fe77c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
L_021ff7cc: .word data_ov023_021ffb38
L_021ff7d0: .word data_ov023_021ffb58
L_021ff7d4: .word data_ov023_021ffb30
.size func_ov023_021ff2fc, .-func_ov023_021ff2fc

