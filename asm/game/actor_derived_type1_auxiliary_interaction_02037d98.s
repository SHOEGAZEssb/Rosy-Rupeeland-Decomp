; Matching retail form; see src/game/actor_derived_type1_auxiliary_interaction.c.
.text
.extern GameWork_SetFlag
.extern Heap_Alloc
.extern Heap_Free
.extern SceneManager_GetCurrent
.extern data_020df48c
.extern data_021052fc
.extern data_02105310
.extern data_021f5ebc
.extern ActorMotionJitter_EnsureMinimum
.extern ActorRuntimeCollection_GetBusyState
.extern func_02032a94
.extern Actor_IsAtCachedTerrainHeight
.extern ActorDerivedType1_HasBlockingStateFlags
.extern ActorDerivedType1_IsTargetStateEligible
.extern ActorDerivedType1_ReleaseAuxiliaryAndSpawnResetEffect
.extern ActorDerivedType1_ApplyWeightedCollisionDisplacement
.extern ActorDerivedType1_TeardownActiveRecord
.extern Type7Actor_HandleResourceInteraction
.extern func_0206c68c
.extern func_0206c978
.extern func_0206cb04
.extern func_0206e3a4
.extern func_020828a0
.extern gGameWork
.extern gHeapContext
.extern gSceneManager

    .global ActorDerivedType1_HandleAuxiliaryInteraction
    .type ActorDerivedType1_HandleAuxiliaryInteraction, @function
ActorDerivedType1_HandleAuxiliaryInteraction: ; 0x02037d98
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    mov r4, r1
    bl func_02032a94
    ldr r0, .L_02038088
    ldr r0, [r0, #0x0]
    bl SceneManager_GetCurrent
    ldr r0, [r0, #0x4]
    cmp r0, #0x2
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, .L_0203808c
    bl ActorRuntimeCollection_GetBusyState
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r5
    bl ActorDerivedType1_HasBlockingStateFlags
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldrsh r0, [r5, #0xd6]
    cmp r0, #0xd
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r5, #0x230]
    tst r0, #0x20000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r5, #0xd0]
    tst r0, #0x100
    bne .L_02038080
    ldr r0, [r4, #0x10]
    tst r0, #0x1000000
    bne .L_02038080
    mov r0, r5
    bl Actor_IsAtCachedTerrainHeight
    cmp r0, #0x0
    beq .L_02038080
    ldrb r0, [r4, #0x4d]
    cmp r0, #0x2
    beq .L_02037e58
    cmp r0, #0x7
    beq .L_02037fc0
    b .L_02038080
.L_02037e58:
    ldr r0, .L_02038090
    mov r1, #0x40
    bl func_020828a0
    cmp r0, #0x0
    bne .L_02038080
    add r0, r5, #0x200
    ldrsh r0, [r0, #0x68]
    cmp r0, #0x0
    bgt .L_02038080
    mov r0, r5
    bl ActorDerivedType1_TeardownActiveRecord
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1ac]
    blx r1
    cmp r0, #0x0
    beq .L_02037f4c
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    bne .L_02037f08
    ldr r6, [r5, #0x26c]
    cmp r6, #0x0
    beq .L_02037ed0
    mov r0, r6
    bl func_0206c978
    mov r0, r6
    bl Heap_Free
.L_02037ed0:
    ldr r1, .L_02038094
    ldr r3, .L_02038098
    mov r0, #0xb4
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02037ef4
    mov r1, r5
    bl func_0206c68c
.L_02037ef4:
    ldr r1, .L_0203809c
    str r0, [r5, #0x26c]
    ldr r0, [r1, #0x0]
    ldr r1, .L_020380a0
    bl GameWork_SetFlag
.L_02037f08:
    ldr r0, [r5, #0x26c]
    mov r1, r4
    mov r2, #0x1
    bl func_0206cb04
    cmp r0, #0x0
    beq .L_02038080
    ldr r1, [r5, #0x10]
    ldr r0, .L_020380a4
    bic r1, r1, #0x1f0000
    str r1, [r5, #0x10]
    ldr r0, [r0, #0x0]
    mov r1, #0x14
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    mov r2, #0x2
    bl ActorMotionJitter_EnsureMinimum
    b .L_02038080
.L_02037f4c:
    ldr r0, [r4, #0x260]
    tst r0, #0x1
    beq .L_02038080
    add r1, r4, #0x200
    mov r0, r4
    ldrsb r6, [r1, #0x7f]
    bl ActorDerivedType1_IsTargetStateEligible
    cmp r0, #0x0
    addne r0, r4, #0x200
    ldrnesh r0, [r0, #0x9e]
    addne r6, r6, r0
    mov r0, r4
    bl ActorDerivedType1_IsTargetStateEligible
    cmp r0, #0x0
    bne .L_02037fa0
    ldrb r0, [r4, #0x24c]
    cmp r0, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02037fa8
.L_02037fa0:
    mov r0, r5
    bl ActorDerivedType1_ReleaseAuxiliaryAndSpawnResetEffect
.L_02037fa8:
    mov r0, r5
    mov r1, r4
    mov r3, r6
    mov r2, #0x14
    bl ActorDerivedType1_ApplyWeightedCollisionDisplacement
    b .L_02038080
.L_02037fc0:
    ldr r0, .L_02038090
    mov r1, #0x40
    bl func_020828a0
    cmp r0, #0x0
    bne .L_02038080
    ldr r6, [r4, #0x234]
    cmp r6, #0x0
    beq .L_02037ff4
    mov r0, r6
    bl func_0206e3a4
    cmp r0, #0x0
    moveq r7, #0x1
    beq .L_02037ff8
.L_02037ff4:
    mov r7, #0x0
.L_02037ff8:
    ldr r0, [r5, #0x26c]
    cmp r0, #0x0
    bne .L_0203804c
    cmp r7, #0x0
    beq .L_0203804c
    mov r0, r5
    bl ActorDerivedType1_TeardownActiveRecord
    ldr r1, .L_02038094
    ldr r3, .L_02038098
    mov r0, #0xb4
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02038038
    mov r1, r5
    bl func_0206c68c
.L_02038038:
    ldr r1, .L_0203809c
    str r0, [r5, #0x26c]
    ldr r0, [r1, #0x0]
    ldr r1, .L_020380a0
    bl GameWork_SetFlag
.L_0203804c:
    ldr r0, [r5, #0x26c]
    cmp r0, #0x0
    beq .L_02038080
    cmp r6, #0x0
    beq .L_02038068
    cmp r7, #0x0
    beq .L_02038080
.L_02038068:
    ldr r1, [r5, #0x10]
    mov r0, r4
    bic r1, r1, #0x1f0000
    str r1, [r5, #0x10]
    ldr r1, [r5, #0x26c]
    bl Type7Actor_HandleResourceInteraction
.L_02038080:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02038088: .word gSceneManager
.L_0203808c: .word data_02105310
.L_02038090: .word data_021f5ebc
.L_02038094: .word data_020df48c
.L_02038098: .word gHeapContext
.L_0203809c: .word gGameWork
.L_020380a0: .word 0x3ee
.L_020380a4: .word data_021052fc
    .size ActorDerivedType1_HandleAuxiliaryInteraction, . - ActorDerivedType1_HandleAuxiliaryInteraction
