; Matching retail form; see src/game/runtime_actor_variant_update.c.
.extern Actor_MarkFrameUpdateStarted
.extern GamePhaseActorScriptVm_IsActive
.extern GamePhaseScriptVm_Execute
.extern ActorRuntimeCollection_TryCompleteAttachment
.extern Actor_GetGlobalCollectionBySlot
.extern Actor_GetOwningCollection
.extern ActorCollection_EndTrackedPair
.extern ActorRuntimeCollection_GetPrimaryContainer
.extern GamePhaseActorScriptVm_Assign
.extern GamePhaseActorScriptVm_Activate
.extern ActorCollection_QueueActorForRemoval
.extern gActorRuntimeCollection
.text
    .global RuntimeActorScriptVariant_Update
RuntimeActorScriptVariant_Update: ; 0x0204d308
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl Actor_MarkFrameUpdateStarted
    add r0, r4, #0xec
    bl GamePhaseActorScriptVm_IsActive
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    add r0, r4, #0xec
    mov r1, #0x0
    bl GamePhaseScriptVm_Execute
    ldrb r0, [r4, #0x169]
    tst r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrb r0, [r4, #0xe8]
    cmp r0, #0x0
    beq .L_0204d3b4
    ldr r0, .L_0204d3d4
    mov r1, r4
    bl ActorRuntimeCollection_TryCompleteAttachment
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrb r0, [r4, #0xe8]
    cmp r0, #0x2
    beq .L_0204d390
    mov r0, r4
    mov r1, #0x1
    bl Actor_GetGlobalCollectionBySlot
    mov r5, r0
    mov r0, r4
    bl Actor_GetOwningCollection
    add r1, r5, #0x2000
    ldr r1, [r1, #0xe7c]
    mov r2, r4
    bl ActorCollection_EndTrackedPair
.L_0204d390:
    ldr r0, .L_0204d3d4
    mov r1, #0x0
    strb r1, [r4, #0xe8]
    bl ActorRuntimeCollection_GetPrimaryContainer
    mov r1, r0
    add r0, r4, #0xec
    bl GamePhaseActorScriptVm_Assign
    add r0, r4, #0xec
    bl GamePhaseActorScriptVm_Activate
.L_0204d3b4:
    ldr r0, [r4, #0x14]
    tst r0, #0x20
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r4
    bl Actor_GetOwningCollection
    mov r1, r4
    bl ActorCollection_QueueActorForRemoval
    ldmia sp!, {r3, r4, r5, pc}
.L_0204d3d4: .word gActorRuntimeCollection
.size RuntimeActorScriptVariant_Update, . - RuntimeActorScriptVariant_Update
