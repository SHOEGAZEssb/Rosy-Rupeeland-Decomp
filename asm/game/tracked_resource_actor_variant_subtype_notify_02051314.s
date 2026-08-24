; Matching retail form; see src/game/tracked_resource_actor_variant_subtype_notify.c.
.extern gGamePhaseRuntime
.extern ActorMotionJitter_EnsureMinimum
.extern TrackedResourceActor_ScanNeighborhoodAndApplyRecordEffect
.text
    .global TrackedResourceActorType22And25_CleanupSubtype19
TrackedResourceActorType22And25_CleanupSubtype19:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x4e]
    cmp r1, #0x19
    ldmneia sp!, {r4, pc}
    bl TrackedResourceActor_ScanNeighborhoodAndApplyRecordEffect
    ldr r0, [r4, #0x10]
    tst r0, #0x4
    ldmeqia sp!, {r4, pc}
    ldr r0, .L_02051358
    mov r1, #0x14
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionJitter_EnsureMinimum
    ldmia sp!, {r4, pc}
.L_02051358: .word gGamePhaseRuntime
    .size TrackedResourceActorType22And25_CleanupSubtype19, . - TrackedResourceActorType22And25_CleanupSubtype19
