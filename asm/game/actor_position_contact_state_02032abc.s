; Matching retail form; see src/game/actor_position_contact_state.c.
.text

    .global ActorContactState_RemoveContact
    .type ActorContactState_RemoveContact, @function
ActorContactState_RemoveContact: ; 0x02032abc
    ldrb r1, [r0, #0x4c]
    cmp r1, #0x0
    bxeq lr
    sub r1, r1, #0x1
    strb r1, [r0, #0x4c]
    tst r1, #0xff
    moveq r1, #0x0
    streqb r1, [r0, #0x4c]
    ldreq r1, [r0, #0x10]
    biceq r1, r1, #0x1
    streq r1, [r0, #0x10]
    bx lr
    .size ActorContactState_RemoveContact, . - ActorContactState_RemoveContact

