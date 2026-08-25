.text

/* Exact fallback; see src/overlays/ov028/overlay028_detail_state.c. */
.extern data_ov028_021ff218
.extern DisplayBrightness_IsMainTransitionComplete
.extern SceneSound_PlayPackedEffect
.extern GraphicsSpriteState_TestTouchPoint
.extern DisplayBrightness_StartMaskedTransitions
.extern IndexedSelectionController_ConfigureRange
.extern IndexedSelectionController_ResetTransition
.extern IndexedSelectionController_SnapTransitionOrigin
.extern IndexedSelectionController_IncrementWrap
.extern IndexedSelectionController_DecrementWrap
.extern IndexedSelectionController_GetLastDirection
.extern IndexedSelectionController_AdvanceTransition
.extern IndexedSelectionController_IsTransitionIdle
.extern IndexedSelectionController_AdvancePacing
.extern InventoryScroll_SetSelectedRow
.extern InventoryScroll_SetFirstVisibleRow
.extern InventoryScroll_UpdatePresentation
.extern PresentationScalar_SetImmediate
.extern PresentationScalar_TransitionTo
.extern SpritePresentation_Show
.extern SpritePresentation_Hide
.extern SpriteMotionController_BeginHitResponse
.extern SpriteMotionController_Show
.extern SpriteMotionController_Hide
.extern func_ov028_021fce28
.extern func_ov028_021fd274
.extern func_ov028_021fd2c4
.extern func_ov028_021fd2ec
.extern func_ov028_021fd34c
.extern func_ov028_021fd468
.extern func_ov028_021fd5c8
.extern func_ov028_021fd86c
.extern func_ov028_021fd8b8
.extern func_ov028_021fdad8
.extern func_ov028_021fe438
.extern func_ov028_021fe558
.extern func_ov028_021fe6bc


    .global func_ov028_021febd0
func_ov028_021febd0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0xc
    addls pc, pc, r0, lsl #0x2
    b L_021ff09c
L_021febe8: ; jump table
    b L_021fec1c ; case 0
    b L_021fec44 ; case 1
    b L_021fed0c ; case 2
    b L_021fed30 ; case 3
    b L_021fed4c ; case 4
    b L_021fef48 ; case 5
    b L_021ff09c ; case 6
    b L_021ff09c ; case 7
    b L_021ff09c ; case 8
    b L_021ff09c ; case 9
    b L_021fefb4 ; case 10
    b L_021fefd4 ; case 11
    b L_021ff080 ; case 12
