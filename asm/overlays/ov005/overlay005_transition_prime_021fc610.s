    .text
    .extern Overlay005_InitTransitionState
    .extern data_ov005_021fca08

    /* Exact fallback; see the documented portable reconstruction in
     * src/overlays/ov005/overlay005_transition_prime.c. */
    .global Overlay005_PrimeTransition
Overlay005_PrimeTransition: ; 0x021fc610
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x4]
    cmp r1, #0x0
    bne L_021fc62c
    ldr r1, L_021fc634
    ldmia r1, {r1, r2}
    bl Overlay005_InitTransitionState
L_021fc62c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_021fc634: .word data_ov005_021fca08
    .size Overlay005_PrimeTransition, .-Overlay005_PrimeTransition
