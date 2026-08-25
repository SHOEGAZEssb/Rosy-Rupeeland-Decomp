; Matching retail form; see src/game/dual_screen_ui_grid_state.c.
.text

    .global GridMotion_ResetWithVelocity
    .type GridMotion_ResetWithVelocity, @function
GridMotion_ResetWithVelocity: ; 0x02026990
    str r1, [r0, #0x4]
    mov r1, #0x0
    str r1, [r0, #0x0]
    str r1, [r0, #0x8]
    bx lr
    .size GridMotion_ResetWithVelocity, . - GridMotion_ResetWithVelocity
