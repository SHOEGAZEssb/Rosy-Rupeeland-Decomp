; Matching retail form; see src/game/actor_step_transition_cancel.c.
.text
.extern Actor_RestoreSavedFlags

    .global Actor_EndPositionTransition
    .type Actor_EndPositionTransition, @function
Actor_EndPositionTransition: ; 0x02032208
    stmdb sp!, {r3, lr}
    ldrsh r1, [r0, #0xac]
    cmp r1, #0xff
    ldmeqia sp!, {r3, pc}
    mov r1, #0xff
    strh r1, [r0, #0xac]
    bl Actor_RestoreSavedFlags
    ldmia sp!, {r3, pc}
    .size Actor_EndPositionTransition, . - Actor_EndPositionTransition
