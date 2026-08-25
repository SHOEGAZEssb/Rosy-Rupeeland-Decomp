.text

/* Exact fallback; see src/overlays/ov028/overlay028_interactive_state.c. */
.extern data_ov028_021ff220
.extern data_ov028_021ff248
.extern data_ov028_021ff258
.extern data_ov028_021ff260
.extern func_02092260
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
.extern func_ov028_021fd558
.extern func_ov028_021fd5e0
.extern func_ov028_021fdad8
.extern func_ov028_021fe438
.extern func_ov028_021fe6bc


    .global func_ov028_021fe77c
func_ov028_021fe77c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldr r1, [r5, #0x220]
    ldr r0, [r5, #0x4]
    ldr r4, [r1, #0x44]
    cmp r0, #0x2
    bgt L_021fe7b8
    cmp r0, #0x0
    blt L_021fea78
    beq L_021fe7c4
    cmp r0, #0x1
    beq L_021fe7e0
    cmp r0, #0x2
    beq L_021fe824
    b L_021fea78
L_021fe7b8:
    cmp r0, #0xa
    beq L_021fea5c
    b L_021fea78
L_021fe7c4:
    mov r0, r4
    bl InventoryScroll_ResetPresentationState
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
L_021fe7e0:
    mov r0, r4
    bl InventoryScroll_UpdateInterpolation
    cmp r0, #0x0
    beq L_021fe808
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_021fe824
L_021fe808:
    ldr r0, [r5, #0x220]
    bl func_ov028_021fd5e0
    cmp r0, #0x0
    beq L_021fea78
    mov r0, r5
    bl func_ov028_021fe6bc
    b L_021fea78
L_021fe824:
    mov r0, r4
    bl InventoryScroll_SaveOrigins
    ldr r0, [r5, #0x2c]
    ldrh r0, [r0, #0x0]
    tst r0, #0x40
    beq L_021fe848
    mov r0, r4
    bl InventoryScroll_MoveSelectionUp
    b L_021fea28
L_021fe848:
    tst r0, #0x80
    beq L_021fe85c
    mov r0, r4
    bl InventoryScroll_MoveSelectionDown
    b L_021fea28
L_021fe85c:
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    beq L_021fea28
    ldr r0, [r5, #0x220]
    add r1, r5, #0x30
    bl func_ov028_021fd558
    mov r6, r0
    mov r0, r4
    add r1, r5, #0x30
    bl InventoryScroll_TestUpperArrowHold
    cmp r0, #0x0
    mov r0, r4
    beq L_021fe89c
    bl InventoryScroll_PageUp
    b L_021fea28
L_021fe89c:
    add r1, r5, #0x30
    bl InventoryScroll_TestLowerArrowHold
    cmp r0, #0x0
    beq L_021fe8b8
    mov r0, r4
    bl InventoryScroll_PageDown
    b L_021fea28
L_021fe8b8:
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_021fea28
    mov r0, r4
    add r1, r5, #0x30
    bl InventoryScroll_TestUpperArrowPress
    cmp r0, #0x0
    mov r0, r4
    beq L_021fe8fc
    bl InventoryScroll_PageUp
    cmp r0, #0x0
    bne L_021fea28
    mov r0, r5
    mov r1, #0x16
    bl func_02092260
    b L_021fea28
L_021fe8fc:
    add r1, r5, #0x30
    bl InventoryScroll_TestLowerArrowPress
    cmp r0, #0x0
    mov r0, r4
    beq L_021fe92c
    bl InventoryScroll_PageDown
    cmp r0, #0x0
    bne L_021fea28
    mov r0, r5
    mov r1, #0x16
    bl func_02092260
    b L_021fea28
L_021fe92c:
    add r1, r5, #0x30
    bl InventoryScroll_TestMarkerHit
    cmp r0, #0x0
    beq L_021fe950
    ldr r1, L_021fea88
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov028_021fdad8
    b L_021fea78
L_021fe950:
    cmp r6, #0x0
    blt L_021fe9b4
    ldr r0, [r4, #0x14]
    cmp r6, r0
    mov r0, r5
    beq L_021fe998
    mov r1, #0x0
    bl func_02092260
    mov r0, r4
    mov r1, r6
    bl InventoryScroll_SetSelectedRow
    mov r0, r5
    bl func_ov028_021fe6bc
    mov r0, #0xa
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0x8]
    b L_021fea28
L_021fe998:
    mov r1, #0x2
    bl func_02092260
    ldr r1, L_021fea8c
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov028_021fdad8
    b L_021fea28
L_021fe9b4:
    add r0, r5, #0x98
    add r1, r5, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl SpriteMotionController_BeginHitResponse
    cmp r0, #0x0
    beq L_021fe9f0
    mov r0, r5
    mov r1, #0x2
    bl func_02092260
    ldr r1, L_021fea90
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov028_021fdad8
    b L_021fea28
L_021fe9f0:
    add r0, r5, #0x144
    add r1, r5, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl SpriteMotionController_BeginHitResponse
    cmp r0, #0x0
    beq L_021fea28
    mov r0, r5
    mov r1, #0x3
    bl func_02092260
    ldr r1, L_021fea94
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov028_021fdad8
L_021fea28:
    mov r0, r4
    bl InventoryScroll_UpdateSelectionMovement
    cmp r0, #0x0
    beq L_021fea78
    mov r0, r5
    mov r1, #0x0
    bl func_02092260
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_021fea78
L_021fea5c:
    ldr r0, [r5, #0x8]
    add r0, r0, #0x1
    str r0, [r5, #0x8]
    cmp r0, #0x8
    movgt r0, #0x0
    strgt r0, [r5, #0x4]
    strgt r0, [r5, #0x8]
L_021fea78:
    mov r0, r5
    bl func_ov028_021fe438
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
L_021fea88: .word data_ov028_021ff260
L_021fea8c: .word data_ov028_021ff258
L_021fea90: .word data_ov028_021ff220
L_021fea94: .word data_ov028_021ff248
.size func_ov028_021fe77c, .-func_ov028_021fe77c
