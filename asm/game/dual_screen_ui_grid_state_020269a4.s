; Matching retail form; see src/game/dual_screen_ui_grid_state.c.
.text
.extern Type7Actor_GetStateCode

    .global DualScreenUiGridState_IsRuntimeEligible
    .type DualScreenUiGridState_IsRuntimeEligible, @function
DualScreenUiGridState_IsRuntimeEligible: ; 0x020269a4
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x29c]
    mov r4, #0x0
    ldrh r1, [r1, #0x38]
    mov r2, r4
    mov r1, r1, lsl #0x1a
    movs r1, r1, lsr #0x1f
    beq .L_020269dc
    ldr r1, [r0, #0x268]
    tst r1, #0x10
    movne r1, #0x1
    moveq r1, r4
    cmp r1, #0x0
    movne r2, #0x1
.L_020269dc:
    cmp r2, #0x0
    beq .L_020269f0
    bl Type7Actor_GetStateCode
    cmp r0, #0x5
    movne r4, #0x1
.L_020269f0:
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size DualScreenUiGridState_IsRuntimeEligible, . - DualScreenUiGridState_IsRuntimeEligible
