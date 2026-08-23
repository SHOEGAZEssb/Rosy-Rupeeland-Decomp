; Matching retail form; see src/game/actor_derived_type1_contact_reset.c.
.text
.extern ActorContactState_RemoveContact

    .global ActorDerivedType1_DecrementContactCount
    .type ActorDerivedType1_DecrementContactCount, @function
ActorDerivedType1_DecrementContactCount: ; 0x020387cc
    ldr ip, .L_020387d4
    bx ip
.L_020387d4: .word ActorContactState_RemoveContact
    .size ActorDerivedType1_DecrementContactCount, . - ActorDerivedType1_DecrementContactCount
