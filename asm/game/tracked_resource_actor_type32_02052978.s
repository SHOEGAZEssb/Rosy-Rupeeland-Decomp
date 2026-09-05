.text
; Matching fallback for the portable implementation in src/game/tracked_resource_actor_type32.c.
.extern TrackedResourceActor_Init
.extern gTrackedResourceActorType32Vtable

.global TrackedResourceActorType32_Init
TrackedResourceActorType32_Init:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Init
    ldr r1, .L_02052994
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_02052994: .word gTrackedResourceActorType32Vtable
.size TrackedResourceActorType32_Init, . - TrackedResourceActorType32_Init
