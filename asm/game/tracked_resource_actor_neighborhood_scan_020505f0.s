; Matching retail form; see src/game/tracked_resource_actor_neighborhood_scan.c.
.extern data_021052fc
.extern gActorRuntimeCollection
.extern VecFx32Object_Init
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern VecFx32Object_Normalize
.extern GamePhaseRuntime_GetActorCollection
.extern ActorRuntimeCollection_GetPendingAttachmentFlag
.extern VecFx32Object_ScaleInPlaceRounded
.extern ActorDerivedType1_StartRecord
.extern Fx32Vector2_Magnitude
.extern TrackedResourceActor_DispatchTargetInteraction
.extern SignedAbsoluteValue
.text
    .global TrackedResourceActor_ScanNeighborhoodAndApplyRecordEffect
TrackedResourceActor_ScanNeighborhoodAndApplyRecordEffect:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x28
    mov r9, r0
    ldr r0, .L_02050a00
    bl ActorRuntimeCollection_GetPendingAttachmentFlag
    cmp r0, #0x0
    bne .L_020509f8
    ldr r0, [r9, #0x1fc]
    mov r1, #0x1
    ldrsb r0, [r0, #0x2c]
    ldr r11, [r9, #0x1c]
    ldr r10, [r9, #0x20]
    cmp r0, #0x1
    cmpne r0, #0x3
    movne r1, #0x0
    cmp r1, #0x0
    moveq r8, #0x1
    add r0, sp, #0x18
    movne r8, #0x0
    bl VecFx32Object_Init
    mvn r0, #0x0
    mov r7, #0x0
    str r0, [sp, #0x4]
    b .L_020509d0
.L_02050650:
    ldr r0, .L_02050a04
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    ldr r6, [r0, r7, lsl #0x2]
    cmp r6, #0x0
    beq .L_020509cc
    ldr r0, [r6, #0xd0]
    tst r0, #0x100
    bne .L_020509cc
    ldrb r0, [r6, #0x4d]
    cmp r0, #0x2
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    bne .L_02050704
    cmp r0, #0x7
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    bne .L_02050704
    cmp r0, #0x1
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    bne .L_02050704
    cmp r0, #0x9
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    bne .L_02050704
    cmp r0, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_020509cc
    ldrh r0, [r6, #0x4e]
    cmp r0, #0x6
    beq .L_02050704
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    cmp r0, #0x0
    beq .L_020509cc
.L_02050704:
    ldr r1, [r6, #0x24]
    ldr r0, [r9, #0x24]
    sub r0, r1, r0
    bl SignedAbsoluteValue
    cmp r0, #0x20000
    bgt .L_020509cc
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x9c]
    blx r1
    ldr r2, [r9, #0x1fc]
    ldr r1, [r6, #0x1c]
    ldrsh r2, [r2, #0x10]
    sub r5, r1, r11
    ldr r1, [r6, #0x20]
    add r4, r2, r0
    sub r0, r1, r10
    str r0, [sp, #0x0]
    ldr r1, [sp, #0x0]
    mov r0, r5
    bl Fx32Vector2_Magnitude
    cmp r0, r4, lsl #0xc
    bge .L_020509cc
    cmp r0, #0x1000
    ble .L_020507d0
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    cmp r0, #0x0
    bne .L_020507d0
    ldr r2, [sp, #0x0]
    mov r1, r5
    add r0, sp, #0x8
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    add r0, sp, #0x8
    bl VecFx32Object_Normalize
    ldr r1, [r9, #0x1fc]
    add r0, sp, #0x8
    ldrsh r1, [r1, #0x2a]
    mov r1, r1, lsl #0x4
    bl VecFx32Object_ScaleInPlaceRounded
    mov r0, r6
    ldr r3, [r0, #0x0]
    add r1, sp, #0x8
    ldr r3, [r3, #0xb8]
    mov r2, r8
    blx r3
    add r0, sp, #0x8
    bl VecFx32Object_Destroy
.L_020507d0:
    ldr r1, [r9, #0x1fc]
    ldrsb r0, [r1, #0x2c]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_020509cc
.L_020507e4: ; jump table
    b .L_020509cc ; case 0
    b .L_020507f8 ; case 1
    b .L_02050854 ; case 2
    b .L_0205082c ; case 3
    b .L_0205092c ; case 4
.L_020507f8:
    ldrb r0, [r6, #0x4d]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_020509cc
    ldrsh r1, [r1, #0x2e]
    ldr r0, [sp, #0x4]
    cmp r1, r0
    moveq r1, #0x7b
    mov r0, r6
    bl ActorDerivedType1_StartRecord
    b .L_020509cc
.L_0205082c:
    ldrb r0, [r6, #0x4d]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_020509cc
    mov r0, r6
    mov r1, #0x80
    bl ActorDerivedType1_StartRecord
    b .L_020509cc
.L_02050854:
    ldrb r0, [r6, #0x4d]
    cmp r0, #0x1
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    beq .L_0205087c
    mov r1, r6
    mov r0, r9
    bl TrackedResourceActor_DispatchTargetInteraction
    b .L_020509cc
.L_0205087c:
    cmp r0, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_020508f8
    ldr r0, [r6, #0x260]
    tst r0, #0x2
    beq .L_020508b8
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_020508bc
.L_020508b8:
    mov r0, #0x0
.L_020508bc:
    cmp r0, #0x0
    bne .L_020508dc
    ldr r0, [r6, #0x260]
    tst r0, #0x200000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_020509cc
.L_020508dc:
    mov r0, r6
    ldr r1, [r9, #0x1fc]
    ldr r2, [r0, #0x0]
    ldrsh r1, [r1, #0xe]
    ldr r2, [r2, #0x1c0]
    blx r2
    b .L_020509cc
.L_020508f8:
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    cmp r0, #0x0
    beq .L_020509cc
    mov r0, r6
    ldr r3, [r0, #0x0]
    mov r1, r9
    ldr r3, [r3, #0xc4]
    mov r2, #0x10000
    blx r3
    b .L_020509cc
.L_0205092c:
    ldrb r0, [r6, #0x4d]
    cmp r0, #0x1
    moveq r2, #0x1
    movne r2, #0x0
    cmp r2, #0x0
    beq .L_02050954
    mov r1, r6
    mov r0, r9
    bl TrackedResourceActor_DispatchTargetInteraction
    b .L_020509cc
.L_02050954:
    cmp r0, #0x7
    moveq r2, #0x1
    movne r2, #0x0
    cmp r2, #0x0
    ldrne r0, [r6, #0x268]
    orrne r0, r0, #0x100000
    strne r0, [r6, #0x268]
    bne .L_020509cc
    cmp r0, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    mov r0, r6
    beq .L_020509a0
    ldr r2, [r0, #0x0]
    ldrsh r1, [r1, #0xe]
    ldr r2, [r2, #0x1c0]
    blx r2
    b .L_020509cc
.L_020509a0:
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    cmp r0, #0x0
    beq .L_020509cc
    mov r0, r6
    ldr r3, [r0, #0x0]
    mov r1, r9
    ldr r3, [r3, #0xc4]
    mov r2, #0x10000
    blx r3
.L_020509cc:
    add r7, r7, #0x1
.L_020509d0:
    ldr r0, .L_02050a04
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe74]
    cmp r7, r0
    blt .L_02050650
    add r0, sp, #0x18
    bl VecFx32Object_Destroy
.L_020509f8:
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02050a00: .word gActorRuntimeCollection
.L_02050a04: .word data_021052fc
    .size TrackedResourceActor_ScanNeighborhoodAndApplyRecordEffect, . - TrackedResourceActor_ScanNeighborhoodAndApplyRecordEffect

