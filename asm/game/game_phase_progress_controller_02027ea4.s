; Matching retail form; see src/game/game_phase_progress_controller.c.
.text

    .global GamePhaseProgressController_SetComparisonStage
    .type GamePhaseProgressController_SetComparisonStage, @function
GamePhaseProgressController_SetComparisonStage: ; 0x02027ea4
    str r1, [r0, #0x18]
    bx lr
    .size GamePhaseProgressController_SetComparisonStage, . - GamePhaseProgressController_SetComparisonStage

