; Matching retail form; see src/game/actor_derived_type1_special_mode.c.
.text
    .global ActorDerivedType1_IsSpecialRecordActive
    .type ActorDerivedType1_IsSpecialRecordActive, @function
ActorDerivedType1_IsSpecialRecordActive: ; 0x02039d0c
    ldr r0, [r0, #0x27c]
    cmp r0, #0x0
    moveq r0, #0x0
    bxeq lr
    ldrsh r1, [r0, #0x0]
    ldrb r0, [r0, #0x8]
    cmp r1, #0x7b
    cmpne r1, #0x7c
    cmpne r1, #0x80
    cmpne r1, #0x8c
    beq .L_02039d44
    sub r0, r0, #0x73
    cmp r0, #0x1
    bhi .L_02039d4c
.L_02039d44:
    mov r0, #0x1
    bx lr
.L_02039d4c:
    mov r0, #0x0
    bx lr
    .size ActorDerivedType1_IsSpecialRecordActive, . - ActorDerivedType1_IsSpecialRecordActive
