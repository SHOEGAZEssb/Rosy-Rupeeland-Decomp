; Matching retail form; see src/game/actor_descriptor_batch_spawn.c.
.text
.extern GameWork_ClearFlag
.extern GameWork_TestFlag
.extern data_020e1964
.extern data_021052fc
.extern gActorCategory1DescriptorTable
.extern GamePhaseRuntime_GetActorCollection
.extern func_02028508
.extern ActorCollection_SpawnActorFromDescriptor
.extern ActorSpawnDescriptor_Init
.extern Type7Actor_SpawnFromRecord
.extern gGameWork
    .global ActorDescriptorBatch_RegisterAndSpawn
    .type ActorDescriptorBatch_RegisterAndSpawn, @function
ActorDescriptorBatch_RegisterAndSpawn: ; 0x0203af24
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0xb0
    mov r9, r3
    mov r10, r2
    cmp r9, #0x1
    bne .L_0203b1f0
    ldr r0, .L_0203b370
    mov r1, r9
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe7c]
    cmp r0, #0x0
    bne .L_0203b024
    ldr r0, .L_0203b370
    mvn r3, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    add r0, r0, #0x3000
    ldr r5, [r0, #0xbc]
    mov r0, #0x2
    str r3, [sp, #0x0]
    str r3, [sp, #0x4]
    str r0, [sp, #0x8]
    str r2, [sp, #0xc]
    ldr r0, [r5, #0x2c]
    mov r4, #0x18
    str r0, [sp, #0x10]
    ldr r5, [r5, #0x30]
    mov r1, #0x8
    str r5, [sp, #0x14]
    str r2, [sp, #0x18]
    str r4, [sp, #0x1c]
    sub r0, r1, #0xfe000000
    str r1, [sp, #0x20]
    str r0, [sp, #0x24]
    str r2, [sp, #0x28]
    str r2, [sp, #0x2c]
    str r2, [sp, #0x30]
    str r2, [sp, #0x34]
    mov r0, #0xff
    str r0, [sp, #0x38]
    str r2, [sp, #0x3c]
    str r2, [sp, #0x40]
    str r2, [sp, #0x44]
    add r0, sp, #0x4c
    mov r1, #0x1
    str r2, [sp, #0x48]
    bl ActorSpawnDescriptor_Init
    ldr r0, .L_0203b370
    mov r2, #0x0
    ldr r0, [r0, #0x0]
    mov r1, r9
    strh r2, [sp, #0x9e]
    bl GamePhaseRuntime_GetActorCollection
    add r1, sp, #0x4c
    bl ActorCollection_SpawnActorFromDescriptor
    ldr r2, [r0, #0x230]
    mov r1, #0x1
    orr r2, r2, #0x4
    str r2, [r0, #0x230]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x54]
    blx r2
.L_0203b024:
    ldr r0, .L_0203b370
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3000
    ldr r0, [r0, #0xbc]
    ldr r0, [r0, #0x0]
    cmp r0, #0x29
    bne .L_0203b050
    ldr r0, .L_0203b374
    mov r1, #0x10
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
.L_0203b050:
    ldr r0, .L_0203b370
    ldr r5, .L_0203b378
    ldr r0, [r0, #0x0]
    add r1, r0, #0x3000
    ldr r1, [r1, #0xbc]
    ldr r1, [r1, #0x0]
    cmp r1, #0x5a
    mvneq r0, #0x0
    streq r0, [r5, #0x0]
    beq .L_0203b1e4
    mov r1, r9
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe80]
    cmp r0, #0x0
    bne .L_0203b1e4
    ldr r0, .L_0203b374
    mov r1, #0x10
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne .L_0203b1e4
    ldr r1, [r5, #0x0]
    mvn r0, #0x0
    cmp r1, r0
    beq .L_0203b1e4
    ldr r0, [r5, #0x1c]
    mov r6, #0x0
    cmp r0, #0x0
    beq .L_0203b0f8
    ldr r0, .L_0203b370
    mov r1, r9
    ldr r0, [r0, #0x0]
    mov r6, #0x1
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe7c]
    ldr r1, [r0, #0x1c]
    ldr r0, [r0, #0x20]
    mov r7, r1, asr #0xc
    mov r8, r0, asr #0xc
    b .L_0203b1b0
.L_0203b0f8:
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    ble .L_0203b188
    ldr r0, .L_0203b370
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3000
    ldr r0, [r0, #0xbc]
    ldr r0, [r0, #0x0]
    bl func_02028508
    mov r4, r0
    ldr r0, [r5, #0xc]
    bl func_02028508
    ldr r1, [r5, #0x18]
    cmp r1, #0x0
    cmpne r4, #0x0
    cmpne r0, #0x0
    cmpne r0, r4
    bne .L_0203b1b0
    ldr r0, .L_0203b370
    mov r1, r9
    ldr r0, [r0, #0x0]
    mov r6, #0x1
    bl GamePhaseRuntime_GetActorCollection
    ldr r1, .L_0203b370
    add r0, r0, #0x2000
    ldr r3, [r0, #0xe7c]
    ldr r0, [r1, #0x0]
    ldr r2, [r3, #0x1c]
    add r0, r0, #0x3000
    ldr r0, [r0, #0xbc]
    ldr r1, [r3, #0x20]
    ldr r0, [r0, #0x0]
    mov r7, r2, asr #0xc
    str r0, [r5, #0xc]
    mov r8, r1, asr #0xc
    b .L_0203b1b0
.L_0203b188:
    ldr r0, .L_0203b370
    ldr r1, [r5, #0xc]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3000
    ldr r0, [r0, #0xbc]
    ldr r0, [r0, #0x0]
    cmp r1, r0
    ldreq r7, [r5, #0x10]
    ldreq r8, [r5, #0x14]
    moveq r6, #0x1
.L_0203b1b0:
    cmp r6, #0x0
    beq .L_0203b1e4
    ldr r1, [r5, #0x4]
    ldr r0, .L_0203b370
    str r1, [sp, #0x0]
    ldr r1, [r0, #0x0]
    ldr r0, [r5, #0x0]
    add r1, r1, #0x3000
    ldr r1, [r1, #0xbc]
    mov r2, r7
    ldr r1, [r1, #0x0]
    mov r3, r8
    bl Type7Actor_SpawnFromRecord
.L_0203b1e4:
    ldr r0, .L_0203b37c
    str r10, [r0, #0x0]
    b .L_0203b298
.L_0203b1f0:
    cmp r9, #0x2
    bne .L_0203b298
    ldr r0, .L_0203b380
    ldr r3, .L_0203b384
    mov r1, #0x3
    stmia sp, {r0, r3}
    mov r0, #0x2
    str r0, [sp, #0x8]
    mov r0, #0x1d
    str r0, [sp, #0xc]
    mov r4, #0x0
    str r4, [sp, #0x10]
    str r4, [sp, #0x14]
    str r4, [sp, #0x18]
    str r4, [sp, #0x1c]
    ldr r0, .L_0203b388
    str r4, [sp, #0x20]
    str r0, [sp, #0x24]
    str r4, [sp, #0x28]
    str r4, [sp, #0x2c]
    str r4, [sp, #0x30]
    str r4, [sp, #0x34]
    mov r0, #0x1
    str r0, [sp, #0x38]
    str r4, [sp, #0x3c]
    str r4, [sp, #0x40]
    str r4, [sp, #0x44]
    add r0, sp, #0x4c
    mov r2, r1
    sub r3, r3, #0x1
    str r4, [sp, #0x48]
    bl ActorSpawnDescriptor_Init
    ldr r0, .L_0203b370
    mov r2, r4
    ldr r0, [r0, #0x0]
    mov r1, r9
    strh r2, [sp, #0x9e]
    bl GamePhaseRuntime_GetActorCollection
    add r1, sp, #0x4c
    bl ActorCollection_SpawnActorFromDescriptor
    ldr r0, .L_0203b37c
    str r10, [r0, #0x4]
.L_0203b298:
    mvn r3, #0x0
    mov r4, #0x0
    str r3, [sp, #0x0]
    stmib sp, {r3, r4}
    str r4, [sp, #0xc]
    sub r0, r4, #0x64
    str r0, [sp, #0x10]
    str r0, [sp, #0x14]
    str r4, [sp, #0x18]
    str r4, [sp, #0x1c]
    str r4, [sp, #0x20]
    mov r0, #0x8
    str r0, [sp, #0x24]
    str r4, [sp, #0x28]
    str r4, [sp, #0x2c]
    str r4, [sp, #0x30]
    str r4, [sp, #0x34]
    mov r0, #0xff
    str r0, [sp, #0x38]
    str r4, [sp, #0x3c]
    str r4, [sp, #0x40]
    str r4, [sp, #0x44]
    add r0, sp, #0x4c
    mov r1, #0x3
    mov r2, #0x4
    str r4, [sp, #0x48]
    bl ActorSpawnDescriptor_Init
    ldr r0, .L_0203b370
    mov r2, #0x2
    ldr r0, [r0, #0x0]
    mov r1, r9
    strh r2, [sp, #0x9e]
    bl GamePhaseRuntime_GetActorCollection
    add r1, sp, #0x4c
    bl ActorCollection_SpawnActorFromDescriptor
    ldr r4, .L_0203b370
    b .L_0203b35c
.L_0203b32c:
    ldr r0, [r10, #0x28]
    orr r0, r0, #0x8
    str r0, [r10, #0x28]
    ldrsh r0, [r10, #0x50]
    cmp r0, #0x0
    blt .L_0203b358
    ldr r0, [r4, #0x0]
    mov r1, r9
    bl GamePhaseRuntime_GetActorCollection
    mov r1, r10
    bl ActorCollection_SpawnActorFromDescriptor
.L_0203b358:
    add r10, r10, #0x64
.L_0203b35c:
    ldrh r0, [r10, #0x0]
    cmp r0, #0x0
    bne .L_0203b32c
    add sp, sp, #0xb0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_0203b370: .word data_021052fc
.L_0203b374: .word gGameWork
.L_0203b378: .word data_020e1964
.L_0203b37c: .word gActorCategory1DescriptorTable
.L_0203b380: .word 0x1078
.L_0203b384: .word 0x138b
.L_0203b388: .word 0x4088008

    .size ActorDescriptorBatch_RegisterAndSpawn, . - ActorDescriptorBatch_RegisterAndSpawn

