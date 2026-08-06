; Matching retail form; see src/game/dual_screen_ui_grid_state.c.
.text

    .global func_020264b0
    .type func_020264b0, @function
func_020264b0: ; 0x020264b0
    str r1, [r0, #0x0]
    ldr r1, [sp, #0x0]
    stmib r0, {r2, r3}
    str r1, [r0, #0xc]
    bx lr
    .size func_020264b0, . - func_020264b0
