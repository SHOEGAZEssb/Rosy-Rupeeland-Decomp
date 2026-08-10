; Matching retail form; see src/game/actor_base_geometry_init.c.
.text

    .global ActorBounds_Translate
    .type ActorBounds_Translate, @function
ActorBounds_Translate: ; 0x02030d3c
    ldrsb r3, [r0, #0x0]
    add r3, r3, r1
    strb r3, [r0, #0x0]
    ldrsb r3, [r0, #0x1]
    add r3, r3, r2
    strb r3, [r0, #0x1]
    ldrsb r3, [r0, #0x2]
    add r1, r3, r1
    strb r1, [r0, #0x2]
    ldrsb r1, [r0, #0x3]
    add r1, r1, r2
    strb r1, [r0, #0x3]
    bx lr
    .size ActorBounds_Translate, . - ActorBounds_Translate
