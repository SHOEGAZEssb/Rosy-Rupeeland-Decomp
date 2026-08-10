; Matching retail form; see src/game/tracked_resource_actor_timed_collision.c.
.extern gActorRuntimeCollection
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern VecFx32Object_GetMagnitude
.extern VecFx32Object_Assign
.extern VecFx32_Subtract
.extern ActorRuntimeCollection_GetPendingAttachmentFlag
.extern func_020328d0
.extern Actor_GetCachedTerrainHeight
.extern TrackedResourceActor_EmitRecordEffects
.extern TrackedResourceActor_DispatchTargetInteraction
.extern TrackedResourceActor_ScaleVectorComponents
.extern func_020adae4
.text
    .global TrackedResourceActorType26_HandleCollision
TrackedResourceActorType26_HandleCollision:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x20
    mov r5, r0
    add r0, r5, #0x200
    ldrsh r0, [r0, #0x0]
    mov r4, r1
    cmp r0, #0x0
    bgt .L_02051c84
    ldr r0, .L_02051c8c
    bl ActorRuntimeCollection_GetPendingAttachmentFlag
    cmp r0, #0x0
    bne .L_02051c40
    cmp r4, #0x0
    beq .L_02051c40
    add r0, sp, #0x10
    add r1, r5, #0x88
    bl VecFx32Object_InitCopy
    ldr r0, [sp, #0x14]
    mvn r1, #0x7
    bl func_020adae4
    str r0, [sp, #0x14]
    ldr r0, [sp, #0x18]
    mvn r1, #0x7
    bl func_020adae4
    mov r2, #0x0
    str r0, [sp, #0x18]
    mov r0, r4
    str r2, [sp, #0x1c]
    ldr r3, [r0, #0x0]
    add r1, sp, #0x10
    ldr r3, [r3, #0xb8]
    blx r3
    add r0, sp, #0x0
    add r1, r5, #0x18
    add r2, r4, #0x18
    bl VecFx32_Subtract
    add r0, r5, #0x88
    add r1, sp, #0x0
    bl VecFx32Object_Assign
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    add r0, r5, #0x88
    bl VecFx32Object_GetMagnitude
    mov r1, r0
    cmp r1, #0x4
    movlt r1, #0x4
    add r0, r5, #0x88
    bl TrackedResourceActor_ScaleVectorComponents
    ldr r1, [r5, #0x1fc]
    add r0, r5, #0x88
    ldrsh r1, [r1, #0xa]
    mov r1, r1, lsl #0x4
    bl func_020328d0
    mov r0, r5
    bl Actor_GetCachedTerrainHeight
    ldr r1, [r5, #0x24]
    add r0, r0, #0x8000
    cmp r1, r0
    movle r0, #0x2000
    strle r0, [r5, #0x44]
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
.L_02051c40:
    mov ip, #0x0
    str ip, [r5, #0x40]
    str ip, [r5, #0x3c]
    add r2, r5, #0x100
    ldrh r3, [r2, #0xf0]
    sub r1, ip, #0x8000
    mov r0, r5
    and r1, r3, r1
    strh r1, [r2, #0xf0]
    strh ip, [r2, #0xf8]
    ldr r1, [r5, #0x14]
    orr r1, r1, #0x800000
    str r1, [r5, #0x14]
    bl TrackedResourceActor_EmitRecordEffects
    mov r0, r5
    mov r1, r4
    bl TrackedResourceActor_DispatchTargetInteraction
.L_02051c84:
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, pc}
.L_02051c8c: .word gActorRuntimeCollection
    .size TrackedResourceActorType26_HandleCollision, . - TrackedResourceActorType26_HandleCollision

