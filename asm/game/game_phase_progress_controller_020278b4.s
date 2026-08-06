; Matching retail form; see src/game/game_phase_progress_controller.c.
.text
.extern func_020278d4

    .global func_020278b4
    .type func_020278b4, @function
func_020278b4: ; 0x020278b4
    ldr r2, .L_020278cc
    ldr ip, .L_020278d0
    str r1, [r0, #0x0]
    cmp r1, r2
    strhs r2, [r0, #0x0]
    bx ip
.L_020278cc: .word 0x6e002800
.L_020278d0: .word func_020278d4
    .size func_020278b4, . - func_020278b4

