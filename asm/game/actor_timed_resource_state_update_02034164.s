; Matching retail form; see src/game/actor_timed_resource_state_update.c.
.text
.extern data_021052fc
.extern data_02105310
.extern GamePhaseRuntime_GetActorCollection
.extern ActorRuntimeCollection_GetPrimaryContainer
.extern ActorRuntimeCollection_TryCompleteAttachment
.extern GamePhaseScriptVm_Execute
.extern GamePhaseActorScriptVm_Assign
.extern func_0201b228
.extern func_0201b23c
.extern ActorCollection_QueueActorForRemoval
.extern ActorCollection_EndTrackedPair
.extern Actor_UpdateAttachmentDirectionFromVector
.extern Actor_GetCollection

    .global func_02034164
    .type func_02034164, @function
func_02034164: ; 0x02034164
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    add r0, r4, #0xec
    bl func_0201b23c
    cmp r0, #0x0
    beq .L_02034250
    add r0, r4, #0xec
    mov r1, #0x0
    bl GamePhaseScriptVm_Execute
    ldrb r0, [r4, #0x169]
    tst r0, #0x1
    beq .L_02034250
    ldrb r0, [r4, #0xe8]
    cmp r0, #0x0
    beq .L_0203422c
    ldr r0, .L_02034258
    mov r1, r4
    bl ActorRuntimeCollection_TryCompleteAttachment
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrb r0, [r4, #0xe8]
    cmp r0, #0x2
    beq .L_020341f0
    ldr r0, .L_0203425c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    mov r5, r0
    mov r0, r4
    bl Actor_GetCollection
    add r1, r5, #0x2000
    ldr r1, [r1, #0xe7c]
    mov r2, r4
    bl ActorCollection_EndTrackedPair
.L_020341f0:
    ldr r0, .L_02034258
    mov r1, #0x0
    strb r1, [r4, #0xe8]
    bl ActorRuntimeCollection_GetPrimaryContainer
    mov r1, r0
    add r0, r4, #0xec
    bl GamePhaseActorScriptVm_Assign
    add r0, r4, #0xec
    bl func_0201b228
    ldr r2, [r4, #0x40]
    ldr r1, [r4, #0x3c]
    adds r0, r1, r2
    beq .L_0203422c
    mov r0, r4
    bl Actor_UpdateAttachmentDirectionFromVector
.L_0203422c:
    ldr r0, [r4, #0x14]
    tst r0, #0x20
    beq .L_02034250
    mov r0, r4
    bl Actor_GetCollection
    mov r1, r4
    bl ActorCollection_QueueActorForRemoval
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_02034250:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_02034258: .word data_02105310
.L_0203425c: .word data_021052fc
    .size func_02034164, . - func_02034164

    .global func_02034260
