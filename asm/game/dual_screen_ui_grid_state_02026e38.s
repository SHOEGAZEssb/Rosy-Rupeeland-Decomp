; Matching retail form; see src/game/dual_screen_ui_grid_state.c.
.text

    .global func_02026e38
    .type func_02026e38, @function
func_02026e38: ; 0x02026e38
    ldr r0, [r0, #0xd0]
    and r0, r0, #0x80
    bx lr
    .size func_02026e38, . - func_02026e38
