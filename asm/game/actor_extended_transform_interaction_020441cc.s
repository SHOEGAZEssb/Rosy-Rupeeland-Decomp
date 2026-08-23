; Matching retail form; see src/game/actor_extended_transform_interaction.c.
.text
.extern data_020c9670
.extern data_020e0f28
.extern data_021052fc
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern VecFx32_Subtract
.extern GamePhaseRuntime_GetActorCollection
.extern Fx32Vector2_Magnitude
.extern func_020ae024
.global ActorExtendedTransform_UpdateTargetMotion
.type ActorExtendedTransform_UpdateTargetMotion, @function
ActorExtendedTransform_UpdateTargetMotion: ; 0x020441cc
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x48
    ldr r2, [r0, #0x0]
    mov r6, r0
    ldr r2, [r2, #0x1d4]
    mov r4, r1
    blx r2
    cmp r0, #0x0
    bne .L_020443dc
    mov r1, r4
    add r2, r6, #0x200
    mov r3, #0x0
    add r0, r6, #0x78
    strh r3, [r2, #0x98]
    bl VecFx32Object_Assign
    add r0, sp, #0x38
    add r1, r6, #0x78
    add r2, r6, #0x18
    bl VecFx32_Subtract
    ldr r0, [sp, #0x3c]
    ldr r1, [sp, #0x40]
    bl Fx32Vector2_Magnitude
    mov r5, r0
    cmp r5, #0x1000
    ble .L_02044364
    mov r0, r6
    ldr r2, [r0, #0x0]
    add r1, sp, #0x8
    ldr r2, [r2, #0xc8]
    blx r2
    ldr r0, [r6, #0xd0]
    tst r0, #0x2
    beq .L_020442b8
    add r0, r6, #0x200
    ldrh r2, [r0, #0x56]
    ldr r1, .L_020443e4
    ldr r0, [r1, #0x0]
    mov r1, #0x1
    mov r4, r2, asr #0x2
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe7c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    ldrnesh r3, [sp, #0xc]
    ldrh r2, [sp, #0xe]
    ldr r1, .L_020443e8
    ldreqsh r3, [sp, #0xa]
    mov r0, #0x3c
    add r2, r3, r2, lsl #0x4
    mla r0, r2, r0, r1
    mov r1, r4, lsl #0x1
    ldrh r0, [r1, r0]
    cmp r5, r0, lsl #0x4
    mov r0, r0, lsl #0x4
    movge r5, r0
    b .L_020442c0
.L_020442b8:
    ldrsh r0, [sp, #0x8]
    mov r5, r0, lsl #0x4
.L_020442c0:
    mov r0, #0x100
    strh r0, [r6, #0xde]
    cmp r5, #0x0
    ble .L_02044358
    ldr r0, [sp, #0x40]
    ldr r1, [sp, #0x3c]
    bl func_020ae024
    mov r0, r0, asr #0x4
    mov r3, r0, lsl #0x1
    add r0, r3, #0x1
    mov r2, r0, lsl #0x1
    ldr r1, .L_020443ec
    mov r0, r3, lsl #0x1
    ldrsh r2, [r1, r2]
    ldrsh r1, [r1, r0]
    mov r0, r6
    mul r2, r5, r2
    mul r1, r5, r1
    mov r2, r2, asr #0xc
    mov r1, r1, asr #0xc
    str r2, [sp, #0x4]
    str r1, [sp, #0x0]
    ldr r3, [r0, #0x0]
    add r1, sp, #0x4
    ldr r3, [r3, #0x1d8]
    add r2, sp, #0x0
    blx r3
    ldr r0, [sp, #0x4]
    str r0, [r6, #0x3c]
    ldr r0, [sp, #0x0]
    str r0, [r6, #0x40]
    ldr r0, [r6, #0xd0]
    tst r0, #0x2
    movne r0, #0x6
    strneh r0, [r6, #0xd6]
    moveq r0, #0x5
    streqh r0, [r6, #0xd6]
    b .L_020443a4
.L_02044358:
    mov r0, #0x2
    strh r0, [r6, #0xd6]
    b .L_020443a4
.L_02044364:
    ldrsh r0, [r6, #0xd8]
    cmp r0, #0x6
    bne .L_02044390
    ldr r0, [r6, #0x3c]
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    str r0, [r6, #0x8c]
    ldr r0, [r6, #0x40]
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    str r0, [r6, #0x90]
.L_02044390:
    mov r0, #0x0
    str r0, [r6, #0x40]
    str r0, [r6, #0x3c]
    mov r0, #0x1
    strh r0, [r6, #0xd6]
.L_020443a4:
    ldr r0, [r6, #0xd0]
    tst r0, #0x4
    beq .L_020443d4
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x30]
    blx r1
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x94]
    strne r0, [r6, #0x90]
    strne r0, [r6, #0x8c]
.L_020443d4:
    add r0, sp, #0x38
    bl VecFx32Object_Destroy
.L_020443dc:
    add sp, sp, #0x48
    ldmia sp!, {r4, r5, r6, pc}
.L_020443e4: .word data_021052fc
.L_020443e8: .word data_020e0f28
.L_020443ec: .word data_020c9670
.size ActorExtendedTransform_UpdateTargetMotion, . - ActorExtendedTransform_UpdateTargetMotion
