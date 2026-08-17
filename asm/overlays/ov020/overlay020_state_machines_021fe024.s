    .text
/* Exact fallback; see src/overlays/ov020/overlay020_state_machines.c. */
    .extern data_ov020_021fe468
    .extern data_ov020_021fe470
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
    .extern func_ov020_021fd280
    .extern func_ov020_021fd81c
    .extern func_ov020_021fde6c
    .extern func_ov020_021fde9c
    .extern func_ov020_021fdee0
    .extern func_ov020_021fdf08

.global func_ov020_021fe024
func_ov020_021fe024:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldr r1, [r5, #0x1dc]
    ldr r0, [r5, #0x4]
    ldr r4, [r1, #0x44]
    cmp r0, #0x0
    beq L_021fe054
    cmp r0, #0x1
    beq L_021fe070
    cmp r0, #0x2
    beq L_021fe0bc
    b L_021fe28c
L_021fe054:
    mov r0, r4
    bl InventoryScroll_ResetPresentationState
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
L_021fe070:
    mov r0, r4
    bl InventoryScroll_UpdateInterpolation
    cmp r0, #0x0
    beq L_021fe0a0
    mov r0, r5
    bl func_ov020_021fdee0
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_021fe0bc
L_021fe0a0:
    ldr r0, [r5, #0x1dc]
    bl func_ov020_021fd280
    cmp r0, #0x0
    beq L_021fe28c
    mov r0, r5
    bl func_ov020_021fde9c
    b L_021fe28c
L_021fe0bc:
    mov r0, r4
    bl InventoryScroll_SaveOrigins
    ldr r0, [r5, #0x2c]
    ldrh r0, [r0, #0x0]
    tst r0, #0x40
    beq L_021fe0e0
    mov r0, r4
    bl InventoryScroll_MoveSelectionUp
    b L_021fe25c
L_021fe0e0:
    tst r0, #0x80
    beq L_021fe0f4
    mov r0, r4
    bl InventoryScroll_MoveSelectionDown
    b L_021fe25c
L_021fe0f4:
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    beq L_021fe25c
    mov r0, r5
    bl func_ov020_021fdf08
    mov r6, r0
    mov r0, r4
    add r1, r5, #0x30
    bl InventoryScroll_TestUpperArrowHold
    cmp r0, #0x0
    mov r0, r4
    beq L_021fe130
    bl InventoryScroll_PageUp
    b L_021fe25c
L_021fe130:
    add r1, r5, #0x30
    bl InventoryScroll_TestLowerArrowHold
    cmp r0, #0x0
    beq L_021fe14c
    mov r0, r4
    bl InventoryScroll_PageDown
    b L_021fe25c
L_021fe14c:
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_021fe25c
    mov r0, r4
    add r1, r5, #0x30
    bl InventoryScroll_TestUpperArrowPress
    cmp r0, #0x0
    mov r0, r4
    beq L_021fe190
    bl InventoryScroll_PageUp
    cmp r0, #0x0
    bne L_021fe25c
    mov r0, r5
    mov r1, #0x16
    bl func_02092260
    b L_021fe25c
L_021fe190:
    add r1, r5, #0x30
    bl InventoryScroll_TestLowerArrowPress
    cmp r0, #0x0
    mov r0, r4
    beq L_021fe1c0
    bl InventoryScroll_PageDown
    cmp r0, #0x0
    bne L_021fe25c
    mov r0, r5
    mov r1, #0x16
    bl func_02092260
    b L_021fe25c
L_021fe1c0:
    add r1, r5, #0x30
    bl InventoryScroll_TestMarkerHit
    cmp r0, #0x0
    beq L_021fe1e4
    ldr r1, L_021fe29c
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov020_021fd81c
    b L_021fe28c
L_021fe1e4:
    cmp r6, #0x0
    blt L_021fe224
    ldr r0, [r4, #0x14]
    cmp r6, r0
    beq L_021fe25c
    mov r0, r5
    mov r1, #0x0
    bl func_02092260
    mov r0, r4
    mov r1, r6
    bl InventoryScroll_SetSelectedRow
    mov r0, r5
    bl func_ov020_021fde9c
    mov r0, r5
    bl func_ov020_021fdee0
    b L_021fe25c
L_021fe224:
    add r0, r5, #0x70
    add r1, r5, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl func_02095860
    cmp r0, #0x0
    beq L_021fe25c
    mov r0, r5
    mov r1, #0x3
    bl func_02092260
    ldr r1, L_021fe2a0
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov020_021fd81c
L_021fe25c:
    mov r0, r4
    bl InventoryScroll_UpdateSelectionMovement
    cmp r0, #0x0
    beq L_021fe28c
    mov r0, r5
    mov r1, #0x0
    bl func_02092260
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
L_021fe28c:
    mov r0, r5
    bl func_ov020_021fde6c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
L_021fe29c: .word data_ov020_021fe470
L_021fe2a0: .word data_ov020_021fe468
    .size func_ov020_021fe024, . - func_ov020_021fe024

