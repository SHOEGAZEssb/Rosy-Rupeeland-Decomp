; Matching retail form; see src/game/actor_step_transition_state.c.
.text

    .global ActorStepTransition_DefaultQueryReturnZero
    .type ActorStepTransition_DefaultQueryReturnZero, @function
ActorStepTransition_DefaultQueryReturnZero: ; 0x0203213c
    mov r0, #0x0
    bx lr
    .size ActorStepTransition_DefaultQueryReturnZero, . - ActorStepTransition_DefaultQueryReturnZero
