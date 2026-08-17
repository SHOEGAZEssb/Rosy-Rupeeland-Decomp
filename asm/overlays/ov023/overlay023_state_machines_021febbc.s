.text

/* Exact fallback; see src/overlays/ov023/overlay023_state_machines.c. */
.extern data_ov023_021ffb80
.extern data_ov023_021ffb88
.extern data_ov023_021ffb90
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
.extern func_02095860
.extern func_ov023_021fd08c
.extern func_ov023_021fd0dc
.extern func_ov023_021fd268
.extern func_ov023_021fd328
.extern func_ov023_021fd3b0
.extern func_ov023_021fd9d0
.extern func_ov023_021fe6e4
.extern func_ov023_021fe77c
.extern func_ov023_021fe994
.extern func_ov023_021fea34
.extern func_ov023_021fea88
.extern func_ov023_021feb60
.extern func_ov023_021fef54


    .global func_ov023_021febbc
func_ov023_021febbc:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldr r0, [r5, #0x390]
    ldr r1, [r5, #0x4]
    ldr r4, [r0, #0x38]
    cmp r1, #0xa
    bgt L_021fec04
    bge L_021feec4
    cmp r1, #0x2
    bgt L_021fef38
    cmp r1, #0x0
    blt L_021fef38
    beq L_021fec10
    cmp r1, #0x1
    beq L_021fec40
    cmp r1, #0x2
    beq L_021fec84
    b L_021fef38
L_021fec04:
    cmp r1, #0x14
    beq L_021fef1c
    b L_021fef38
L_021fec10:
    bl func_ov023_021fd268
    ldr r0, [r5, #0x390]
    bl func_ov023_021fd08c
    mov r0, r5
    bl func_ov023_021fe6e4
    mov r0, r4
    bl InventoryScroll_ResetPresentationState
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
L_021fec40:
    mov r0, r4
    bl InventoryScroll_UpdateInterpolation
    cmp r0, #0x0
    beq L_021fec68
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_021fec84
L_021fec68:
    ldr r0, [r5, #0x390]
    bl func_ov023_021fd3b0
    cmp r0, #0x0
    beq L_021fef38
    mov r0, r5
    bl func_ov023_021fe6e4
    b L_021fef38
L_021fec84:
    mov r0, r4
    bl InventoryScroll_SaveOrigins
    ldr r0, [r5, #0x2c]
    ldrh r0, [r0, #0x0]
    tst r0, #0x40
    beq L_021feca8
    mov r0, r4
    bl InventoryScroll_MoveSelectionUp
    b L_021fee90
L_021feca8:
    tst r0, #0x80
    beq L_021fecbc
    mov r0, r4
    bl InventoryScroll_MoveSelectionDown
    b L_021fee90
L_021fecbc:
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    beq L_021fee90
    ldr r0, [r5, #0x390]
    add r1, r5, #0x30
    bl func_ov023_021fd328
    mov r6, r0
    mov r0, r4
    add r1, r5, #0x30
    bl InventoryScroll_TestUpperArrowHold
    cmp r0, #0x0
    mov r0, r4
    beq L_021fecfc
    bl InventoryScroll_PageUp
    b L_021fee90
L_021fecfc:
    add r1, r5, #0x30
    bl InventoryScroll_TestLowerArrowHold
    cmp r0, #0x0
    beq L_021fed18
    mov r0, r4
    bl InventoryScroll_PageDown
    b L_021fee90
L_021fed18:
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_021fee90
    mov r0, r4
    add r1, r5, #0x30
    bl InventoryScroll_TestUpperArrowPress
    cmp r0, #0x0
    mov r0, r4
    beq L_021fed5c
    bl InventoryScroll_PageUp
    cmp r0, #0x0
    bne L_021fee90
    mov r0, r5
    mov r1, #0x16
    bl func_02092260
    b L_021fee90
L_021fed5c:
    add r1, r5, #0x30
    bl InventoryScroll_TestLowerArrowPress
    cmp r0, #0x0
    mov r0, r4
    beq L_021fed8c
    bl InventoryScroll_PageDown
    cmp r0, #0x0
    bne L_021fee90
    mov r0, r5
    mov r1, #0x16
    bl func_02092260
    b L_021fee90
L_021fed8c:
    add r1, r5, #0x30
    bl InventoryScroll_TestMarkerHit
    cmp r0, #0x0
    beq L_021fedb0
    ldr r1, L_021fef48
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov023_021fd9d0
    b L_021fef38
L_021fedb0:
    cmp r6, #0x0
    blt L_021fee00
    ldr r0, [r4, #0x14]
    cmp r6, r0
    mov r0, r5
    beq L_021fedf8
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
    b L_021fef38
L_021fedf8:
    bl func_ov023_021feb60
    b L_021fef38
L_021fee00:
    add r0, r5, #0xd0
    add r1, r5, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl func_02095860
    cmp r0, #0x0
    beq L_021fee28
    mov r0, r5
    bl func_ov023_021feb60
    b L_021fef38
L_021fee28:
    add r0, r5, #0x17c
    add r1, r5, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl func_02095860
    cmp r0, #0x0
    mov r0, r5
    beq L_021fee64
    mov r1, #0x3
    bl func_02092260
    ldr r1, L_021fef4c
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov023_021fd9d0
    b L_021fee90
L_021fee64:
    bl func_ov023_021fea34
    str r0, [r5, #0x38c]
    cmp r0, #0x1
    bne L_021fee90
    mov r0, r5
    mov r1, #0xb
    bl func_02092260
    mov r0, #0xa
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0x8]
L_021fee90:
    mov r0, r4
    bl InventoryScroll_UpdateSelectionMovement
    cmp r0, #0x0
    beq L_021fef38
    mov r0, r5
    mov r1, #0x0
    bl func_02092260
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_021fef38
L_021feec4:
    ldr r1, [r5, #0x38c]
    add r2, r5, #0x228
    mov r0, #0xac
    mla r0, r1, r0, r2
    bl func_ov023_021fef54
    cmp r0, #0x0
    beq L_021fef38
    ldr r0, [r5, #0x390]
    bl func_ov023_021fd0dc
    mov r0, r5
    bl func_ov023_021fea88
    str r0, [r5, #0x478]
    ldr r1, [r5, #0x38c]
    mov r0, r5
    bl func_ov023_021fe994
    mov r0, r5
    bl func_ov023_021fe6e4
    ldr r1, L_021fef50
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov023_021fd9d0
    b L_021fef38
L_021fef1c:
    ldr r0, [r5, #0x8]
    add r0, r0, #0x1
    str r0, [r5, #0x8]
    cmp r0, #0x8
    movgt r0, #0x0
    strgt r0, [r5, #0x4]
    strgt r0, [r5, #0x8]
L_021fef38:
    mov r0, r5
    bl func_ov023_021fe77c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
L_021fef48: .word data_ov023_021ffb90
L_021fef4c: .word data_ov023_021ffb88
L_021fef50: .word data_ov023_021ffb80
.size func_ov023_021febbc, .-func_ov023_021febbc

