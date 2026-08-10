; Matching retail form; see src/game/actor_derived_type1_failure_state.c.
.text
    .global ActorDerivedType1_ClearFailureCounter
    .type ActorDerivedType1_ClearFailureCounter, @function
ActorDerivedType1_ClearFailureCounter: ; 0x02039ba0
    add r0, r0, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x9e]
    bx lr
    .size ActorDerivedType1_ClearFailureCounter, . - ActorDerivedType1_ClearFailureCounter
