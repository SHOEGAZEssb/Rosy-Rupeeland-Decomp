; Matching retail form; see src/game/actor_orientation_update.c.
.text
.extern Actor_TurnTowardVector

    .global Actor_TurnTowardTargetPosition
    .type Actor_TurnTowardTargetPosition, @function
Actor_TurnTowardTargetPosition: ; 0x02032370
    stmdb sp!, {r3, r4, r5, lr}
    ldr r4, [r0, #0x1c]
    ldr ip, [r0, #0x20]
    ldmib r1, {r5, lr}
    mov r3, r2
    sub r1, r5, r4
    sub r2, lr, ip
    bl Actor_TurnTowardVector
    ldmia sp!, {r3, r4, r5, pc}
    .size Actor_TurnTowardTargetPosition, . - Actor_TurnTowardTargetPosition

