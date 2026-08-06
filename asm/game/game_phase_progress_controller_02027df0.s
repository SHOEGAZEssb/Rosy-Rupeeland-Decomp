; Matching retail form; see src/game/game_phase_progress_controller.c.
.text

    .global func_02027df0
    .type func_02027df0, @function
func_02027df0: ; 0x02027df0
    ldr r1, [r0, #0x14]
    ldr r0, [r0, #0x18]
    cmp r1, r0
    movlt r0, #0x1
    movge r0, #0x0
    bx lr
    .size func_02027df0, . - func_02027df0

