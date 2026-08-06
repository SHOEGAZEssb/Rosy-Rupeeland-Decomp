; Matching retail form; see src/game/actor_resource_attachment_state.c.
.text

    .global func_02032c08
    .type func_02032c08, @function
func_02032c08: ; 0x02032c08
    add r0, r0, r1, lsl #0x2
    str r2, [r0, #0x180]
    bx lr
    .size func_02032c08, . - func_02032c08

