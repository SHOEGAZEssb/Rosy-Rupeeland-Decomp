; Matching retail form; see src/game/actor_collision_query_control.c.
.text

    .global Actor_ResetMotionForCollisionQuery
    .type Actor_ResetMotionForCollisionQuery, @function
Actor_ResetMotionForCollisionQuery: ; 0x020338e4
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0xd0]
    mov r1, #0x0
    orr r2, r2, #0x100
    str r2, [r4, #0xd0]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    mov r0, #0x0
    str r0, [r4, #0x44]
    str r0, [r4, #0x40]
    str r0, [r4, #0x3c]
    str r0, [r4, #0x94]
    str r0, [r4, #0x90]
    str r0, [r4, #0x8c]
    ldmia sp!, {r4, pc}
    .size Actor_ResetMotionForCollisionQuery, . - Actor_ResetMotionForCollisionQuery

    .global ActorCollisionQuery_NoOpHook

