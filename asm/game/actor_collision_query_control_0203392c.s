; Matching retail form; see src/game/actor_collision_query_control.c.
.text

    .global func_0203392c
    .type func_0203392c, @function
func_0203392c: ; 0x0203392c
    ldr r1, [r0, #0x10]
    orr r1, r1, #0x2000
    str r1, [r0, #0x10]
    mov r0, #0x0
    bx lr
    .size func_0203392c, . - func_0203392c

    .global func_02033940

