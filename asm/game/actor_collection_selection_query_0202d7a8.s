; Matching retail form; see src/game/actor_collection_selection_query.c.
.text
.extern Actor_TestQueryPoint
.extern Actor_IsInteractionEligible
.extern ActorRuntimeCollection_GetPendingAttachmentFlag
.extern Type7Actor_GetStateCode
.extern ActorDerivedType1_IsIdleEligible
.extern VecFx32Object_InitComponents
.extern ActorDerivedType1_TrySetStateVector
.extern VecFx32Object_Destroy
.extern Actor_DispatchActivationMode1
.extern gActorRuntimeCollection
.extern data_021052fc

    .global ActorCollection_ProcessSelectionQuery
    .type ActorCollection_ProcessSelectionQuery, @function
ActorCollection_ProcessSelectionQuery: ; 0x0202d7a8
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x10
    mov r10, r0
    ldr r6, [r10, #0x0]
    mov r4, #0x0
    ldr r0, [r6, #0x14]
    mov r9, r1
    tst r0, #0x200000
    moveq r0, #0x1
    movne r0, r4
    mov r5, r4
    cmp r0, #0x0
    beq .L_0202d818
    mov r0, r6
    mov r1, r9
    bl Actor_TestQueryPoint
    cmp r0, #0x0
    beq .L_0202d818
    mov r0, r6
    ldr r2, [r0, #0x0]
    mov r1, r9
    ldr r2, [r2, #0x48]
    blx r2
    mov r4, r0
    mov r0, r6
    bl Actor_IsInteractionEligible
    cmp r0, #0x0
    movne r5, r6
.L_0202d818:
    cmp r4, #0x0
    cmpeq r5, #0x0
    bne .L_0202d9a0
    mvn r6, #0x80000000
    mov r8, #0x2
    add r4, r10, #0x2000
    mov r11, #0x1
    b .L_0202d8a8
.L_0202d838:
    ldr r7, [r10, r8, lsl #0x2]
    cmp r7, #0x0
    beq .L_0202d8a4
    ldr r0, [r7, #0x14]
    tst r0, #0x200000
    moveq r0, r11
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0202d8a4
    mov r0, r7
    mov r1, r9
    bl Actor_TestQueryPoint
    cmp r0, #0x0
    beq .L_0202d8a4
    mov r0, r7
    ldr r2, [r0, #0x0]
    mov r1, r9
    ldr r2, [r2, #0x48]
    blx r2
    ldr r0, [r7, #0x184]
    cmp r0, #0x0
    beq .L_0202d8a4
    ldr r0, [r7, #0x54]
    ldrh r0, [r0, #0x28]
    cmp r0, r6
    movle r6, r0
    movle r5, r7
.L_0202d8a4:
    add r8, r8, #0x1
.L_0202d8a8:
    ldr r0, [r4, #0xe74]
    cmp r8, r0
    blt .L_0202d838
    ldr r4, [r10, #0x4]
    cmp r4, #0x0
    beq .L_0202d9a0
    ldr r0, [r4, #0x14]
    tst r0, #0x200000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0202d9a0
    mov r0, r4
    mov r1, r9
    bl Actor_TestQueryPoint
    cmp r0, #0x0
    beq .L_0202d9a0
    ldr r0, [r4, #0x10]
    tst r0, #0x1000000
    beq .L_0202d93c
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, r9
    ldr r2, [r2, #0x48]
    blx r2
    ldr r0, [r4, #0x54]
    ldrh r0, [r0, #0x28]
    cmp r0, r6
    bgt .L_0202d9a0
    cmp r5, #0x0
    beq .L_0202d934
    mov r0, r5
    bl Actor_IsInteractionEligible
    cmp r0, #0x0
    bne .L_0202d9a0
.L_0202d934:
    mov r5, r4
    b .L_0202d9a0
.L_0202d93c:
    cmp r5, #0x0
    beq .L_0202d954
    mov r0, r5
    bl Actor_IsInteractionEligible
    cmp r0, #0x0
    bne .L_0202d9a0
.L_0202d954:
    ldr r0, .L_0202dae4
    bl ActorRuntimeCollection_GetPendingAttachmentFlag
    cmp r0, #0x0
    bne .L_0202d9a0
    ldr r0, [r4, #0x268]
    tst r0, #0x8000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_0202d9a0
    mov r0, r4
    bl Type7Actor_GetStateCode
    cmp r0, #0x5
    beq .L_0202d9a0
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, r9
    ldr r2, [r2, #0x48]
    blx r2
.L_0202d9a0:
    cmp r5, #0x0
    mov r4, #0x0
    beq .L_0202dad8
    ldr r0, .L_0202dae8
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    bl ActorDerivedType1_IsIdleEligible
    cmp r0, #0x0
    beq .L_0202dad8
    ldr r0, .L_0202dae4
    bl ActorRuntimeCollection_GetPendingAttachmentFlag
    cmp r0, #0x0
    bne .L_0202dad8
    mov r0, r5
    bl Actor_IsInteractionEligible
    cmp r0, #0x0
    bne .L_0202dacc
    ldr r0, [r5, #0x14]
    tst r0, #0x8000000
    beq .L_0202dad8
    ldr r0, .L_0202dae8
    mov r1, #0x1
    ldr r6, [r0, #0x0]
    add r0, r6, #0x2000
    ldr r2, [r0, #0xea8]
    cmp r2, #0x0
    beq .L_0202da78
    ldr r3, [r2, #0x268]
    tst r3, #0x10
    movne r0, r1
    moveq r0, r4
    cmp r0, #0x0
    beq .L_0202da78
    tst r3, #0x400
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0202da78
    ldr r0, [r2, #0x10]
    tst r0, #0x4
    beq .L_0202da78
    ldr r0, [r2, #0x234]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_0202da74
    tst r3, #0x4
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_0202da78
.L_0202da74:
    mov r1, #0x0
.L_0202da78:
    cmp r1, #0x0
    beq .L_0202dad8
    add r0, r6, #0x2000
    ldr r6, [r0, #0xea4]
    ldr r3, [r5, #0x24]
    ldr r0, [r6, #0x24]
    ldr r1, [r9, #0x4]
    sub r2, r0, r3
    ldr r5, [r9, #0x8]
    add r0, sp, #0x0
    mov r1, r1, lsl #0xc
    add r2, r2, r5, lsl #0xc
    bl VecFx32Object_InitComponents
    add r1, sp, #0x0
    mov r0, r6
    mov r2, #0x14
    mov r3, #0x3
    bl ActorDerivedType1_TrySetStateVector
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    b .L_0202dad8
.L_0202dacc:
    mov r0, r5
    bl Actor_DispatchActivationMode1
    mov r4, r0
.L_0202dad8:
    mov r0, r4
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0202dae4: .word gActorRuntimeCollection
.L_0202dae8: .word data_021052fc
    .size ActorCollection_ProcessSelectionQuery, . - ActorCollection_ProcessSelectionQuery
