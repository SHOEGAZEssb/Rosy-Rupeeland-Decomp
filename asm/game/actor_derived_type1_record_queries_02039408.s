; Matching retail form; see src/game/actor_derived_type1_record_queries.c.
.text
    .global ActorDerivedType1_IsActiveRecordType69
    .type ActorDerivedType1_IsActiveRecordType69, @function
ActorDerivedType1_IsActiveRecordType69: ; 0x02039408
    ldr r1, [r0, #0x27c]
    mov r0, #0x0
    cmp r1, #0x0
    bxeq lr
    ldrb r1, [r1, #0x8]
    cmp r1, #0x69
    moveq r0, #0x1
    bx lr
    .size ActorDerivedType1_IsActiveRecordType69, . - ActorDerivedType1_IsActiveRecordType69
