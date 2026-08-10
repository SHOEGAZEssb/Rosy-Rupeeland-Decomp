; Matching retail form; see src/game/actor_derived_type1_query_helpers.c.
.text

    .global ActorDerivedType1_HasBlockingStateFlags
    .type ActorDerivedType1_HasBlockingStateFlags, @function
ActorDerivedType1_HasBlockingStateFlags: ; 0x020372b4
    ldr r1, [r0, #0xd0]
    tst r1, #0x10000
    bne .L_020372cc
    ldr r0, [r0, #0x230]
    tst r0, #0x980000
    beq .L_020372d4
.L_020372cc:
    mov r0, #0x1
    bx lr
.L_020372d4:
    mov r0, #0x0
    bx lr
    .size ActorDerivedType1_HasBlockingStateFlags, . - ActorDerivedType1_HasBlockingStateFlags
