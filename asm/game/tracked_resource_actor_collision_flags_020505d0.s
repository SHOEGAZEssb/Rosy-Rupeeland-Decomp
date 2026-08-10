; Matching retail form; see src/game/tracked_resource_actor_collision_flags.c.
.text
    .global TrackedResourceActor_EnableCollisionParticipation
TrackedResourceActor_EnableCollisionParticipation:
    ldr r1, [r0, #0x10]
    orr r1, r1, #0x1f0000
    str r1, [r0, #0x10]
    ldr r1, [r0, #0x1f4]
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    str r1, [r0, #0x1f4]
    bx lr
    .size TrackedResourceActor_EnableCollisionParticipation, . - TrackedResourceActor_EnableCollisionParticipation
