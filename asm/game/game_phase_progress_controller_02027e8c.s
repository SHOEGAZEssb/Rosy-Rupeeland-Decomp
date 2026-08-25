; Matching retail form; see src/game/game_phase_progress_controller.c.
.text

    .global GamePhaseProgressController_GetStage
    .type GamePhaseProgressController_GetStage, @function
GamePhaseProgressController_GetStage: ; 0x02027e8c
    ldr r0, [r0, #0x14]
    bx lr
    .size GamePhaseProgressController_GetStage, . - GamePhaseProgressController_GetStage

