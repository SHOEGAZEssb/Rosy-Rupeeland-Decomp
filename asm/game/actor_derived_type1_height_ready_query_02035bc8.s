; Matching retail form; see src/game/actor_derived_type1_height_ready_query.c.
.text

    .global func_02035bc8
    .type func_02035bc8, @function
func_02035bc8: ; 0x02035bc8
    ldr r1, [r0, #0xd0]
    tst r1, #0x10
    ldreq r1, [r0, #0x24]
    ldreq r0, [r0, #0x1dc]
    cmpeq r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
    .size func_02035bc8, . - func_02035bc8

    .global func_02035be8

