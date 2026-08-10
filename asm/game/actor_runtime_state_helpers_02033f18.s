; Matching retail form; see src/game/actor_runtime_state_helpers.c.
.text

    .global Actor_SetScale
    .type Actor_SetScale, @function
Actor_SetScale: ; 0x02033f18
    str r1, [r0, #0x1d0]
    bx lr
    .size Actor_SetScale, . - Actor_SetScale

    .global Actor_SetAttachmentBaseScale

