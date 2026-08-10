; Matching retail form; see src/game/grid_effect_actor_spawn.c.
.extern data_021052fc
.extern GamePhaseRuntime_GetActorCollection
.extern func_02028388
.extern ActorCollection_SpawnActorFromDescriptor
.extern ActorSpawnDescriptor_Init
.extern GridEffectActorRegistry_AcquireSlot
.extern func_02062728
.extern func_02062918
.extern func_02063064
.extern func_02063074
.extern func_02063084
.extern func_02063190
.text

    .global GridEffectActor_SpawnCore
GridEffectActor_SpawnCore: ; 0x0204f62c
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0xb0
    mov r7, r0
    mov r6, r1
    mov r5, r2
    bl GridEffectActorRegistry_AcquireSlot
    movs r4, r0
    moveq r0, #0x0
    beq .L_0204f7d4
    mov r0, r6
    mov r1, #0x0
    bl func_02062918
    bl func_02063064
    mov r10, r0
    mov r0, r6
    mov r1, #0x0
    bl func_02062918
    bl func_02063074
    mov r9, r0
    mov r0, r6
    mov r1, #0x0
    bl func_02062918
    bl func_02063084
    mov r8, r0
    mov r0, r6
    mov r1, #0x0
    bl func_02062918
    bl func_02063190
    str r9, [sp, #0x0]
    str r8, [sp, #0x4]
    mov r1, #0x2
    str r1, [sp, #0x8]
    str r0, [sp, #0xc]
    ldr r0, [r7, #0x4]
    mov r2, #0x14
    mov r0, r0, asr #0xc
    str r0, [sp, #0x10]
    ldr r0, [r7, #0x8]
    mov r1, #0x4
    mov r0, r0, asr #0xc
    str r0, [sp, #0x14]
    ldr r7, [r7, #0xc]
    ldr r0, .L_0204f7dc
    mov r7, r7, asr #0xc
    str r7, [sp, #0x18]
    str r2, [sp, #0x1c]
    str r1, [sp, #0x20]
    str r0, [sp, #0x24]
    mov r7, #0x0
    str r7, [sp, #0x28]
    str r7, [sp, #0x2c]
    str r7, [sp, #0x30]
    str r7, [sp, #0x34]
    mov r0, #0xff
    str r0, [sp, #0x38]
    str r7, [sp, #0x3c]
    str r7, [sp, #0x40]
    str r7, [sp, #0x44]
    mov r3, r10
    add r0, sp, #0x4c
    str r7, [sp, #0x48]
    bl ActorSpawnDescriptor_Init
    ldr r0, .L_0204f7e0
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x24]
    ldr r0, [r0, #0x0]
    sub r0, r0, #0x1
    bl func_02028388
    ldr r0, [r0, #0x40]
    mov r1, #0x1
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x1e
    cmp r0, #0x3
    ldreq r0, [sp, #0x74]
    orreq r0, r0, #0x1
    streq r0, [sp, #0x74]
    ldr r0, .L_0204f7e0
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    add r1, sp, #0x4c
    bl ActorCollection_SpawnActorFromDescriptor
    str r0, [r4, #0x0]
    add r2, r0, #0x200
    mov r1, r6
    strh r5, [r2, #0x18]
    add r0, r0, #0x1f4
    bl func_02062728
    ldr r3, [r4, #0x0]
    mvn r2, #0xf
    ldr r0, [r3, #0x10]
    mov r1, #0x10
    orr r0, r0, #0x100
    str r0, [r3, #0x10]
    ldr r3, [r4, #0x0]
    ldr r0, [r3, #0x10]
    orr r0, r0, #0x1f0000
    str r0, [r3, #0x10]
    ldr r0, [r4, #0x0]
    strh r2, [r0, #0x60]
    ldr r0, [r4, #0x0]
    strh r2, [r0, #0x62]
    ldr r0, [r4, #0x0]
    strh r1, [r0, #0x64]
    ldr r0, [r4, #0x0]
    strh r1, [r0, #0x66]
    ldr r0, [r4, #0x0]
.L_0204f7d4:
    add sp, sp, #0xb0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
.L_0204f7dc: .word 0x8218
.L_0204f7e0: .word data_021052fc
.size GridEffectActor_SpawnCore, . - GridEffectActor_SpawnCore

