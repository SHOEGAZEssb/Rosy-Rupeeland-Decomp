; Matching retail form; see src/game/game_phase_progress_controller.c.
.text

    .global GamePhaseProgressController_ArmAdjustmentIncrement
    .type GamePhaseProgressController_ArmAdjustmentIncrement, @function
GamePhaseProgressController_ArmAdjustmentIncrement: ; 0x02027f2c
    mov r1, #0x1
    str r1, [r0, #0x38]
    bx lr
    .size GamePhaseProgressController_ArmAdjustmentIncrement, . - GamePhaseProgressController_ArmAdjustmentIncrement

