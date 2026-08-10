; Matching retail form; see src/game/actor_runtime_frame_state.c.
.text

    .global Actor_ClearTransientContactState
    .type Actor_ClearTransientContactState, @function
Actor_ClearTransientContactState: ; 0x02031720
    mov r1, #0x0
    strb r1, [r0, #0x4b]
    strb r1, [r0, #0x4a]
    strb r1, [r0, #0x49]
    ldr r1, [r0, #0x10]
    tst r1, #0x2000
    orrne r1, r1, #0x4000
    biceq r1, r1, #0x4000
    str r1, [r0, #0x10]
    bx lr
    .size Actor_ClearTransientContactState, . - Actor_ClearTransientContactState

