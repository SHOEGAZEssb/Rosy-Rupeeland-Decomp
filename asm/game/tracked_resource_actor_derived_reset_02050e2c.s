; Matching retail form; see src/game/tracked_resource_actor_derived_reset.c.
.text
    .global TrackedResourceActorType21_ResetMotionState
TrackedResourceActorType21_ResetMotionState:
    mov r1, #0x0
    str r1, [r0, #0x40]
    str r1, [r0, #0x3c]
    mov r1, #0x1000
    str r1, [r0, #0x44]
    ldr r2, [r0, #0x14]
    ldr r1, .L_02050e70
    and r1, r2, r1
    str r1, [r0, #0x14]
    ldr r1, [r0, #0x10]
    orr r1, r1, #0x1f0000
    str r1, [r0, #0x10]
    ldr r1, [r0, #0x1f4]
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    str r1, [r0, #0x1f4]
    bx lr
.L_02050e70: .word 0xff7fffbf
    .size TrackedResourceActorType21_ResetMotionState, . - TrackedResourceActorType21_ResetMotionState
