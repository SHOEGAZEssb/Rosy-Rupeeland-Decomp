; Matching retail form; see src/game/actor_feedback_slot_and_random_value.c.
.text
.extern gActorFeedbackPresentations
.extern func_020befec
.extern func_020bf1f8
.extern genrand_int32
    .global ActorFeedback_UpdatePresentations
    .type ActorFeedback_UpdatePresentations, @function
ActorFeedback_UpdatePresentations: ; 0x0203ad64
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, #0x0
    ldr r5, .L_0203adc0
    mov r4, r6
.L_0203ad74:
    ldr r0, [r5, r6, lsl #0x2]
    cmp r0, #0x0
    beq .L_0203adb0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    cmp r0, #0x0
    beq .L_0203adb0
    ldr r0, [r5, r6, lsl #0x2]
    cmp r0, #0x0
    beq .L_0203adac
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0203adac:
    str r4, [r5, r6, lsl #0x2]
.L_0203adb0:
    add r6, r6, #0x1
    cmp r6, #0x6
    blt .L_0203ad74
    ldmia sp!, {r4, r5, r6, pc}
.L_0203adc0: .word gActorFeedbackPresentations
    .size ActorFeedback_UpdatePresentations, . - ActorFeedback_UpdatePresentations

    .global Actor_RandomizeValueByTenPercent
    .type Actor_RandomizeValueByTenPercent, @function
Actor_RandomizeValueByTenPercent: ; 0x0203adc4
    stmdb sp!, {r3, r4, r5, lr}
    mov r1, #0xa
    mov r5, r0
    bl func_020befec
    mov r4, r0
    sub r5, r5, r4
    bl genrand_int32
    cmp r4, #0x1
    bgt .L_0203adf8
    tst r0, #0x100
    movne r1, #0x2
    moveq r1, #0x1
    b .L_0203adfc
.L_0203adf8:
    mov r1, r4, lsl #0x1
.L_0203adfc:
    bl func_020bf1f8
    add r5, r5, r1
    cmp r5, #0x0
    movle r5, #0x1
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}

    .size Actor_RandomizeValueByTenPercent, . - Actor_RandomizeValueByTenPercent

