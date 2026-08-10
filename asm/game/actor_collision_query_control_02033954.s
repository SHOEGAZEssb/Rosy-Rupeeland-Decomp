; Matching retail form; see src/game/actor_collision_query_control.c.
.text
.extern Actor_TestQueryPoint

    .global Actor_TestQueryPointAndClearFlag2000
    .type Actor_TestQueryPointAndClearFlag2000, @function
Actor_TestQueryPointAndClearFlag2000: ; 0x02033954
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Actor_TestQueryPoint
    cmp r0, #0x0
    ldreq r0, [r4, #0x10]
    biceq r0, r0, #0x2000
    streq r0, [r4, #0x10]
    ldmia sp!, {r4, pc}
    .size Actor_TestQueryPointAndClearFlag2000, . - Actor_TestQueryPointAndClearFlag2000

    .global Actor_TestQueryPoint
