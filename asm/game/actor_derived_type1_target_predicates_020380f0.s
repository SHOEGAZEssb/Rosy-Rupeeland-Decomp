; Matching retail form; see src/game/actor_derived_type1_target_predicates.c.
.text

    .global ActorDerivedType1_IsTargetStateEligible
    .type ActorDerivedType1_IsTargetStateEligible, @function
ActorDerivedType1_IsTargetStateEligible: ; 0x020380f0
    ldrb r1, [r0, #0x27e]
    mov r0, #0x0
    add r1, r1, #0xff
    and r2, r1, #0xff
    cmp r2, #0x1f
    bxhi lr
    mov r1, #0x1
    mov r2, r1, lsl r2
    tst r2, #0x90000007
    movne r0, r1
    bx lr
    .size ActorDerivedType1_IsTargetStateEligible, . - ActorDerivedType1_IsTargetStateEligible
