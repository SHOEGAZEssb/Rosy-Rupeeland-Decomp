.text

/* Exact fallback; see src/overlays/ov022/overlay022_state_machines.c. */
.extern data_020d782e
.extern data_ov022_022004f0
.extern DisplayBrightness_IsMainTransitionComplete
.extern DisplayBrightness_IsSubTransitionComplete
.extern GamePhaseCurrencyHud_GetCurrency
.extern GamePhaseCurrencyHud_AddCurrency
.extern func_02092260
.extern func_020922f0
.extern func_02092c8c
.extern TitleDialog_ClearTextRect
.extern IndexedSelectionController_ResetTransition
.extern IndexedSelectionController_SnapTransitionOrigin
.extern IndexedSelectionController_Increment
.extern IndexedSelectionController_AdvanceTransition
.extern IndexedSelectionController_AdvancePacing
.extern func_ov022_021fcfd4
.extern func_ov022_021fd068
.extern func_ov022_021fdd1c
.extern func_ov022_021fe544
.extern func_ov022_021fe688
.extern func_ov022_021fe81c
.extern func_ov022_021fe920
.extern func_ov022_021fe94c
.extern func_ov022_021fe9e8
.extern func_ov022_021feac8
.extern func_ov022_021feb78
.extern func_ov022_021fed74
.extern func_ov022_021fef48
.extern func_ov022_021ff0d0
.extern func_ov022_021ff368
.extern gLupyContext


    .global func_ov022_021ffa1c
func_ov022_021ffa1c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x354]
    bl func_ov022_021fd068
    ldr r0, [r4, #0x4]
    cmp r0, #0x14
    addls pc, pc, r0, lsl #0x2
    b L_021ffd70
L_021ffa3c: ; jump table
    b L_021ffa90 ; case 0
    b L_021ffac0 ; case 1
    b L_021ffaf0 ; case 2
    b L_021ffb54 ; case 3
    b L_021ffbc4 ; case 4
    b L_021ffbfc ; case 5
    b L_021ffc84 ; case 6
    b L_021ffcfc ; case 7
    b L_021ffd70 ; case 8
    b L_021ffd70 ; case 9
    b L_021ffd70 ; case 10
    b L_021ffd70 ; case 11
    b L_021ffd70 ; case 12
    b L_021ffd70 ; case 13
    b L_021ffd70 ; case 14
    b L_021ffd70 ; case 15
    b L_021ffd70 ; case 16
    b L_021ffd70 ; case 17
    b L_021ffd70 ; case 18
    b L_021ffd70 ; case 19
    b L_021ffd20 ; case 20
L_021ffa90:
    mov r0, #0x2
    sub r1, r0, #0xa
    bl func_02092c8c
    mov r0, r4
    bl func_ov022_021fe94c
    ldr r0, [r4, #0x2b4]
    bl IndexedSelectionController_ResetTransition
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021ffac0:
    bl DisplayBrightness_IsSubTransitionComplete
    cmp r0, #0x0
    beq L_021ffd70
    mov r0, r4
    mov r1, #0x30
    bl func_02092260
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ffd70
L_021ffaf0:
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    cmp r0, #0x3c
    ble L_021ffb48
    mov r0, #0x2
    mov r1, #0x0
    bl func_02092c8c
    mov r0, #0x1
    sub r1, r0, #0x9
    bl func_02092c8c
    mov r0, r4
    mov r1, #0x9d
    bl func_020922f0
    mov r0, r4
    bl func_ov022_021feac8
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ffd70
L_021ffb48:
    mov r0, r4
    bl func_ov022_021fe9e8
    b L_021ffd70
L_021ffb54:
    mov r0, r4
    bl func_ov022_021ff368
    cmp r0, #0x0
    beq L_021ffbb8
    ldr r0, L_021ffd80
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_GetCurrency
    ldr r2, [r4, #0x360]
    mov r1, r0
    ldrh r2, [r2, #0x18]
    ldr r0, [r4, #0x354]
    mov r3, #0x0
    bl func_ov022_021fcfd4
    ldr r1, [r4, #0x360]
    ldr r3, L_021ffd80
    mov r2, r0
    ldrh r1, [r1, #0x18]
    ldr r0, [r3, #0x0]
    bl GamePhaseCurrencyHud_AddCurrency
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ffd70
L_021ffbb8:
    mov r0, r4
    bl func_ov022_021fe9e8
    b L_021ffd70
L_021ffbc4:
    ldr r0, [r4, #0x354]
    ldr r0, [r0, #0x54]
    cmp r0, #0x0
    mov r0, r4
    bne L_021ffbf4
    bl func_ov022_021feb78
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ffd70
L_021ffbf4:
    bl func_ov022_021fe9e8
    b L_021ffd70
L_021ffbfc:
    mov r0, r4
    bl func_ov022_021ff368
    cmp r0, #0x0
    beq L_021ffd70
    ldr r0, [r4, #0x2ac]
    cmp r0, #0x0
    beq L_021ffc6c
    ldr r0, L_021ffd80
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_GetCurrency
    ldr r2, [r4, #0x358]
    mov r1, #0x34
    mul r3, r2, r1
    ldr r2, L_021ffd84
    mov r1, r0
    ldrh r2, [r2, r3]
    ldr r0, [r4, #0x354]
    mov r3, #0x0
    bl func_ov022_021fcfd4
    ldr r2, [r4, #0x358]
    mov r1, #0x34
    mul ip, r2, r1
    ldr r1, L_021ffd84
    ldr r3, L_021ffd80
    mov r2, r0
    ldrh r1, [r1, ip]
    ldr r0, [r3, #0x0]
    bl GamePhaseCurrencyHud_AddCurrency
L_021ffc6c:
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ffd70
L_021ffc84:
    ldr r0, [r4, #0x354]
    ldr r0, [r0, #0x54]
    cmp r0, #0x0
    bne L_021ffd70
    ldr r0, [r4, #0x2cc]
    bl TitleDialog_ClearTextRect
    ldr r0, [r4, #0x2b4]
    bl IndexedSelectionController_SnapTransitionOrigin
    ldr r0, [r4, #0x2b4]
    bl IndexedSelectionController_Increment
    ldr r0, [r4, #0x2b4]
    bl IndexedSelectionController_AdvanceTransition
    cmp r0, #0x0
    mov r0, #0x1
    beq L_021ffce0
    mov r1, #0x0
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021ffd70
L_021ffce0:
    sub r1, r0, #0x11
    bl func_02092c8c
    mov r0, #0x14
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b L_021ffd70
L_021ffcfc:
    ldr r0, [r4, #0x2b4]
    bl IndexedSelectionController_AdvancePacing
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r4, #0x4]
    strne r0, [r4, #0x8]
    mov r0, r4
    bl func_ov022_021fed74
    b L_021ffd70
L_021ffd20:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_021ffd70
    mov r0, r4
    bl func_ov022_021fe920
    mov r0, r4
    bl func_ov022_021fe81c
    mov r0, r4
    bl func_ov022_021fe688
    mov r0, r4
    bl func_ov022_021fef48
    mov r0, r4
    bl func_ov022_021fe544
    mov r0, #0x1
    mov r1, #0x0
    bl func_02092c8c
    mov r0, r4
    ldr r1, L_021ffd88
    ldmia r1, {r1, r2}
    bl func_ov022_021fdd1c
L_021ffd70:
    mov r0, r4
    bl func_ov022_021ff0d0
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021ffd80: .word gLupyContext
L_021ffd84: .word data_020d782e
L_021ffd88: .word data_ov022_022004f0
.size func_ov022_021ffa1c, .-func_ov022_021ffa1c

