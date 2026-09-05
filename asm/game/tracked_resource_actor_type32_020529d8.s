.text
; Matching fallback for the portable implementation in src/game/tracked_resource_actor_type32.c.
.extern VecFx32Object_SetComponents

.global TrackedResourceActorType32_SetRecord
TrackedResourceActorType32_SetRecord:
    stmdb sp!, {r4, lr}
    mov r4, r0
    str r1, [r4, #0x1fc]
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x38
    bl VecFx32Object_SetComponents
    ldr r0, [r4, #0x14]
    orr r0, r0, #0x2
    str r0, [r4, #0x14]
    ldmia sp!, {r4, pc}
.size TrackedResourceActorType32_SetRecord, . - TrackedResourceActorType32_SetRecord
