.text
; Matching fallback for the portable implementation in src/game/tracked_resource_actor_type32.c.

.global TrackedResourceActorType32_Update
TrackedResourceActorType32_Update:
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0xc4]
    blx r2
    ldmia sp!, {r3, pc}
.size TrackedResourceActorType32_Update, . - TrackedResourceActorType32_Update
