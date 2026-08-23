; Matching retail form; see src/game/actor_runtime_frame_state.c.
.text

    .global Actor_MarkFrameUpdateStarted
    .type Actor_MarkFrameUpdateStarted, @function
Actor_MarkFrameUpdateStarted: ; 0x02031748
    ldr r1, [r0, #0x10]
    orr r1, r1, #0x80
    str r1, [r0, #0x10]
    bx lr
    .size Actor_MarkFrameUpdateStarted, . - Actor_MarkFrameUpdateStarted

