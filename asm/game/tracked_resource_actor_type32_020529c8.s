.text
; Matching fallback for the portable implementation in src/game/tracked_resource_actor_type32.c.

.global TrackedResourceActorType32_ClearSpriteResources
TrackedResourceActorType32_ClearSpriteResources:
    mov r1, #0x0
    str r1, [r0, #0x1ec]
    str r1, [r0, #0x54]
    bx lr
.size TrackedResourceActorType32_ClearSpriteResources, . - TrackedResourceActorType32_ClearSpriteResources
