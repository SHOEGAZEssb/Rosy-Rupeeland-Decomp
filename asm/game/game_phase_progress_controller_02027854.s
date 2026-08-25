; Matching retail form; see src/game/game_phase_progress_controller.c.
.text
.extern GamePhaseProgressController_GetAdjustedThreshold

    .global GamePhaseProgress_GetCurrentAdjustedThreshold
    .type GamePhaseProgress_GetCurrentAdjustedThreshold, @function
GamePhaseProgress_GetCurrentAdjustedThreshold: ; 0x02027854
    ldr ip, .L_02027860
    ldr r1, [r0, #0x14]
    bx ip
.L_02027860: .word GamePhaseProgressController_GetAdjustedThreshold
    .size GamePhaseProgress_GetCurrentAdjustedThreshold, . - GamePhaseProgress_GetCurrentAdjustedThreshold

