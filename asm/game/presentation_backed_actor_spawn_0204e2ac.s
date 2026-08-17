; Matching retail form; see src/game/presentation_backed_actor_spawn.c.
.extern data_021052fc
.extern VecFx32Object_Assign
.extern GamePhaseRuntime_GetActorCollection
.extern ActorCollection_SpawnActorFromDescriptor
.extern ActorSpawnDescriptor_Init
.extern PresentationBackedActor_SetPlaybackParameters
.text

    .global PresentationBackedActor_Spawn
PresentationBackedActor_Spawn: ; 0x0204e2ac
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0xb0
    mov ip, r0
    cmp ip, #0x12
    mov r5, r1
    mov r4, r2
    mov lr, #0x2
    ldreq r0, .L_0204e3ec
    beq .L_0204e2e0
    ldr r0, [sp, #0xd8]
    cmp r0, #0x0
    ldr r0, .L_0204e3ec
    orrne r0, r0, #0x200
.L_0204e2e0:
    ldr r2, [sp, #0xc8]
    ldr r1, [sp, #0xcc]
    str r2, [sp, #0x0]
    str r1, [sp, #0x4]
    ldr r1, [sp, #0xd0]
    str lr, [sp, #0x8]
    str r1, [sp, #0xc]
    ldr r1, [r3, #0x4]
    mov r2, #0x14
    mov r1, r1, asr #0xc
    str r1, [sp, #0x10]
    ldr lr, [r3, #0x8]
    mov r1, #0x4
    mov lr, lr, asr #0xc
    str lr, [sp, #0x14]
    ldr r3, [r3, #0xc]
    mov lr, #0x0
    mov r3, r3, asr #0xc
    str r3, [sp, #0x18]
    str r2, [sp, #0x1c]
    str r1, [sp, #0x20]
    str r0, [sp, #0x24]
    str lr, [sp, #0x28]
    str lr, [sp, #0x2c]
    str lr, [sp, #0x30]
    str lr, [sp, #0x34]
    mov r0, #0xff
    str r0, [sp, #0x38]
    str lr, [sp, #0x3c]
    str lr, [sp, #0x40]
    str lr, [sp, #0x44]
    ldr r3, [sp, #0xc4]
    add r0, sp, #0x4c
    mov r2, ip
    str lr, [sp, #0x48]
    bl ActorSpawnDescriptor_Init
    ldr r0, .L_0204e3f0
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    add r1, sp, #0x4c
    bl ActorCollection_SpawnActorFromDescriptor
    mov r2, r5
    ldr r5, [sp, #0xd4]
    ldr r3, [sp, #0xd0]
    mov r1, r4
    and r5, r5, #0xff
    and r3, r3, #0xff
    mov r4, r0
    str r5, [sp, #0x0]
    bl PresentationBackedActor_SetPlaybackParameters
    ldr r1, [sp, #0xc0]
    add r0, r4, #0x38
    bl VecFx32Object_Assign
    ldr r1, [r4, #0x10]
    mvn r0, #0xf
    orr r1, r1, #0x100
    orr r1, r1, #0x1f0000
    str r1, [r4, #0x10]
    strh r0, [r4, #0x60]
    strh r0, [r4, #0x62]
    mov r0, #0x10
    strh r0, [r4, #0x64]
    strh r0, [r4, #0x66]
    mov r0, r4
    add sp, sp, #0xb0
    ldmia sp!, {r3, r4, r5, pc}
.L_0204e3ec: .word 0x8018
.L_0204e3f0: .word data_021052fc
.size PresentationBackedActor_Spawn, . - PresentationBackedActor_Spawn

