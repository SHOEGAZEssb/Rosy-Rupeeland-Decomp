; Matching retail form; see src/game/game_phase_progress_controller.c.
.text
.extern func_02027828

    .global GamePhaseProgress_GetCurrentAdjustedThreshold
    .type GamePhaseProgress_GetCurrentAdjustedThreshold, @function
GamePhaseProgress_GetCurrentAdjustedThreshold: ; 0x02027854
    ldr ip, .L_02027860
    ldr r1, [r0, #0x14]
    bx ip
.L_02027860: .word func_02027828
    .size GamePhaseProgress_GetCurrentAdjustedThreshold, . - GamePhaseProgress_GetCurrentAdjustedThreshold

