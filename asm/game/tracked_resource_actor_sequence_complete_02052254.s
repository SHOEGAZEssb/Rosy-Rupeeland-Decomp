; Matching retail form; see src/game/tracked_resource_actor_sequence_complete.c.
.extern gGamePhaseRuntime
.extern ActorMotionJitter_EnsureMinimum
.extern ActorCollection_QueueActorForRemoval
.extern Actor_GetOwningCollection
.extern TrackedResourceActor_EmitRecordEffects
.extern TrackedResourceActor_ScanNeighborhoodAndApplyRecordEffect
.text
    .global TrackedResourceActorType27_Complete
TrackedResourceActorType27_Complete:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Actor_GetOwningCollection
    mov r1, r4
    bl ActorCollection_QueueActorForRemoval
    mov r0, r4
    bl TrackedResourceActor_EmitRecordEffects
    ldr r0, [r4, #0x10]
    tst r0, #0x4
    beq .L_02052298
    ldr r0, .L_020522a4
    mov r1, #0x14
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionJitter_EnsureMinimum
.L_02052298:
    mov r0, r4
    bl TrackedResourceActor_ScanNeighborhoodAndApplyRecordEffect
    ldmia sp!, {r4, pc}
.L_020522a4: .word gGamePhaseRuntime
    .size TrackedResourceActorType27_Complete, . - TrackedResourceActorType27_Complete
