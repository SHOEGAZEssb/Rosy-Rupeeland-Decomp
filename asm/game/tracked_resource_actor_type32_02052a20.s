.text
; Matching fallback for the portable implementation in src/game/tracked_resource_actor_type32.c.
.extern ActorCollection_QueueActorForRemoval
.extern ActorRuntimeCollection_GetPendingAttachmentFlag
.extern Actor_GetOwningCollection
.extern TrackedResourceActor_DispatchTargetInteraction
.extern TrackedResourceActor_EmitRecordEffects
.extern TrackedResourceActor_ScanNeighborhoodAndApplyRecordEffect
.extern gActorRuntimeCollection

.global TrackedResourceActorType32_DispatchEffect
TrackedResourceActorType32_DispatchEffect:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, .L_02052a6c
    mov r4, r1
    bl ActorRuntimeCollection_GetPendingAttachmentFlag
    cmp r0, #0x0
    bne .L_02052a44
    mov r0, r5
    bl TrackedResourceActor_ScanNeighborhoodAndApplyRecordEffect
.L_02052a44:
    mov r0, r5
    bl Actor_GetOwningCollection
    mov r1, r5
    bl ActorCollection_QueueActorForRemoval
    mov r0, r5
    bl TrackedResourceActor_EmitRecordEffects
    mov r0, r5
    mov r1, r4
    bl TrackedResourceActor_DispatchTargetInteraction
    ldmia sp!, {r3, r4, r5, pc}
.L_02052a6c: .word gActorRuntimeCollection
.size TrackedResourceActorType32_DispatchEffect, . - TrackedResourceActorType32_DispatchEffect
