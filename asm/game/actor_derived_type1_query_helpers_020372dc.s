; Matching retail form; see src/game/actor_derived_type1_query_helpers.c.
.text

    .global ActorDerivedType1_ReturnZeroQuery
    .type ActorDerivedType1_ReturnZeroQuery, @function
ActorDerivedType1_ReturnZeroQuery: ; 0x020372dc
    mov r0, #0x0
    bx lr
    .size ActorDerivedType1_ReturnZeroQuery, . - ActorDerivedType1_ReturnZeroQuery
