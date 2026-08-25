; Matching retail form; see src/game/dual_screen_ui_grid_state.c.
.text

    .global GridMotion_Init
    .type GridMotion_Init, @function
GridMotion_Init: ; 0x020264b0
    str r1, [r0, #0x0]
    ldr r1, [sp, #0x0]
    stmib r0, {r2, r3}
    str r1, [r0, #0xc]
    bx lr
    .size GridMotion_Init, . - GridMotion_Init
