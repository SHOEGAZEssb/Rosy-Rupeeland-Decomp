; Matching retail form; see src/game/actor_derived_type1_target_displacement.c.
.text
.extern Heap_Alloc
.extern data_020c9670
.extern data_020df4a4
.extern data_021052fc
.extern VecFx32Object_Init
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern VecFx32Object_Subtract
.extern VecFx32_Subtract
.extern func_02008378
.extern ActorMotionJitter_EnsureMinimum
.extern ActorMotionAreaFollower_GetPosition
.extern GamePhaseCurrencyHud_AddCurrency
.extern PresentationList_AppendObject
.extern func_0201e0ec
.extern func_02022cb0
.extern Actor_PlayHorizontalSpatialSound
.extern ActorDerivedType1_IsTargetStateEligible
.extern ActorVector_DivideByScalar
.extern Type1Actor_TryEnterFailureState
.extern ActorExtendedType2_GetDescriptorValue28
.extern Fx32Vector2_LimitMagnitude
.extern EffectManager_SubmitPointEffect
.extern func_020ada8c
.extern func_020adae4
.extern func_020ae024
.extern gHeapContext
.extern gLupyContext
.extern genrand_int32

    .global ActorDerivedType1_ApplyWeightedCollisionDisplacement
    .type ActorDerivedType1_ApplyWeightedCollisionDisplacement, @function
