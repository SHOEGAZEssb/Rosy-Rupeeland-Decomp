    .text

    /* Exact fallback; see the documented portable reconstruction in
     * src/overlays/ov005/overlay005_transition_state_init.c. */
    .global Overlay005_InitTransitionState
Overlay005_InitTransitionState: ; 0x021fbe44
    stmdb sp!, {r0, r1, r2, r3}
    ldr r2, [sp, #0x4]
    ldr r1, [sp, #0x8]
    str r2, [r0, #0x24]
    str r1, [r0, #0x28]
    mov r1, #0x0
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    add sp, sp, #0x10
    bx lr
    .size Overlay005_InitTransitionState, .-Overlay005_InitTransitionState
