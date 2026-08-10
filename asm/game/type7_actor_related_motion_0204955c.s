; Matching retail form; see src/game/type7_actor_related_motion.c.
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern Type7Actor_UpdateMotionTowardTransform
.extern Type7Actor_ResetInteractionState
.extern Type7Actor_UpdateFlag14Bit2FromCondition
.extern Type7Actor_UpdateFlag14Bit4FromCondition
.extern Type7Actor_DispatchCurrentCallback
.extern Type7Actor_TryCancelDistantTarget
.extern Type7Actor_TryAcquireTarget
.extern Type7Actor_AdjustDestinationForCollisions
.text
    .global Type7Actor_UpdateMotionFromRelatedTransform
.type Type7Actor_UpdateMotionFromRelatedTransform, @function
Type7Actor_UpdateMotionFromRelatedTransform: ; 0x0204955c
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    ldr r1, [r4, #0x268]
    orr r1, r1, #0x8000
    str r1, [r4, #0x268]
    ldr r1, [r4, #0xd0]
    orr r1, r1, #0x2
    str r1, [r4, #0xd0]
    ldr r1, [r4, #0x210]
    cmp r1, #0x0
    bne .L_02049598
    bl Type7Actor_ResetInteractionState
    mov r0, #0x0
    b .L_02049604
.L_02049598:
    ldr r3, [r1, #0x0]
    add r0, sp, #0x0
    ldr r3, [r3, #0xb4]
    mov r2, r4
    blx r3
    add r1, sp, #0x0
    mov r0, r4
    bl Type7Actor_UpdateMotionTowardTransform
    ldr r0, [r4, #0xd0]
    tst r0, #0x40000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_020495f8
    ldr r1, [r4, #0x210]
    ldrb r0, [r1, #0x4d]
    cmp r0, #0x4
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldrneh r0, [r1, #0x4e]
    cmpne r0, #0x12
    movne r0, #0xe
    strneh r0, [r4, #0xd6]
.L_020495f8:
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    mov r0, #0x0
.L_02049604:
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.size Type7Actor_UpdateMotionFromRelatedTransform, . - Type7Actor_UpdateMotionFromRelatedTransform

    .global Type7Actor_UpdateResourceDependentMotion
.type Type7Actor_UpdateResourceDependentMotion, @function
Type7Actor_UpdateResourceDependentMotion: ; 0x0204960c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x234]
    cmp r0, #0x0
    movne r4, #0x1
    moveq r4, #0x0
    mov r0, r5
    mov r1, r4
    bl Type7Actor_UpdateFlag14Bit2FromCondition
    mov r0, r5
    mov r1, r4
    bl Type7Actor_UpdateFlag14Bit4FromCondition
    mov r0, r5
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x54]
    blx r2
    cmp r4, #0x0
    ldrne r1, [r5, #0x210]
    mov r0, r5
    cmpne r1, #0x0
    beq .L_02049670
    add r1, r1, #0x18
    bl Type7Actor_UpdateMotionTowardTransform
    b .L_02049678
.L_02049670:
    add r1, r5, #0x18
    bl Type7Actor_UpdateMotionTowardTransform
.L_02049678:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.size Type7Actor_UpdateResourceDependentMotion, . - Type7Actor_UpdateResourceDependentMotion

    .global Type7Actor_UpdateResourceDependentFlags
.type Type7Actor_UpdateResourceDependentFlags, @function
Type7Actor_UpdateResourceDependentFlags: ; 0x02049680
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x234]
    mov r1, #0x0
    cmp r0, #0x0
    mov r0, r5
    ldr r2, [r0, #0x0]
    movne r4, #0x1
    ldr r2, [r2, #0x54]
    moveq r4, #0x0
    blx r2
    mov r0, r5
    mov r1, r4
    bl Type7Actor_UpdateFlag14Bit2FromCondition
    mov r0, r5
    mov r1, r4
    bl Type7Actor_UpdateFlag14Bit4FromCondition
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.size Type7Actor_UpdateResourceDependentFlags, . - Type7Actor_UpdateResourceDependentFlags

    .global Type7Actor_UpdateAcquiredTargetMotion
.type Type7Actor_UpdateAcquiredTargetMotion, @function
Type7Actor_UpdateAcquiredTargetMotion: ; 0x020496cc
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x268]
    add r1, r4, #0x200
    orr r2, r2, #0x8000
    str r2, [r4, #0x268]
    ldr r3, [r4, #0xd0]
    mvn r2, #0x0
    orr r3, r3, #0x2
    str r3, [r4, #0xd0]
    strh r2, [r1, #0x4a]
    ldr r1, [r4, #0x210]
    cmp r1, #0x0
    bne .L_02049710
    bl Type7Actor_ResetInteractionState
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_02049710:
    mov r1, #0x1
    bl Type7Actor_TryAcquireTarget
    cmp r0, #0x0
    mov r0, r4
    bne .L_02049730
    bl Type7Actor_DispatchCurrentCallback
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_02049730:
    bl Type7Actor_TryCancelDistantTarget
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0x268]
    tst r0, #0x4
    beq .L_02049758
    add r0, r4, #0x78
    add r1, r4, #0x224
    bl VecFx32Object_Assign
.L_02049758:
    ldr r1, [r4, #0x210]
    add r0, r4, #0x78
    add r1, r1, #0x18
    bl VecFx32Object_Assign
    mov r0, r4
    bl Type7Actor_AdjustDestinationForCollisions
    mov r0, r4
    add r1, r4, #0x78
    bl Type7Actor_UpdateMotionTowardTransform
    ldr r0, [r4, #0x210]
    ldrb r0, [r0, #0x4d]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    moveq r0, #0xe
    movne r0, #0xa
    strh r0, [r4, #0xd6]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size Type7Actor_UpdateAcquiredTargetMotion, . - Type7Actor_UpdateAcquiredTargetMotion

