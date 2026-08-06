; Matching retail form; see src/game/dual_screen_ui_grid_state.c.
.text

    .global func_02026990
    .type func_02026990, @function
func_02026990: ; 0x02026990
    str r1, [r0, #0x4]
    mov r1, #0x0
    str r1, [r0, #0x0]
    str r1, [r0, #0x8]
    bx lr
    .size func_02026990, . - func_02026990
