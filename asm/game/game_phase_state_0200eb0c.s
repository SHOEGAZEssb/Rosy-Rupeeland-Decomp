; Matching retail form; see src/game/game_phase_state_runtime.c.
.text


    .global GamePhaseState_GetConfiguration
GamePhaseState_GetConfiguration: ; 0x0200eb0c
    ldr r0, [r0, #0x0]
    bx lr
    .size GamePhaseState_GetConfiguration, . - GamePhaseState_GetConfiguration

