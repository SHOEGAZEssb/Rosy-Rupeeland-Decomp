; Matching retail form; see src/game/actor_animation_state_dispatch.c.
.text

    .global Actor_SynchronizeStatePresentation
    .type Actor_SynchronizeStatePresentation, @function
Actor_SynchronizeStatePresentation: ; 0x0203292c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrsh r2, [r4, #0xd6]
    ldrsh r1, [r4, #0xd8]
    cmp r2, r1
    ldreqsh r2, [r4, #0xda]
    ldreqsh r1, [r4, #0xdc]
    cmpeq r2, r1
    ldreqb r2, [r4, #0xd4]
    ldreqb r1, [r4, #0xd5]
    cmpeq r2, r1
    bne .L_02032968
    ldr r1, [r4, #0xd0]
    tst r1, #0x1000
    beq .L_02032988
.L_02032968:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x5c]
    blx r1
    ldr r0, [r4, #0xd0]
    bic r0, r0, #0x1000
    str r0, [r4, #0xd0]
    ldmia sp!, {r4, pc}
.L_02032988:
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x68]
    blx r1
    cmp r0, #0x0
    ldrnesh r1, [r4, #0xde]
    ldrne r0, [r4, #0x54]
    strneh r1, [r0, #0x36]
    ldmia sp!, {r4, pc}
    .size Actor_SynchronizeStatePresentation, . - Actor_SynchronizeStatePresentation
