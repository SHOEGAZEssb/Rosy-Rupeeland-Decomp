; Matching retail form; see src/game/actor_descriptor_batch_wrappers.c.
.text
.extern data_020df500
.extern ActorDescriptorBatch_RegisterAndSpawn
    .global ActorDescriptorBatch_RegisterAndSpawnCategory1
    .type ActorDescriptorBatch_RegisterAndSpawnCategory1, @function
ActorDescriptorBatch_RegisterAndSpawnCategory1: ; 0x0203b38c
    ldr ip, .L_0203b398
    mov r3, #0x1
    bx ip
.L_0203b398: .word ActorDescriptorBatch_RegisterAndSpawn
    .size ActorDescriptorBatch_RegisterAndSpawnCategory1, . - ActorDescriptorBatch_RegisterAndSpawnCategory1

    .global ActorDescriptorBatch_RegisterAndSpawnCategory2
    .type ActorDescriptorBatch_RegisterAndSpawnCategory2, @function
ActorDescriptorBatch_RegisterAndSpawnCategory2: ; 0x0203b39c
    ldr ip, .L_0203b3a8
    mov r3, #0x2
    bx ip
.L_0203b3a8: .word ActorDescriptorBatch_RegisterAndSpawn
    .size ActorDescriptorBatch_RegisterAndSpawnCategory2, . - ActorDescriptorBatch_RegisterAndSpawnCategory2

    .global ActorDescriptorBatch_SetCategory1Callback
    .type ActorDescriptorBatch_SetCategory1Callback, @function
ActorDescriptorBatch_SetCategory1Callback: ; 0x0203b3ac
    ldr r1, .L_0203b3b8
    str r0, [r1, #0x0]
    bx lr
.L_0203b3b8: .word data_020df500
    .size ActorDescriptorBatch_SetCategory1Callback, . - ActorDescriptorBatch_SetCategory1Callback

    .global ActorDescriptorBatch_SetCategory2Callback
    .type ActorDescriptorBatch_SetCategory2Callback, @function
ActorDescriptorBatch_SetCategory2Callback: ; 0x0203b3bc
    ldr r1, .L_0203b3c8
    str r0, [r1, #0x4]
    bx lr
.L_0203b3c8: .word data_020df500
    .size ActorDescriptorBatch_SetCategory2Callback, . - ActorDescriptorBatch_SetCategory2Callback


