; Matching retail form; see src/game/actor_step_transition_state.c.
.text

    .global Actor_ConfigureStepUpTransition
    .type Actor_ConfigureStepUpTransition, @function
Actor_ConfigureStepUpTransition: ; 0x020320fc
    ldr r2, [r0, #0x14]
    tst r2, #0x400
    mov r2, #0x18
    strh r2, [r0, #0xae]
    beq .L_02032124
    cmp r1, #0x20
    moveq r1, #0x2
    streqh r1, [r0, #0xac]
    movne r1, #0x0
    b .L_02032134
.L_02032124:
    cmp r1, #0x20
    moveq r1, #0x3
    streqh r1, [r0, #0xac]
    movne r1, #0x1
.L_02032134:
    strneh r1, [r0, #0xac]
    bx lr
    .size Actor_ConfigureStepUpTransition, . - Actor_ConfigureStepUpTransition
