; Matching retail form; see src/game/tracked_resource_actor_variant_collision.c.
.extern gActorRuntimeCollection
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern ActorRuntimeCollection_GetPendingAttachmentFlag
.extern ActorRuntimeTriple_Assign
.extern ActorCollection_QueueActorForRemoval
.extern func_020328d0
.extern Actor_GetOwningCollection
.extern TrackedResourceActor_EmitRecordEffects
.extern TrackedResourceActor_DispatchTargetInteraction
.text
    .global TrackedResourceActorType22And25_HandleCollision
TrackedResourceActorType22And25_HandleCollision:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r0
    ldr r0, .L_020512a0
    mov r4, r1
    bl ActorRuntimeCollection_GetPendingAttachmentFlag
    cmp r0, #0x0
    bne .L_02051224
    cmp r4, #0x0
    beq .L_02051224
    add r0, sp, #0x0
    add r1, r5, #0x38
    bl VecFx32Object_InitCopy
    mov r0, #0x0
    str r0, [sp, #0xc]
    ldr r1, [r5, #0x1fc]
    add r0, sp, #0x0
    ldrsh r1, [r1, #0x2a]
    mov r1, r1, lsl #0x4
    bl func_020328d0
    ldr r0, [r5, #0x1fc]
    add r1, sp, #0x0
    ldrsh r0, [r0, #0xc]
    cmp r0, #0x0
    mov r0, r4
    ldr r3, [r0, #0x0]
    movgt r2, #0x1
    ldr r3, [r3, #0xb8]
    movle r2, #0x0
    blx r3
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
.L_02051224:
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r5, #0x38
    bl ActorRuntimeTriple_Assign
    add r1, r5, #0x100
    mov r0, #0x8000
    ldrh r3, [r1, #0xf0]
    rsb r0, r0, #0x0
    mov r2, #0x0
    and r0, r3, r0
    orr r0, r0, #0x2
    strh r0, [r1, #0xf0]
    ldr r3, [r5, #0x10]
    mov r0, r5
    orr r3, r3, #0x1f0000
    str r3, [r5, #0x10]
    strh r2, [r1, #0xf8]
    ldr r1, [r5, #0x14]
    bic r1, r1, #0x800000
    str r1, [r5, #0x14]
    bl Actor_GetOwningCollection
    mov r1, r5
    bl ActorCollection_QueueActorForRemoval
    mov r0, r5
    bl TrackedResourceActor_EmitRecordEffects
    mov r0, r5
    mov r1, r4
    bl TrackedResourceActor_DispatchTargetInteraction
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_020512a0: .word gActorRuntimeCollection
    .size TrackedResourceActorType22And25_HandleCollision, . - TrackedResourceActorType22And25_HandleCollision

