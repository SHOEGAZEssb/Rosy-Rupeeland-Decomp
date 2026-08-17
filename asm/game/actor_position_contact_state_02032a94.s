; Matching retail form; see src/game/actor_position_contact_state.c.
.text

    .global ActorContactState_AddContact
    .type ActorContactState_AddContact, @function
ActorContactState_AddContact: ; 0x02032a94
    cmp r2, #0x0
    bne .L_02032ab4
    ldrb r1, [r0, #0x4c]
    add r1, r1, #0x1
    strb r1, [r0, #0x4c]
    ldr r1, [r0, #0x10]
    orr r1, r1, #0x1
    str r1, [r0, #0x10]
.L_02032ab4:
    mov r0, #0x1
    bx lr
    .size ActorContactState_AddContact, . - ActorContactState_AddContact