ActorDerivedType1_ApplyWeightedCollisionDisplacement: ; 0x0203825c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x78
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r11, r3
    add r0, sp, #0x68
    add r1, r7, #0x18
    add r2, r7, #0x28
    add r4, r5, r11
    bl VecFx32_Subtract
    add r0, sp, #0x58
    add r1, r6, #0x18
    add r2, r6, #0x28
    bl VecFx32_Subtract
    add r0, sp, #0x68
    add r1, sp, #0x58
    bl VecFx32Object_Subtract
    mov r0, r4, lsl #0xc
    mov r1, #0x32
    bl func_020adae4
    smull r2, r1, r0, r0
    adds r2, r2, #0x800
    rsb r9, r0, #0x1000
    mov r3, r0, lsl #0x1
    adc r0, r1, #0x0
    mov r8, r2, lsr #0xc
    orr r8, r8, r0, lsl #0x14
    smull r2, r1, r3, r9
    mov r0, #0x5000
    smull ip, r3, r9, r9
    umull r10, r9, r8, r0
    mov r0, #0x0
    mla r9, r8, r0, r9
    mov lr, r8, asr #0x1f
    mov r0, #0x5000
    adds r8, r10, #0x800
    mla r9, lr, r0, r9
    adc r0, r9, #0x0
    mov r8, r8, lsr #0xc
    adds r9, ip, #0x800
    orr r8, r8, r0, lsl #0x14
    adc r0, r3, #0x0
    mov r3, r9, lsr #0xc
    orr r3, r3, r0, lsl #0x14
    mov r0, r3, asr #0x1f
    mov r9, r0, lsl #0xd
    mov r0, #0x800
    adds r0, r0, r3, lsl #0xd
    orr r9, r9, r3, lsr #0x13
    adc r3, r9, #0x0
    adds r2, r2, #0x800
    mov r0, r0, lsr #0xc
    adc r1, r1, #0x0
    mov r2, r2, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    mov r1, #0x800
    adds r1, r1, r2, lsl #0xe
    orr r0, r0, r3, lsl #0x14
    mov r3, r1, lsr #0xc
    mov r1, r2, asr #0x1f
    mov r1, r1, lsl #0xe
    orr r1, r1, r2, lsr #0x12
    adc r1, r1, #0x0
    orr r3, r3, r1, lsl #0x14
    add r0, r0, r3
    add r8, r8, r0
    cmp r8, #0xa000
    movgt r8, #0xa000
    ldr r3, [r6, #0x20]
    ldr r0, [r7, #0x20]
    ldr r2, [r6, #0x1c]
    ldr r1, [r7, #0x1c]
    sub r0, r3, r0
    sub r1, r2, r1
    bl func_020ae024
    mov r9, r0
    ldr r0, [sp, #0x6c]
    mov r1, #0x2
    bl func_020adae4
    str r0, [sp, #0x6c]
    ldr r0, [sp, #0x70]
    mov r1, #0x2
    bl func_020adae4
    mov r1, r9, asr #0x4
    mov r3, r1, lsl #0x1
    add r1, r3, #0x1
    mov r9, r1, lsl #0x1
    ldr r10, .L_02038770
    mov r3, r3, lsl #0x1
    ldrsh r9, [r10, r9]
    ldr r2, [sp, #0x6c]
    ldrsh r3, [r10, r3]
    add r2, r2, r9
    str r0, [sp, #0x70]
    add r0, r0, r3
    smull r10, r9, r2, r8
    smull r3, r2, r0, r8
    adds r8, r10, #0x800
    adc r0, r9, #0x0
    mov r8, r8, lsr #0xc
    adds r3, r3, #0x800
    orr r8, r8, r0, lsl #0x14
    adc r0, r2, #0x0
    mov r9, r3, lsr #0xc
    orr r9, r9, r0, lsl #0x14
    mul r0, r8, r11
    mov r1, r4
    bl func_020adae4
    ldr r2, [r7, #0x8c]
    mov r1, r4
    sub r0, r2, r0
    str r0, [r7, #0x8c]
    mul r0, r9, r11
    bl func_020adae4
    ldr r2, [r7, #0x90]
    add r1, r7, #0x90
    sub r0, r2, r0
    str r0, [r7, #0x90]
    add r0, r7, #0x8c
    mov r2, #0x6000
    bl Fx32Vector2_LimitMagnitude
    mov r1, #0x0
    str r1, [r7, #0x40]
    str r1, [r7, #0x3c]
    ldr r0, [r6, #0x260]
    tst r0, #0x8000
    movne r1, #0x1
    cmp r1, #0x0
    bne .L_020384b0
    mul r0, r8, r5
    mov r1, r4
    bl func_020adae4
    ldr r2, [r6, #0x8c]
    mov r1, r4
    add r2, r2, r0
    mul r0, r9, r5
    str r2, [r6, #0x8c]
    bl func_020adae4
    ldr r2, [r6, #0x90]
    add r1, r6, #0x90
    add r3, r2, r0
    add r0, r6, #0x8c
    mov r2, #0x6000
    str r3, [r6, #0x90]
    bl Fx32Vector2_LimitMagnitude
    mov r0, #0x0
    str r0, [r6, #0x40]
    str r0, [r6, #0x3c]
.L_020384b0:
    ldr r0, [r6, #0x264]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_020384d8
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xf0]
    blx r1
.L_020384d8:
    add r0, r7, #0x200
    ldrsh r0, [r0, #0x68]
    cmp r0, #0x0
    ble .L_020384fc
    add r0, sp, #0x58
    bl VecFx32Object_Destroy
    add r0, sp, #0x68
    bl VecFx32Object_Destroy
    b .L_02038768
.L_020384fc:
    add r0, sp, #0x18
    add r1, r6, #0x18
    add r2, r7, #0x18
    bl VecFx32_Subtract
    add r0, sp, #0x8
    add r1, sp, #0x18
    mov r2, #0x2000
    bl ActorVector_DivideByScalar
    add r0, sp, #0x48
    add r2, sp, #0x8
    add r1, r7, #0x18
    bl func_02008378
    add r0, sp, #0x8
    bl VecFx32Object_Destroy
    add r0, sp, #0x18
    bl VecFx32Object_Destroy
    ldr r0, .L_02038774
    ldr r1, [sp, #0x54]
    ldr r0, [r0, #0x0]
    ldr r2, [sp, #0x50]
    rsb r1, r1, #0x18000
    add r0, r0, #0x37c
    add r1, r2, r1
    add r0, r0, #0x2c00
    str r1, [sp, #0x50]
    bl func_0201e0ec
    mov r1, #0x0
    str r1, [sp, #0x0]
    ldr r2, [sp, #0x4c]
    ldr r3, [sp, #0x50]
    mov r1, #0x1
    bl EffectManager_SubmitPointEffect
    mov r0, r6
    mov r4, #0x0
    bl ActorDerivedType1_IsTargetStateEligible
    cmp r0, #0x0
    beq .L_020385e0
    add r0, r6, #0x200
    ldrsh r5, [r0, #0x9e]
    ldr r3, [r7, #0x20]
    ldr r0, [r6, #0x20]
    ldr r2, [r7, #0x1c]
    ldr r1, [r6, #0x1c]
    sub r0, r3, r0
    sub r1, r2, r1
    add r9, r5, #0x4
    bl func_020ae024
    ldr r1, [r7, #0xc8]
    sub r0, r0, #0x4000
    cmp r0, r1
    addlt r0, r0, #0x10000
    sub r0, r0, r1
    cmp r0, #0x8000
    rsbgt r0, r0, #0x10000
    cmp r0, #0x4000
    movlt r4, #0x1
    b .L_020385e4
.L_020385e0:
    mov r9, #0x1
.L_020385e4:
    mov r0, r6
    bl ActorExtendedType2_GetDescriptorValue28
    mov r1, #0xa
    mov r8, r0
    bl func_020adae4
    mov r6, r0
    bl genrand_int32
    bic r10, r0, #0x80000000
    mov r0, r6
    mov r1, #0x2
    bl func_020adae4
    mov r5, r0
    mov r0, r10
    mov r1, #0xa
    bl func_020ada8c
    mul r0, r6, r0
    mov r1, #0xa
    bl func_020adae4
    adds r1, r9, r4
    sub r1, r8, r5
    add r1, r1, r0
    beq .L_02038750
    cmp r1, #0x0
    ble .L_02038750
    rsb r5, r1, #0x0
    ldr r1, .L_02038778
    add r0, r7, #0x200
    mov r2, #0x1e
    strh r2, [r0, #0x68]
    ldr r0, [r1, #0x0]
    mov r1, r5
    mov r2, #0x0
    bl GamePhaseCurrencyHud_AddCurrency
    ldr r3, [r7, #0x24]
    ldr r1, [r7, #0x1c]
    ldr r2, [r7, #0x20]
    add r0, sp, #0x38
    add r3, r3, #0x18000
    bl VecFx32Object_InitComponents
    add r0, sp, #0x28
    bl VecFx32Object_Init
    ldr r1, .L_0203877c
    ldr r3, .L_02038780
    mov r0, #0x44
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_020386e4
    ldr r0, .L_02038774
    ldr r6, [r0, #0x0]
    add r0, r6, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    mov r2, #0x2000
    mov r1, r0
    str r2, [sp, #0x0]
    sub r0, r2, #0x20c0
    str r0, [sp, #0x4]
    add r0, r6, #0x2000
    ldr r2, [r0, #0xea4]
    mov r0, r4
    mov r3, r5
    bl func_02022cb0
    mov r4, r0
.L_020386e4:
    ldr r0, .L_02038774
    mov r1, r4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl PresentationList_AppendObject
    ldr r0, .L_02038774
    mov r1, #0x14
    ldr r0, [r0, #0x0]
    mov r2, #0x7
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionJitter_EnsureMinimum
    mov r0, r7
    mov r1, #0x26
    mov r2, #0x0
    bl Actor_PlayHorizontalSpatialSound
    mov r0, r7
    mov r1, #0xe
    mov r2, #0x0
    bl Actor_PlayHorizontalSpatialSound
    mov r0, r7
    bl Type1Actor_TryEnterFailureState
    add r0, sp, #0x28
    bl VecFx32Object_Destroy
    add r0, sp, #0x38
    bl VecFx32Object_Destroy
.L_02038750:
    add r0, sp, #0x48
    bl VecFx32Object_Destroy
    add r0, sp, #0x58
    bl VecFx32Object_Destroy
    add r0, sp, #0x68
    bl VecFx32Object_Destroy
.L_02038768:
    add sp, sp, #0x78
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02038770: .word data_020c9670
.L_02038774: .word data_021052fc
.L_02038778: .word gLupyContext
.L_0203877c: .word data_020df4a4
.L_02038780: .word gHeapContext
    .size ActorDerivedType1_ApplyWeightedCollisionDisplacement, . - ActorDerivedType1_ApplyWeightedCollisionDisplacement
