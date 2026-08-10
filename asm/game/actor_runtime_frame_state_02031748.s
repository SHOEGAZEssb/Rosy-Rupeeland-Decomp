; Matching retail form; see src/game/actor_runtime_frame_state.c.
.text

    .global Actor_SetRuntimeFlag80
    .type Actor_SetRuntimeFlag80, @function
Actor_SetRuntimeFlag80: ; 0x02031748
    ldr r1, [r0, #0x10]
    orr r1, r1, #0x80
    str r1, [r0, #0x10]
    bx lr
    .size Actor_SetRuntimeFlag80, . - Actor_SetRuntimeFlag80