L_021fec1c:
    mov r1, #0x0
    mov r0, #0x1
    str r1, [r4, #0x1f8]
    sub r1, r0, #0x11
    bl DisplayBrightness_StartMaskedTransitions
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021fec44:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_021ff09c
    ldr r0, [r4, #0x220]
    bl func_ov028_021fd2c4
    ldr r0, [r4, #0x220]
    bl func_ov028_021fd34c
    ldr r2, [r4, #0x8c]
    add r0, r4, #0x98
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    bl SpriteMotionController_Hide
    mov r0, #0x1d
    str r0, [r4, #0x48]
    ldr r0, [r4, #0x220]
    ldr r1, [r0, #0x44]
    ldr r5, [r1, #0x14]
    bl func_ov028_021fd5c8
    ldr r1, [r0, #0x0]
    ldr r0, [r4, #0x224]
    mov r2, r5
    bl func_ov028_021fd8b8
    ldr r3, [r4, #0x220]
    add r0, r4, #0x228
    ldr r2, [r3, #0x3c]
    ldr r3, [r3, #0x44]
    mov r1, #0x0
    ldr r3, [r3, #0x14]
    sub r2, r2, #0x1
    bl IndexedSelectionController_ConfigureRange
    ldr r0, [r4, #0x220]
    ldr r0, [r0, #0x40]
    cmp r0, #0x1
    ble L_021fece0
    ldr r0, [r4, #0x1f0]
    bl SpritePresentation_Show
    ldr r0, [r4, #0x1f4]
    bl SpritePresentation_Show
L_021fece0:
    add r0, r4, #0x280
    bl func_ov028_021fce28
    mov r0, #0x1
    mov r1, #0x0
    bl DisplayBrightness_StartMaskedTransitions
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ff09c
L_021fed0c:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_021ff09c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ff09c
L_021fed30:
    add r0, r4, #0x228
    bl IndexedSelectionController_ResetTransition
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021fed4c:
    add r0, r4, #0x228
    bl IndexedSelectionController_SnapTransitionOrigin
    ldr r0, [r4, #0x2c]
    ldrh r0, [r0, #0x0]
    tst r0, #0x20
    beq L_021fed70
    add r0, r4, #0x228
    bl IndexedSelectionController_DecrementWrap
    b L_021fee8c
L_021fed70:
    tst r0, #0x10
    beq L_021fed84
    add r0, r4, #0x228
    bl IndexedSelectionController_IncrementWrap
    b L_021fee8c
L_021fed84:
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    beq L_021fee8c
    ldr r0, [r4, #0x1f0]
    add r1, r4, #0x30
    ldr r0, [r0, #0x9c]
    bl GraphicsSpriteState_TestTouchPoint
    cmp r0, #0x0
    ldrne r0, [r4, #0x1f8]
    cmpne r0, #0x0
    beq L_021fedc0
    add r0, r4, #0x228
    bl IndexedSelectionController_DecrementWrap
    b L_021fee8c
L_021fedc0:
    ldr r0, [r4, #0x1f4]
    add r1, r4, #0x30
    ldr r0, [r0, #0x9c]
    bl GraphicsSpriteState_TestTouchPoint
    cmp r0, #0x0
    ldrne r0, [r4, #0x1f8]
    cmpne r0, #0x0
    beq L_021fedec
    add r0, r4, #0x228
    bl IndexedSelectionController_IncrementWrap
    b L_021fee8c
L_021fedec:
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_021fee8c
    ldr r0, [r4, #0x1f0]
    add r1, r4, #0x30
    ldr r0, [r0, #0x9c]
    bl GraphicsSpriteState_TestTouchPoint
    cmp r0, #0x0
    beq L_021fee28
    add r0, r4, #0x228
    bl IndexedSelectionController_DecrementWrap
    mov r0, #0x1
    str r0, [r4, #0x1f8]
    b L_021fee8c
L_021fee28:
    ldr r0, [r4, #0x1f4]
    add r1, r4, #0x30
    ldr r0, [r0, #0x9c]
    bl GraphicsSpriteState_TestTouchPoint
    cmp r0, #0x0
    beq L_021fee54
    add r0, r4, #0x228
    bl IndexedSelectionController_IncrementWrap
    mov r0, #0x1
    str r0, [r4, #0x1f8]
    b L_021fee8c
L_021fee54:
    add r0, r4, #0x144
    add r1, r4, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl SpriteMotionController_BeginHitResponse
    cmp r0, #0x0
    beq L_021fee8c
    mov r0, r4
    mov r1, #0x3
    bl SceneSound_PlayPackedEffect
    mov r0, #0xa
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
L_021fee8c:
    add r0, r4, #0x228
    bl IndexedSelectionController_AdvanceTransition
    cmp r0, #0x0
    beq L_021fef30
    add r0, r4, #0x228
    bl IndexedSelectionController_GetLastDirection
    cmp r0, #0x0
    beq L_021feed8
    ldr r0, [r4, #0x1f4]
    mov r1, #0xf4000
    add r0, r0, #0xc
    bl PresentationScalar_SetImmediate
    ldr r0, [r4, #0x1f4]
    mov r1, #0x1
    add r0, r0, #0xc
    mov r2, #0xf0000
    bl PresentationScalar_TransitionTo
    ldr r1, [r4, #0x1f4]
    b L_021fef00
L_021feed8:
    ldr r0, [r4, #0x1f0]
    mov r1, #0xc000
    add r0, r0, #0xc
    bl PresentationScalar_SetImmediate
    ldr r0, [r4, #0x1f0]
    mov r1, #0x1
    add r0, r0, #0xc
    mov r2, #0x10000
    bl PresentationScalar_TransitionTo
    ldr r1, [r4, #0x1f0]
L_021fef00:
    mov r0, #0x4
    str r0, [r1, #0x7c]
    mov r0, #0x0
    str r0, [r1, #0x80]
    mov r0, r4
    mov r1, #0x0
    bl SceneSound_PlayPackedEffect
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021fef30:
    add r0, r4, #0x228
    bl IndexedSelectionController_IsTransitionIdle
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r4, #0x1f8]
    b L_021ff09c
L_021fef48:
    add r0, r4, #0x228
    bl IndexedSelectionController_AdvancePacing
    cmp r0, #0x0
    beq L_021fef70
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ff09c
L_021fef70:
    ldr r0, [r4, #0x24c]
    ldr r1, [r4, #0x250]
    add r0, r0, r0, lsr #0x1f
    cmp r1, r0, asr #0x1
    bne L_021ff09c
    ldr r2, [r4, #0x234]
    mov r0, #0xc
    mul r1, r2, r0
    ldr r3, [r4, #0x220]
    ldr r0, [r4, #0x224]
    ldr r3, [r3, #0x38]
    ldr r1, [r3, r1]
    bl func_ov028_021fd8b8
    ldr r1, [r4, #0x234]
    mov r0, r4
    bl func_ov028_021fe558
    b L_021ff09c
L_021fefb4:
    mov r0, #0x1
    sub r1, r0, #0x11
    bl DisplayBrightness_StartMaskedTransitions
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021fefd4:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_021ff09c
    ldr r0, [r4, #0x1f0]
    bl SpritePresentation_Hide
    ldr r0, [r4, #0x1f4]
    bl SpritePresentation_Hide
    ldr r0, [r4, #0x224]
    bl func_ov028_021fd86c
    ldr r0, [r4, #0x220]
    ldr r1, [r4, #0x234]
    ldr r0, [r0, #0x44]
    bl InventoryScroll_SetFirstVisibleRow
    ldr r0, [r4, #0x220]
    ldr r1, [r4, #0x234]
    ldr r0, [r0, #0x44]
    bl InventoryScroll_SetSelectedRow
    ldr r0, [r4, #0x220]
    ldr r0, [r0, #0x44]
    bl InventoryScroll_UpdatePresentation
    ldr r0, [r4, #0x220]
    bl func_ov028_021fd2ec
    ldr r0, [r4, #0x220]
    bl func_ov028_021fd274
    ldr r0, [r4, #0x220]
    bl func_ov028_021fd468
    mov r0, r4
    bl func_ov028_021fe6bc
    add r0, r4, #0x98
    bl SpriteMotionController_Show
    add r0, r4, #0x280
    bl func_ov028_021fce28
    mov r0, #0x1e
    str r0, [r4, #0x48]
    mov r0, #0x1
    mov r1, #0x0
    bl DisplayBrightness_StartMaskedTransitions
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ff09c
L_021ff080:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_021ff09c
    ldr r1, L_021ff0ac
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov028_021fdad8
L_021ff09c:
    mov r0, r4
    bl func_ov028_021fe438
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_021ff0ac: .word data_ov028_021ff218
.size func_ov028_021febd0, .-func_ov028_021febd0
