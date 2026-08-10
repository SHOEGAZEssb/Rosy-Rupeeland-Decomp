; Matching retail form; see src/game/actor_base_geometry_init.c.
.text

    .global ActorBounds_Copy
    .type ActorBounds_Copy, @function
ActorBounds_Copy: ; 0x02030d00
    ldrsb r2, [r1, #0x0]
    strb r2, [r0, #0x0]
    ldrsb r2, [r1, #0x1]
    strb r2, [r0, #0x1]
    ldrsb r2, [r1, #0x2]
    strb r2, [r0, #0x2]
    ldrsb r1, [r1, #0x3]
    strb r1, [r0, #0x3]
    bx lr
    .size ActorBounds_Copy, . - ActorBounds_Copy
