; Matching retail form; see src/game/actor_collection_callback_apply.c.
.text
.extern data_020df500
.extern data_021052fc
.extern GamePhaseRuntime_GetActorCollection
.extern ActorCollection_FindActorByTypeAndId
.extern Actor_SetActive
    .global ActorDescriptorBatch_ApplyCategoryCallback
    .type ActorDescriptorBatch_ApplyCategoryCallback, @function
ActorDescriptorBatch_ApplyCategoryCallback: ; 0x0203b3cc
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    cmp r0, #0x0
    bne .L_0203b43c
    ldr r0, .L_0203b50c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    mov r1, #0x3
    mov r2, #0x4
    bl ActorCollection_FindActorByTypeAndId
    ldr r2, [r0, #0x0]
    mov r4, r0
    ldr r2, [r2, #0x74]
    mov r1, #0x0
    blx r2
    mov r0, r4
    ldr r3, [r0, #0x0]
    ldr r1, .L_0203b510
    ldr r3, [r3, #0xac]
    ldr r2, [r1, #0x0]
    mov r1, #0x4
    blx r3
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, #0x4
    ldr r2, [r2, #0x78]
    blx r2
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_0203b43c:
    ldr r0, .L_0203b50c
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    mov r1, #0x3
    mov r2, #0x4
    bl ActorCollection_FindActorByTypeAndId
    ldr r2, [r0, #0x0]
    mov r4, r0
    ldr r2, [r2, #0x74]
    mov r1, #0x0
    blx r2
    mov r0, r4
    ldr r3, [r0, #0x0]
    ldr r1, .L_0203b510
    ldr r3, [r3, #0xac]
    ldr r2, [r1, #0x4]
    mov r1, #0x4
    blx r3
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, #0x4
    ldr r2, [r2, #0x78]
    blx r2
    mov r6, #0x2
    mov r8, #0x0
    mov r5, #0x1
    mov r7, r6
    mov r4, r6
    ldr r9, .L_0203b50c
    b .L_0203b4ec
.L_0203b4b8:
    ldr r0, [r9, #0x0]
    mov r1, r7
    bl GamePhaseRuntime_GetActorCollection
    ldr r0, [r0, r8, lsl #0x2]
    cmp r0, #0x0
    beq .L_0203b4e8
    ldr r0, [r9, #0x0]
    mov r1, r6
    bl GamePhaseRuntime_GetActorCollection
    ldr r0, [r0, r8, lsl #0x2]
    mov r1, r5
    bl Actor_SetActive
.L_0203b4e8:
    add r8, r8, #0x1
.L_0203b4ec:
    ldr r0, [r9, #0x0]
    mov r1, r4
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe74]
    cmp r8, r0
    blt .L_0203b4b8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_0203b50c: .word data_021052fc
.L_0203b510: .word data_020df500

    .size ActorDescriptorBatch_ApplyCategoryCallback, . - ActorDescriptorBatch_ApplyCategoryCallback
