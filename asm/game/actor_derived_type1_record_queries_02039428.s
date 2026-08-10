; Matching retail form; see src/game/actor_derived_type1_record_queries.c.
.text
    .global ActorDerivedType1_IsActiveRecordType6A
    .type ActorDerivedType1_IsActiveRecordType6A, @function
ActorDerivedType1_IsActiveRecordType6A: ; 0x02039428
    ldr r1, [r0, #0x27c]
    mov r0, #0x0
    cmp r1, #0x0
    bxeq lr
    ldrb r1, [r1, #0x8]
    cmp r1, #0x6a
    moveq r0, #0x1
    bx lr
    .size ActorDerivedType1_IsActiveRecordType6A, . - ActorDerivedType1_IsActiveRecordType6A
