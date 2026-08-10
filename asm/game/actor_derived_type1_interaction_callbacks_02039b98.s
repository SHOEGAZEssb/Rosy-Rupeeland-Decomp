; Matching retail form; see src/game/actor_derived_type1_interaction_callbacks.c.
.text
    .global ActorDerivedType1_ReturnZeroInteraction
    .type ActorDerivedType1_ReturnZeroInteraction, @function
ActorDerivedType1_ReturnZeroInteraction: ; 0x02039b98
    mov r0, #0x0
    bx lr
    .size ActorDerivedType1_ReturnZeroInteraction, . - ActorDerivedType1_ReturnZeroInteraction
