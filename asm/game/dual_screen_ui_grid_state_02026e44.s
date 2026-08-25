; Matching retail form; see src/game/dual_screen_ui_grid_state.c.
.text
.extern data_020c3704
.extern GraphicsSpriteState_SetAnimationIndex

    .global DualScreenUiGridState_RefreshTransitionFrames
    .type DualScreenUiGridState_RefreshTransitionFrames, @function
DualScreenUiGridState_RefreshTransitionFrames: ; 0x02026e44
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r9, r0
    ldrsh r7, [r9, #0x78]
    mov r8, #0x0
    ldr r4, .L_02026ed0
    mov r5, r8
    mov r6, #0x3
.L_02026e60:
    mov r2, r7
    cmp r7, #0x3
    movgt r2, r6
    bgt .L_02026e78
    cmp r7, #0x0
    movlt r2, r5
.L_02026e78:
    add r1, r9, r8
    ldrb r0, [r1, #0x90]
    cmp r2, r0
    strneb r2, [r1, #0x90]
    add r0, r9, r8, lsl #0x2
    addne r2, r2, #0x4
    ldr r0, [r0, #0x14]
    ldrb r1, [r4, r2]
    ldrb r2, [r0, #0x38]
    cmp r1, r2
    beq .L_02026ebc
    bl GraphicsSpriteState_SetAnimationIndex
    add r0, r9, r8, lsl #0x2
    ldr r1, [r0, #0x14]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
.L_02026ebc:
    add r8, r8, #0x1
    cmp r8, #0x14
    sub r7, r7, #0x3
    blt .L_02026e60
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02026ed0: .word data_020c3704
    .size DualScreenUiGridState_RefreshTransitionFrames, . - DualScreenUiGridState_RefreshTransitionFrames
