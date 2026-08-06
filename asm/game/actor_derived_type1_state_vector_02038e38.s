; Matching retail form; see src/game/actor_derived_type1_state_vector.c.
.text

    .global func_02038e38
    .type func_02038e38, @function
func_02038e38: ; 0x02038e38
    add r0, r0, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x64]
    strh r1, [r0, #0x66]
    strh r1, [r0, #0x52]
    bx lr
    .size func_02038e38, . - func_02038e38
