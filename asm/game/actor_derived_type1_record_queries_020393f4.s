; Matching retail form; see src/game/actor_derived_type1_record_queries.c.
.text
    .global ActorDerivedType1_GetActiveRecordId
    .type ActorDerivedType1_GetActiveRecordId, @function
ActorDerivedType1_GetActiveRecordId: ; 0x020393f4
    ldr r0, [r0, #0x27c]
    cmp r0, #0x0
    ldrnesh r0, [r0, #0x0]
    mvneq r0, #0x0
    bx lr
    .size ActorDerivedType1_GetActiveRecordId, . - ActorDerivedType1_GetActiveRecordId
