; Matching retail form; see src/game/actor_collision_query_control.c.
.text

    .global func_02033940
    .type func_02033940, @function
func_02033940: ; 0x02033940
    ldr r1, [r0, #0x10]
    bic r1, r1, #0x2000
    str r1, [r0, #0x10]
    mov r0, #0x0
    bx lr
    .size func_02033940, . - func_02033940

    .global func_02033954

