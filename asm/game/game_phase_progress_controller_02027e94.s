; Matching retail form; see src/game/game_phase_progress_controller.c.
.text

    .global GamePhaseProgressController_SetStage
    .type GamePhaseProgressController_SetStage, @function
GamePhaseProgressController_SetStage: ; 0x02027e94
    str r1, [r0, #0x14]
    bx lr
    .size GamePhaseProgressController_SetStage, . - GamePhaseProgressController_SetStage

