; Matching retail form; see src/game/type7_actor_spawn_from_record.c.
.extern Type7Actor_FindSpawnRecord
.extern GamePhaseMetadata_GetFlagsBits12To15
.extern GamePhaseRuntime_GetActorCollection
.extern ActorCollection_QueueActorForRemoval
.extern ActorSpawnDescriptor_Init
.extern ActorCollection_SpawnActorFromDescriptor
.extern Actor_RefreshTerrainHeight
.extern Actor_GetCachedTerrainHeight
.extern Type7Actor_SetTarget
.extern Type7Actor_MatchesGlobalRecordIndex
.extern func_020befec
.extern func_020beb18
.extern func_020be8c0
.extern func_020beb6c
.extern func_020beae4
.extern Type7Actor_InitializeStationaryMotionState
.extern Type7Actor_FindAuxiliaryRecord
.extern func_02025d14
.extern data_021052fc
.extern data_020e16b0
.extern data_020e5804
.text
    .global Type7Actor_SpawnFromRecord
Type7Actor_SpawnFromRecord: ; 0x0204bf9c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xb0
    mov r10, r0
    mov r9, r1
    mov r8, r2
    mov r11, r3
    bl Type7Actor_FindSpawnRecord
    movs r4, r0
    moveq r0, #0x0
    beq .L_0204c410
    mov r0, r9
    bl GamePhaseMetadata_GetFlagsBits12To15
    ldrb r1, [r4, #0x55]
    cmp r1, #0x0
    cmpne r0, #0x0
    beq .L_0204bff4
    mov r0, r9
    bl GamePhaseMetadata_GetFlagsBits12To15
    ldrb r1, [r4, #0x55]
    cmp r1, r0
    movne r0, #0x0
    bne .L_0204c410
.L_0204bff4:
    ldrh r0, [r4, #0x38]
    mov r6, #0x0
    mov r0, r0, lsl #0x19
    movs r5, r0, lsr #0x1f
    bne .L_0204c034
    ldr r0, .L_0204c418
    ldr r0, [r0, #0x0]
    add r1, r0, #0x2000
    ldr r7, [r1, #0xea8]
    cmp r7, #0x0
    beq .L_0204c034
    mov r1, #0x1
    mov r6, r7
    bl GamePhaseRuntime_GetActorCollection
    mov r1, r7
    bl ActorCollection_QueueActorForRemoval
.L_0204c034:
    ldrh r1, [r4, #0x4]
    mov r0, #0x2
    mov r3, #0x0
    str r1, [sp, #0x0]
    ldrh r1, [r4, #0x6]
    ldr ip, .L_0204c41c
    mov r7, #0xff
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    str r3, [sp, #0xc]
    str r8, [sp, #0x10]
    str r11, [sp, #0x14]
    str r3, [sp, #0x18]
    ldrsb r1, [r4, #0x42]
    add r0, sp, #0x4c
    mov r2, r10
    str r1, [sp, #0x1c]
    ldrsb r8, [r4, #0x43]
    mov r1, #0x7
    str r8, [sp, #0x20]
    str ip, [sp, #0x24]
    str r3, [sp, #0x28]
    str r3, [sp, #0x2c]
    str r3, [sp, #0x30]
    str r3, [sp, #0x34]
    str r7, [sp, #0x38]
    str r3, [sp, #0x3c]
    str r3, [sp, #0x40]
    str r3, [sp, #0x44]
    str r3, [sp, #0x48]
    ldrh r3, [r4, #0x2]
    bl ActorSpawnDescriptor_Init
    cmp r5, #0x0
    moveq r0, #0x1
    streqh r0, [sp, #0x9e]
    movne r0, #0x63
    strneh r0, [sp, #0x9e]
    ldrsb r2, [r4, #0x50]
    ldr r0, .L_0204c418
    mov r1, #0x1
    strh r2, [sp, #0x66]
    ldrsb r2, [r4, #0x51]
    ldr r0, [r0, #0x0]
    strh r2, [sp, #0x68]
    ldrsb r2, [r4, #0x52]
    strh r2, [sp, #0x6a]
    ldrsb r2, [r4, #0x53]
    strh r2, [sp, #0x6c]
    bl GamePhaseRuntime_GetActorCollection
    add r1, sp, #0x4c
    bl ActorCollection_SpawnActorFromDescriptor
    mov r5, r0
    str r4, [r5, #0x29c]
    ldrsb r2, [r4, #0x4c]
    mov r1, #0x1
    strh r2, [r5, #0x60]
    ldrsb r2, [r4, #0x4d]
    strh r2, [r5, #0x62]
    ldrsb r2, [r4, #0x4e]
    strh r2, [r5, #0x64]
    ldrsb r2, [r4, #0x4f]
    strh r2, [r5, #0x66]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x54]
    blx r2
    mov r0, r5
    bl Actor_RefreshTerrainHeight
    mov r0, r5
    bl Actor_GetCachedTerrainHeight
    str r0, [r5, #0x24]
    add r0, r5, #0x200
    strh r9, [r0, #0x7e]
    ldrh r2, [r4, #0x20]
    ldr r1, .L_0204c418
    mov r0, r5
    str r2, [r5, #0x200]
    ldr r1, [r1, #0x0]
    add r1, r1, #0x2000
    ldr r1, [r1, #0xea4]
    bl Type7Actor_SetTarget
    ldr r0, [r5, #0x10]
    bic r0, r0, #0x1000000
    str r0, [r5, #0x10]
    ldrsb r0, [r5, #0x48]
    cmp r0, #0x1
    bne .L_0204c1c8
    ldr r1, .L_0204c420
    ldr r0, [r1, #0x2b4]
    cmp r10, r0
    bne .L_0204c1b0
    ldr r0, .L_0204c424
    cmp r10, r0
    ldrne r0, [r1, #0x2bc]
    strne r0, [r5, #0x1fc]
    bne .L_0204c1d0
.L_0204c1b0:
    ldr r0, .L_0204c420
    str r10, [r0, #0x2b4]
    ldr r1, [r5, #0x200]
    str r1, [r5, #0x1fc]
    str r1, [r0, #0x2bc]
    b .L_0204c1d0
.L_0204c1c8:
    ldr r0, [r5, #0x200]
    str r0, [r5, #0x1fc]
.L_0204c1d0:
    ldr r2, [sp, #0xd8]
    ldr r0, .L_0204c420
    mov r1, #0x0
    str r2, [r0, #0x2b8]
    str r1, [r5, #0x104]
    ldrb r1, [r4, #0x55]
    str r1, [r0, #0x2cc]
    ldrsb r0, [r5, #0x48]
    cmp r0, #0x1
    bne .L_0204c200
    mov r0, r5
    bl Type7Actor_MatchesGlobalRecordIndex
.L_0204c200:
    ldrh r2, [r4, #0x28]
    mov r0, #0x4b0
    mov r1, #0x64
    mul r0, r2, r0
    bl func_020befec
    str r0, [r5, #0x238]
    ldrh r0, [r4, #0x28]
    mov r0, r0, lsl #0x4
    str r0, [r5, #0x23c]
    ldrsh r0, [r4, #0x2a]
    cmp r0, #0x0
    mov r0, r0, lsl #0xc
    ble .L_0204c248
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b .L_0204c254
.L_0204c248:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
.L_0204c254:
    bl func_020beae4
    str r0, [r5, #0x25c]
    ldrsh r0, [r4, #0x2c]
    cmp r0, #0x0
    mov r0, r0, lsl #0xc
    ble .L_0204c280
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b .L_0204c28c
.L_0204c280:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
.L_0204c28c:
    bl func_020beae4
    str r0, [r5, #0x260]
    ldrsh r1, [r4, #0x30]
    add r0, r5, #0x200
    strh r1, [r0, #0x58]
    ldr r0, [r4, #0x44]
    str r0, [r5, #0x294]
    ldr r0, [r4, #0x48]
    str r0, [r5, #0x298]
    ldrh r0, [r4, #0x38]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldreq r0, [r5, #0x268]
    orreq r0, r0, #0x4000
    streq r0, [r5, #0x268]
    ldr r0, [r5, #0x1fc]
    cmp r0, #0x0
    bne .L_0204c2ec
    mov r0, r5
    bl Type7Actor_InitializeStationaryMotionState
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x5c]
    blx r1
.L_0204c2ec:
    ldr r0, .L_0204c418
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    ldr r0, [r0, #0xd0]
    tst r0, #0x40000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_0204c338
    ldr r0, [r5, #0xd0]
    orr r0, r0, #0x40000
    str r0, [r5, #0xd0]
    ldr r0, [r5, #0x10]
    orr r0, r0, #0x100
    str r0, [r5, #0x10]
    ldr r0, [r5, #0x14]
    orr r0, r0, #0x8000
    str r0, [r5, #0x14]
.L_0204c338:
    cmp r6, #0x0
    beq .L_0204c3dc
    mov r9, #0x0
    mov r7, #0x1
    mov r11, r9
    mov r8, r7
    ldr r4, .L_0204c418
    b .L_0204c3c0
.L_0204c358:
    ldr r0, [r4, #0x0]
    mov r1, r8
    bl GamePhaseRuntime_GetActorCollection
    ldr r0, [r0, r9, lsl #0x2]
    cmp r0, #0x0
    beq .L_0204c3bc
    ldrb r1, [r0, #0x4d]
    cmp r1, #0x2
    moveq r1, r7
    movne r1, r11
    cmp r1, #0x0
    beq .L_0204c3bc
    ldr r1, [r0, #0x228]
    cmp r1, r6
    streq r5, [r0, #0x228]
    ldr r1, [r0, #0x264]
    cmp r1, #0x0
    movne r1, #0x1
    moveq r1, #0x0
    cmp r1, #0x0
    beq .L_0204c3bc
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x13c]
    blx r2
.L_0204c3bc:
    add r9, r9, #0x1
.L_0204c3c0:
    ldr r0, [r4, #0x0]
    mov r1, #0x1
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe74]
    cmp r9, r0
    blt .L_0204c358
.L_0204c3dc:
    mov r0, r10
    bl Type7Actor_FindAuxiliaryRecord
    ldr r1, .L_0204c418
    ldrb r2, [r0, #0x13]
    ldr r0, [r1, #0x0]
    ldr r1, .L_0204c428
    add r0, r0, #0x3000
    strh r2, [r1, #0x0]
    ldr r0, [r0, #0xe8]
    bl func_02025d14
    mov r1, #0x0
    strb r1, [r0, #0x8d]
    mov r0, #0x1
.L_0204c410:
    add sp, sp, #0xb0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0204c418: .word data_021052fc
.L_0204c41c: .word 0x2000408
.L_0204c420: .word data_020e16b0
.L_0204c424: .word 0x25b
.L_0204c428: .word data_020e5804
.size Type7Actor_SpawnFromRecord, . - Type7Actor_SpawnFromRecord
