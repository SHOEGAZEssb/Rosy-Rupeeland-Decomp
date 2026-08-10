; Matching retail form; see src/game/tracked_resource_actor_projectile_reset.c.
.text
    .global TrackedResourceActorType24_ResetMotionState
TrackedResourceActorType24_ResetMotionState:
    mov r1, #0x2000
    str r1, [r0, #0x44]
    ldr r1, [r0, #0x10]
    orr r1, r1, #0x1f0000
    str r1, [r0, #0x10]
    ldr r1, [r0, #0x1f4]
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    str r1, [r0, #0x1f4]
    bx lr
    .size TrackedResourceActorType24_ResetMotionState, . - TrackedResourceActorType24_ResetMotionState
