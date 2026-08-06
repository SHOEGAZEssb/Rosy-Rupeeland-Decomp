; Matching retail form; see src/game/actor_runtime_frame_state.c.
.text

    .global func_02031748
    .type func_02031748, @function
func_02031748: ; 0x02031748
    ldr r1, [r0, #0x10]
    orr r1, r1, #0x80
    str r1, [r0, #0x10]
    bx lr
    .size func_02031748, . - func_02031748

