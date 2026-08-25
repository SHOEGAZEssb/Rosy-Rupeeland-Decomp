; Matching retail form; see src/game/game_phase_progress_controller.c.
.text

    .global GamePhaseProgressController_GetComparisonStage
    .type GamePhaseProgressController_GetComparisonStage, @function
GamePhaseProgressController_GetComparisonStage: ; 0x02027e9c
    ldr r0, [r0, #0x18]
    bx lr
    .size GamePhaseProgressController_GetComparisonStage, . - GamePhaseProgressController_GetComparisonStage

