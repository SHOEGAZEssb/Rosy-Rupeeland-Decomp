; Matching retail form; see src/game/game_phase_progress_controller.c.
.text
.extern data_020c37f4

    .global func_02027818
    .type func_02027818, @function
func_02027818: ; 0x02027818
    ldr r0, .L_02027824
    ldr r0, [r0, r1, lsl #0x2]
    bx lr
.L_02027824: .word data_020c37f4
    .size func_02027818, . - func_02027818

