; Matching retail form; see src/game/actor_collision_query_control.c.
.text
.extern func_02033974

    .global func_02033954
    .type func_02033954, @function
func_02033954: ; 0x02033954
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02033974
    cmp r0, #0x0
    ldreq r0, [r4, #0x10]
    biceq r0, r0, #0x2000
    streq r0, [r4, #0x10]
    ldmia sp!, {r4, pc}
    .size func_02033954, . - func_02033954

    .global func_02033974

