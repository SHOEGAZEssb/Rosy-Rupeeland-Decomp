; Matching retail form; see src/game/actor_derived_type1_state_vector.c.
.text

    .global ActorDerivedType1_ClearStateVectorTimers
    .type ActorDerivedType1_ClearStateVectorTimers, @function
ActorDerivedType1_ClearStateVectorTimers: ; 0x02038e38
    add r0, r0, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x64]
    strh r1, [r0, #0x66]
    strh r1, [r0, #0x52]
    bx lr
    .size ActorDerivedType1_ClearStateVectorTimers, . - ActorDerivedType1_ClearStateVectorTimers
