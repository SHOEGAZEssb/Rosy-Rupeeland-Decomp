; Matching retail form; see src/game/game_phase_progress_controller.c.
.text
.extern func_02027828

    .global func_02027854
    .type func_02027854, @function
func_02027854: ; 0x02027854
    ldr ip, .L_02027860
    ldr r1, [r0, #0x14]
    bx ip
.L_02027860: .word func_02027828
    .size func_02027854, . - func_02027854

