; Matching retail form; see src/game/actor_collection_pair_processing.c.
.text
.extern data_021052fc
.extern gActorRuntimeCollection
.extern gActorRuntimeFlags
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern ActorCollision_ResolveCornerContacts
.extern ActorCollision_ResolveSweptMovement
.extern ActorRuntimeCollection_GetPendingAttachmentFlag
.extern ActorPairMatrix_Get
.extern ActorPairMatrix_Clear
.extern ActorCollection_NotifyPairActive
.extern ActorCollection_NotifyPairEnded
.extern Actor_BuildCollisionRect
.extern func_02056f34
.extern ActorRuntimeFlags_Test
.extern func_020adc90
.extern SignedAbsoluteValue

    .global ActorCollection_ProcessCategory1And2Pairs
    .type ActorCollection_ProcessCategory1And2Pairs, @function
ActorCollection_ProcessCategory1And2Pairs: ; 0x0202e15c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x88
    ldr r1, .L_0202e844
    mov r10, r0
    ldr r1, [r1, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x14]
    str r0, [sp, #0x10]
    add r0, r10, #0x400
    add r1, r1, #0x2000
    str r0, [sp, #0x18]
    ldr r0, [r1, #0xed4]
    str r0, [sp, #0x24]
    ldr r0, [r10, #0xe24]
    str r0, [sp, #0x20]
    ldr r0, [r10, #0xe28]
    str r0, [sp, #0x1c]
    b .L_0202e82c
.L_0202e1a4:
    ldr r0, [sp, #0x18]
    ldr r4, [r0, #0x0]
    ldr r0, [r4, #0x14]
    tst r0, #0x2
    bne .L_0202e814
    ldr r0, [sp, #0x14]
    str r0, [sp, #0xc]
    ldrsb r0, [r4, #0x48]
    str r0, [sp, #0x4]
    add r0, r10, #0x234
    str r0, [sp, #0x30]
    mvn r0, #0x0
    str r0, [sp, #0x2c]
    b .L_0202e758
.L_0202e1dc:
    ldr r0, [sp, #0xc]
    ldr r1, [sp, #0x4]
    add r0, r10, r0, lsl #0x2
    ldr r5, [r0, #0x600]
    ldrsb r0, [r5, #0x48]
    str r0, [sp, #0x0]
    cmp r1, r0
    bge .L_0202e740
    ldr r0, [r5, #0x14]
    tst r0, #0x4
    bne .L_0202e74c
    ldr r1, [r5, #0x10]
    mov r0, r4
    and r6, r1, #0x1f0000
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    tst r0, r6
    bne .L_0202e74c
    ldr r1, [r4, #0x10]
    mov r0, r5
    and r6, r1, #0x1f0000
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    tst r0, r6
    bne .L_0202e74c
    ldr r0, [r4, #0x14]
    ldr r1, [r5, #0x14]
    tst r0, #0x800000
    orr r0, r0, r1
    and r6, r0, #0x10
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0202e2a0
    tst r1, #0x800000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0202e2a0
    ldr r1, [r4, #0x24]
    ldr r0, [r5, #0x24]
    sub r0, r1, r0
    bl SignedAbsoluteValue
    cmp r0, #0x1000
    movge r0, #0x0
    strge r0, [sp, #0x8]
    bge .L_0202e63c
.L_0202e2a0:
    add r0, sp, #0x68
    add r1, r4, #0x18
    bl VecFx32Object_InitCopy
    add r0, sp, #0x38
    mov r1, r4
    add r2, sp, #0x68
    bl Actor_BuildCollisionRect
    add r0, sp, #0x68
    bl VecFx32Object_Destroy
    add r0, sp, #0x78
    add r1, r5, #0x18
    bl VecFx32Object_InitCopy
    add r0, sp, #0x48
    mov r1, r5
    add r2, sp, #0x78
    bl Actor_BuildCollisionRect
    add r0, sp, #0x78
    bl VecFx32Object_Destroy
    mov r0, #0x0
    str r0, [sp, #0x58]
    str r0, [sp, #0x5c]
    str r0, [sp, #0x60]
    str r0, [sp, #0x64]
    add r0, sp, #0x58
    add r1, sp, #0x38
    add r2, sp, #0x48
    add r3, sp, #0x34
    bl func_02056f34
    str r0, [sp, #0x8]
    cmp r0, #0x0
    beq .L_0202e338
    ldr r0, [sp, #0x34]
    and r0, r0, #0xf
    strb r0, [r4, #0x49]
    ldr r0, [sp, #0x34]
    mov r0, r0, lsr #0x8
    and r0, r0, #0xf
    strb r0, [r5, #0x49]
.L_0202e338:
    ldr r0, [sp, #0x8]
    cmp r0, #0x2
    cmpeq r6, #0x0
    bne .L_0202e63c
    ldr r2, [r4, #0x1c]
    ldr r0, [r4, #0x2c]
    ldr r1, [r4, #0x20]
    sub r11, r2, r0
    ldr r0, [r4, #0x30]
    ldr r2, [r5, #0x1c]
    sub r6, r1, r0
    ldr r0, [r5, #0x2c]
    ldr r1, [r5, #0x20]
    sub r7, r2, r0
    ldr r0, [r5, #0x30]
    ldr r2, [sp, #0x60]
    sub r8, r1, r0
    ldr r1, [sp, #0x58]
    mov r0, r7
    sub r9, r2, r1
    bl SignedAbsoluteValue
    str r0, [sp, #0x28]
    mov r0, r11
    bl SignedAbsoluteValue
    ldr r1, [sp, #0x28]
    add r1, r0, r1
    cmp r9, r1
    bgt .L_0202e4dc
    cmp r11, #0x0
    bne .L_0202e3f0
    cmp r7, #0x0
    ble .L_0202e3d0
    ldrb r0, [r5, #0x49]
    tst r0, #0x2
    ldrne r0, [r5, #0x1c]
    subne r0, r0, r9
    strne r0, [r5, #0x1c]
    bne .L_0202e4dc
.L_0202e3d0:
    cmp r7, #0x0
    bge .L_0202e4dc
    ldrb r0, [r5, #0x49]
    tst r0, #0x1
    ldrne r0, [r5, #0x1c]
    addne r0, r0, r9
    strne r0, [r5, #0x1c]
    b .L_0202e4dc
.L_0202e3f0:
    cmp r7, #0x0
    bne .L_0202e438
    cmp r11, #0x0
    ble .L_0202e418
    ldrb r0, [r4, #0x49]
    tst r0, #0x2
    ldrne r0, [r4, #0x1c]
    subne r0, r0, r9
    strne r0, [r4, #0x1c]
    bne .L_0202e4dc
.L_0202e418:
    cmp r11, #0x0
    bge .L_0202e4dc
    ldrb r0, [r4, #0x49]
    tst r0, #0x1
    ldrne r0, [r4, #0x1c]
    addne r0, r0, r9
    strne r0, [r4, #0x1c]
    b .L_0202e4dc
.L_0202e438:
    smull r3, r2, r9, r7
    mov r0, #0x800
    adds r3, r3, r0
    mov r0, #0x0
    adc r2, r2, r0
    mov r0, r3, lsr #0xc
    orr r0, r0, r2, lsl #0x14
    bl func_020adc90
    mov r7, r0
    bl SignedAbsoluteValue
    cmp r11, #0x0
    movgt r2, #0x1
    ldrle r2, [sp, #0x2c]
    sub r0, r9, r0
    mul r1, r2, r0
    cmp r1, #0x0
    ble .L_0202e488
    ldrb r0, [r4, #0x49]
    tst r0, #0x2
    bne .L_0202e49c
.L_0202e488:
    cmp r1, #0x0
    bge .L_0202e4a8
    ldrb r0, [r4, #0x49]
    tst r0, #0x1
    beq .L_0202e4a8
.L_0202e49c:
    ldr r0, [r4, #0x1c]
    sub r0, r0, r1
    str r0, [r4, #0x1c]
.L_0202e4a8:
    cmp r7, #0x0
    ble .L_0202e4bc
    ldrb r0, [r5, #0x49]
    tst r0, #0x2
    bne .L_0202e4d0
.L_0202e4bc:
    cmp r7, #0x0
    bge .L_0202e4dc
    ldrb r0, [r5, #0x49]
    tst r0, #0x1
    beq .L_0202e4dc
.L_0202e4d0:
    ldr r0, [r5, #0x1c]
    sub r0, r0, r7
    str r0, [r5, #0x1c]
.L_0202e4dc:
    ldr r2, [sp, #0x64]
    ldr r1, [sp, #0x5c]
    mov r0, r8
    sub r7, r2, r1
    bl SignedAbsoluteValue
    mov r9, r0
    mov r0, r6
    bl SignedAbsoluteValue
    add r1, r0, r9
    cmp r7, r1
    bgt .L_0202e63c
    cmp r6, #0x0
    bne .L_0202e550
    cmp r8, #0x0
    ble .L_0202e530
    ldrb r0, [r5, #0x49]
    tst r0, #0x8
    ldrne r0, [r5, #0x20]
    subne r0, r0, r7
    strne r0, [r5, #0x20]
    bne .L_0202e63c
.L_0202e530:
    cmp r8, #0x0
    bge .L_0202e63c
    ldrb r0, [r5, #0x49]
    tst r0, #0x4
    ldrne r0, [r5, #0x20]
    addne r0, r0, r7
    strne r0, [r5, #0x20]
    b .L_0202e63c
.L_0202e550:
    cmp r8, #0x0
    bne .L_0202e598
    cmp r6, #0x0
    ble .L_0202e578
    ldrb r0, [r4, #0x49]
    tst r0, #0x8
    ldrne r0, [r4, #0x20]
    subne r0, r0, r7
    strne r0, [r4, #0x20]
    bne .L_0202e63c
.L_0202e578:
    cmp r6, #0x0
    bge .L_0202e63c
    ldrb r0, [r4, #0x49]
    tst r0, #0x4
    ldrne r0, [r4, #0x20]
    addne r0, r0, r7
    strne r0, [r4, #0x20]
    b .L_0202e63c
.L_0202e598:
    smull r3, r2, r7, r8
    mov r0, #0x800
    adds r3, r3, r0
    mov r0, #0x0
    adc r2, r2, r0
    mov r0, r3, lsr #0xc
    orr r0, r0, r2, lsl #0x14
    bl func_020adc90
    mov r8, r0
    bl SignedAbsoluteValue
    cmp r6, #0x0
    movgt r2, #0x1
    ldrle r2, [sp, #0x2c]
    sub r0, r7, r0
    mul r1, r2, r0
    cmp r1, #0x0
    ble .L_0202e5e8
    ldrb r0, [r4, #0x49]
    tst r0, #0x8
    bne .L_0202e5fc
.L_0202e5e8:
    cmp r1, #0x0
    bge .L_0202e608
    ldrb r0, [r4, #0x49]
    tst r0, #0x4
    beq .L_0202e608
.L_0202e5fc:
    ldr r0, [r4, #0x20]
    sub r0, r0, r1
    str r0, [r4, #0x20]
.L_0202e608:
    cmp r8, #0x0
    ble .L_0202e61c
    ldrb r0, [r5, #0x49]
    tst r0, #0x8
    bne .L_0202e630
.L_0202e61c:
    cmp r8, #0x0
    bge .L_0202e63c
    ldrb r0, [r5, #0x49]
    tst r0, #0x4
    beq .L_0202e63c
.L_0202e630:
    ldr r0, [r5, #0x20]
    sub r0, r0, r8
    str r0, [r5, #0x20]
.L_0202e63c:
    ldr r0, [sp, #0x8]
    cmp r0, #0x0
    beq .L_0202e6ec
    ldr r0, [sp, #0x30]
    ldr r1, [sp, #0x0]
    ldr r2, [sp, #0x4]
    add r0, r0, #0xc00
    mov r6, #0x0
    bl ActorPairMatrix_Get
    cmp r0, #0x0
    movne r7, #0x1
    moveq r7, r6
    mov r0, r10
    mov r1, r4
    mov r2, r5
    mov r3, r7
    bl ActorCollection_NotifyPairActive
    add r6, r6, r0
    mov r1, r5
    mov r3, r7
    mov r0, r10
    mov r2, r4
    bl ActorCollection_NotifyPairActive
    add r0, r6, r0
    cmp r0, #0x2
    bne .L_0202e74c
    ldr r1, [sp, #0x4]
    ldr r0, [sp, #0x0]
    mov r2, r1
    cmp r1, r0
    movgt r2, r0
    movgt r0, r1
    strgt r0, [sp, #0x0]
    ldr r0, [sp, #0x0]
    add r1, r10, r0
    add r0, r2, #0x1
    mul r0, r2, r0
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    rsb r0, r0, r2, lsl #0x7
    add r1, r0, r1
    mov r0, #0x1
    strb r0, [r1, #0xe34]
    b .L_0202e74c
.L_0202e6ec:
    ldr r0, [sp, #0x30]
    ldr r1, [sp, #0x0]
    ldr r2, [sp, #0x4]
    add r0, r0, #0xc00
    bl ActorPairMatrix_Get
    cmp r0, #0x0
    beq .L_0202e74c
    mov r0, r10
    mov r1, r4
    mov r2, r5
    bl ActorCollection_NotifyPairEnded
    mov r1, r5
    mov r0, r10
    mov r2, r4
    bl ActorCollection_NotifyPairEnded
    ldr r0, [sp, #0x30]
    ldr r1, [sp, #0x0]
    ldr r2, [sp, #0x4]
    add r0, r0, #0xc00
    bl ActorPairMatrix_Clear
    b .L_0202e74c
.L_0202e740:
    ldr r0, [sp, #0x14]
    add r0, r0, #0x1
    str r0, [sp, #0x14]
.L_0202e74c:
    ldr r0, [sp, #0xc]
    add r0, r0, #0x1
    str r0, [sp, #0xc]
.L_0202e758:
    ldr r1, [sp, #0xc]
    ldr r0, [sp, #0x1c]
    cmp r1, r0
    blt .L_0202e1dc
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    beq .L_0202e808
    ldrb r0, [r4, #0x4d]
    cmp r0, #0x1
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    bne .L_0202e7a0
    cmp r0, #0x7
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0202e7ec
.L_0202e7a0:
    ldr r0, [r4, #0x14]
    tst r0, #0x40
    bne .L_0202e814
    ldr r0, .L_0202e848
    mov r1, #0x1
    bl ActorRuntimeFlags_Test
    cmp r0, #0x0
    bne .L_0202e814
    ldr r0, .L_0202e84c
    bl ActorRuntimeCollection_GetPendingAttachmentFlag
    cmp r0, #0x0
    bne .L_0202e7dc
    ldr r1, [sp, #0x24]
    mov r0, r4
    bl ActorCollision_ResolveCornerContacts
.L_0202e7dc:
    ldr r1, [sp, #0x24]
    mov r0, r4
    bl ActorCollision_ResolveSweptMovement
    b .L_0202e814
.L_0202e7ec:
    ldr r0, [r4, #0x14]
    tst r0, #0x100
    bne .L_0202e814
    ldr r1, [sp, #0x24]
    mov r0, r4
    bl ActorCollision_ResolveSweptMovement
    b .L_0202e814
.L_0202e808:
    ldr r1, [sp, #0x24]
    mov r0, r4
    bl ActorCollision_ResolveSweptMovement
.L_0202e814:
    ldr r0, [sp, #0x10]
    add r0, r0, #0x1
    str r0, [sp, #0x10]
    ldr r0, [sp, #0x18]
    add r0, r0, #0x4
    str r0, [sp, #0x18]
.L_0202e82c:
    ldr r1, [sp, #0x10]
    ldr r0, [sp, #0x20]
    cmp r1, r0
    blt .L_0202e1a4
    add sp, sp, #0x88
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0202e844: .word data_021052fc
.L_0202e848: .word gActorRuntimeFlags
.L_0202e84c: .word gActorRuntimeCollection
    .size ActorCollection_ProcessCategory1And2Pairs, . - ActorCollection_ProcessCategory1And2Pairs
