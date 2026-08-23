; Matching retail form; see src/game/actor_derived_type1_frame_update.c.
.text
.extern GameWork_ClearFlag
.extern GameWork_SetFlag
.extern GameWork_TestFlag
.extern Heap_Alloc
.extern SceneManager_GetCurrent
.extern gType7AuxiliaryPresentationAllocationTag
.extern data_021052fc
.extern DisplayBrightness_StartMainTransition
.extern DisplayBrightness_StartSubTransition
.extern DisplayBrightness_IsMainTransitionComplete
.extern DisplayBrightness_IsSubTransitionComplete
.extern VecFx32Object_GetMagnitude
.extern GamePhaseRuntime_StageAreaRequest
.extern ActorRuntimeTriple_Assign
.extern Actor_ClearTransientContactState
.extern Actor_TurnTowardVector
.extern Actor_TurnTowardTargetPosition
.extern func_020328d0
.extern Actor_UpdateAnimationState
.extern func_020349b8
.extern Actor_IsAtCachedTerrainHeight
.extern ActorDerivedType1_ClassifyState
.extern ActorDerivedType1_UpdateHorizontalInputMotion
.extern ActorDerivedType1_UpdateAuxiliaryResourceMotion
.extern ActorDerivedRuntime_UpdateFrame
.extern Type7Actor_ClearTarget
.extern Type7AuxiliaryPresentation_Init
.extern Type7AuxiliaryPresentation_Activate
.extern Type7MarkerPresentation_SelectAnimation
.extern Sound_StopEffect
.extern func_020ada8c
.extern func_020adc90
.extern gGameWork
.extern gHeapContext
.extern gSceneManager
.extern gSoundContext
.extern genrand_int32

    .global ActorDerivedType1_UpdateFrame
    .type ActorDerivedType1_UpdateFrame, @function
ActorDerivedType1_UpdateFrame: ; 0x02035538
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r1, [r5, #0x230]
    tst r1, #0x100
    bne .L_02035b94
    tst r1, #0x800000
    bne .L_02035b94
    ldr r0, [r5, #0xd0]
    tst r0, #0x4000
    beq .L_020355bc
    tst r1, #0x200000
    addne r0, r5, #0x200
    movne r1, #0x3c
    strneh r1, [r0, #0x68]
    bne .L_0203559c
    tst r1, #0x400000
    add r0, r5, #0x200
    movne r1, #0x8c
    strneh r1, [r0, #0x68]
    bne .L_0203559c
    ldrsh r1, [r0, #0x68]
    cmp r1, #0x1e
    movlt r1, #0x1e
    strlth r1, [r0, #0x68]
.L_0203559c:
    bl genrand_int32
    bic r0, r0, #0x80000000
    mov r1, #0x4
    bl func_020ada8c
    mov r2, r0, lsl #0x6
    mov r0, r5
    mov r1, #0x5f
    bl func_020349b8
.L_020355bc:
    ldr r1, [r5, #0x230]
    mov r0, r5
    bic r1, r1, #0x680000
    str r1, [r5, #0x230]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x18]
    blx r1
    add r0, r5, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x4c]
    ldrb r0, [r5, #0x2a0]
    cmp r0, #0x0
    subne r0, r0, #0x1
    strneb r0, [r5, #0x2a0]
    ldr r0, .L_02035b9c
    ldr r0, [r0, #0x0]
    bl SceneManager_GetCurrent
    ldr r0, [r0, #0x4]
    cmp r0, #0x3
    beq .L_020357cc
    ldr r0, [r5, #0xd0]
    tst r0, #0x100
    beq .L_0203566c
    ldr r0, [r5, #0x248]
    cmp r0, #0x0
    ble .L_02035644
    sub r0, r0, #0x1
    str r0, [r5, #0x248]
    ldr r0, [r5, #0x26c]
    cmp r0, #0x0
    beq .L_020357cc
    mov r0, r5
    bl ActorDerivedType1_UpdateAuxiliaryResourceMotion
    b .L_020357cc
.L_02035644:
    ldr r0, .L_02035ba0
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x25
    bl Sound_StopEffect
    ldr r0, .L_02035ba4
    ldr r1, .L_02035ba8
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    b .L_020357cc
.L_0203566c:
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x38]
    blx r1
    cmp r0, #0x0
    bne .L_020357cc
    ldrsh r1, [r5, #0xd6]
    cmp r1, #0xd
    beq .L_020357cc
    ldr r0, [r5, #0x26c]
    cmp r0, #0x0
    beq .L_020356a8
    mov r0, r5
    bl ActorDerivedType1_UpdateAuxiliaryResourceMotion
    b .L_020357cc
.L_020356a8:
    ldr r0, [r5, #0x230]
    tst r0, #0x40000000
    beq .L_020356c0
    mov r0, r5
    bl ActorDerivedType1_UpdateHorizontalInputMotion
    b .L_020357cc
.L_020356c0:
    cmp r1, #0x11
    beq .L_020356dc
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x44]
    blx r1
    b .L_020357cc
.L_020356dc:
    add r0, r5, #0x200
    ldrh r1, [r0, #0x34]
    cmp r1, #0x0
    beq .L_0203571c
    sub r1, r1, #0x1
    strh r1, [r0, #0x34]
    ldrh r0, [r0, #0x34]
    cmp r0, #0x0
    bne .L_020357cc
    mov r0, #0x2
    mov r1, #0x10
    bl DisplayBrightness_StartMainTransition
    mov r0, #0x2
    mov r1, #0x10
    bl DisplayBrightness_StartSubTransition
    b .L_020357cc
.L_0203571c:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq .L_020357cc
    bl DisplayBrightness_IsSubTransitionComplete
    cmp r0, #0x0
    beq .L_020357cc
    ldr r0, .L_02035ba4
    mov r1, #0x3f8
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, .L_02035ba4
    ldr r1, .L_02035bac
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, .L_02035ba4
    mov r1, #0x10
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r0, .L_02035bb0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    beq .L_02035798
    ldr r1, [r0, #0x268]
    tst r1, #0x10
    movne r1, #0x1
    moveq r1, #0x0
    cmp r1, #0x0
    beq .L_02035798
    bl Type7Actor_ClearTarget
.L_02035798:
    ldr r0, .L_02035ba4
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    ldr r4, .L_02035bb0
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    add r3, r0, #0x100
    add r0, r0, #0x200
    ldrsh r1, [r0, #0x0]
    ldrsh r2, [r3, #0xf6]
    ldrsh r3, [r3, #0xf4]
    ldr r0, [r4, #0x0]
    bl GamePhaseRuntime_StageAreaRequest
.L_020357cc:
    ldr r0, [r5, #0x10]
    tst r0, #0x8
    beq .L_020357e8
    tst r0, #0x100
    beq .L_020357e8
    mov r0, r5
    bl ActorDerivedRuntime_UpdateFrame
.L_020357e8:
    ldr r0, [r5, #0x230]
    bic r1, r0, #0x200
    str r1, [r5, #0x230]
    tst r1, #0x40000000
    add r0, r5, #0x200
    beq .L_0203586c
    ldrsh r0, [r0, #0x64]
    cmp r0, #0x0
    ble .L_02035834
    mov r0, r5
    add r1, r5, #0x254
    mov r2, #0x1000
    bl Actor_TurnTowardTargetPosition
    add r1, r5, #0x200
    ldrsh r2, [r1, #0x64]
    mov r4, r0
    sub r0, r2, #0x1
    strh r0, [r1, #0x64]
    b .L_020358e8
.L_02035834:
    tst r1, #0x80000000
    mvnne r1, #0x7
    moveq r1, #0x8
    mov r0, r5
    mov r2, #0x0
    mov r3, #0x800
    bl Actor_TurnTowardVector
    add r1, r5, #0x200
    ldrsh r2, [r1, #0x66]
    mov r4, r0
    cmp r2, #0x0
    subgt r0, r2, #0x1
    strgth r0, [r1, #0x66]
    b .L_020358e8
.L_0203586c:
    ldrsh r1, [r0, #0x64]
    cmp r1, #0x0
    ble .L_020358a0
    mov r0, r5
    add r1, r5, #0x254
    mov r2, #0x1000
    bl Actor_TurnTowardTargetPosition
    add r1, r5, #0x200
    ldrsh r2, [r1, #0x64]
    mov r4, r0
    sub r0, r2, #0x1
    strh r0, [r1, #0x64]
    b .L_020358e8
.L_020358a0:
    ldrsh r1, [r0, #0x52]
    mov r3, #0x800
    cmp r1, #0x0
    subgt r1, r1, #0x1
    strgth r1, [r0, #0x52]
    ldrgt r0, [r5, #0xd0]
    orrgt r0, r0, #0x8000
    strgt r0, [r5, #0xd0]
    ldr r1, [r5, #0x3c]
    ldr r2, [r5, #0x40]
    mov r0, r5
    bl Actor_TurnTowardVector
    add r1, r5, #0x200
    ldrsh r2, [r1, #0x66]
    mov r4, r0
    cmp r2, #0x0
    subgt r0, r2, #0x1
    strgth r0, [r1, #0x66]
.L_020358e8:
    ldr r0, [r5, #0x26c]
    cmp r0, #0x0
    bne .L_02035964
    ldr r0, .L_02035ba4
    ldr r1, .L_02035bb4
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_02035964
    ldr r0, [r5, #0x270]
    cmp r0, #0x0
    bne .L_02035964
    ldr r1, .L_02035bb8
    ldr r3, .L_02035bbc
    mov r0, #0x2c
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0203593c
    mov r1, r5
    bl Type7AuxiliaryPresentation_Init
.L_0203593c:
    ldr r1, .L_02035ba4
    str r0, [r5, #0x270]
    ldr r0, [r1, #0x0]
    ldr r1, .L_02035bb4
    bl GameWork_ClearFlag
    ldr r0, [r5, #0x270]
    bl Type7AuxiliaryPresentation_Activate
    ldr r0, [r5, #0xd0]
    orr r0, r0, #0x8
    str r0, [r5, #0xd0]
.L_02035964:
    mov r0, r5
    bl ActorDerivedType1_ClassifyState
    ldrsh r0, [r5, #0xd6]
    cmp r0, #0x8
    cmpne r0, #0x7
    cmpne r0, #0x11
    moveq r0, #0x0
    streq r0, [r5, #0x40]
    streq r0, [r5, #0x3c]
    ldr r1, [r5, #0x270]
    cmp r1, #0x0
    beq .L_020359ac
    ldrsh r0, [r5, #0xd6]
    cmp r0, #0x11
    moveq r0, #0x40000
    streq r0, [r1, #0x28]
    movne r0, #0x0
    strne r0, [r1, #0x28]
.L_020359ac:
    ldr r0, [r5, #0x10]
    tst r0, #0x8
    beq .L_020359c0
    tst r0, #0x100
    bne .L_02035a08
.L_020359c0:
    add r0, r5, #0x200
    ldrh r2, [r0, #0xa2]
    cmp r2, #0x0
    beq .L_020359e0
    ldr r1, [r5, #0xd0]
    tst r1, #0x40
    subeq r1, r2, #0x1
    streqh r1, [r0, #0xa2]
.L_020359e0:
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa4]
    blx r1
    mov r0, r5
    bl Actor_IsAtCachedTerrainHeight
    cmp r0, #0x0
    ldrne r0, [r5, #0x230]
    bicne r0, r0, #0x40000
    strne r0, [r5, #0x230]
.L_02035a08:
    add r0, r5, #0x88
    bl VecFx32Object_GetMagnitude
    ldr r2, .L_02035bc0
    mov r1, r0
    cmp r1, r2
    bge .L_02035a38
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r5, #0x88
    bl ActorRuntimeTriple_Assign
    b .L_02035a54
.L_02035a38:
    cmp r1, #0x8000
    ble .L_02035a54
    mov r0, #0x8000
    bl func_020adc90
    mov r1, r0
    add r0, r5, #0x88
    bl func_020328d0
.L_02035a54:
    mov r0, r5
    bl Actor_UpdateAnimationState
    ldr r0, [r5, #0x270]
    cmp r0, #0x0
    beq .L_02035aa0
    ldrb r1, [r0, #0x10]
    tst r1, #0x8
    beq .L_02035a94
    cmp r0, #0x0
    beq .L_02035a88
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02035a88:
    mov r0, #0x0
    str r0, [r5, #0x270]
    b .L_02035aa0
.L_02035a94:
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02035aa0:
    ldr r0, [r5, #0x27c]
    cmp r0, #0x0
    beq .L_02035acc
    ldrsh r0, [r0, #0x0]
    cmp r0, #0x7b
    cmpne r0, #0x8c
    bne .L_02035acc
    add r0, r5, #0x2a8
    mov r1, #0x17
    bl Type7MarkerPresentation_SelectAnimation
    b .L_02035b20
.L_02035acc:
    add r0, r5, #0x200
    ldrsh r1, [r0, #0x68]
    cmp r1, #0x0
    ble .L_02035aec
    add r0, r5, #0x2a8
    mov r1, #0x17
    bl Type7MarkerPresentation_SelectAnimation
    b .L_02035b20
.L_02035aec:
    ldrsh r1, [r0, #0x64]
    cmp r1, #0x0
    ble .L_02035b14
    ldrsb r0, [r0, #0x6a]
    cmp r0, #0x0
    blt .L_02035b14
    add r0, r5, #0x2a8
    mov r1, #0x0
    bl Type7MarkerPresentation_SelectAnimation
    b .L_02035b20
.L_02035b14:
    add r0, r5, #0x2a8
    mvn r1, #0x0
    bl Type7MarkerPresentation_SelectAnimation
.L_02035b20:
    add r0, r5, #0x2a8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    mov r0, r5
    bl Actor_ClearTransientContactState
    ldr r1, .L_02035ba4
    ldr r0, [r1, #0x0]
    add r0, r0, #0x200
    strh r4, [r0, #0x4a]
    ldr r0, [r5, #0xd0]
    tst r0, #0x20
    ldr r0, [r1, #0x0]
    mov r1, #0x3f0
    beq .L_02035b64
    bl GameWork_SetFlag
    b .L_02035b68
.L_02035b64:
    bl GameWork_ClearFlag
.L_02035b68:
    ldr r0, [r5, #0xd0]
    ldr r1, .L_02035bc4
    tst r0, #0x10
    beq .L_02035b88
    ldr r0, .L_02035ba4
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    b .L_02035b94
.L_02035b88:
    ldr r0, .L_02035ba4
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
.L_02035b94:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_02035b9c: .word gSceneManager
.L_02035ba0: .word gSoundContext
.L_02035ba4: .word gGameWork
.L_02035ba8: .word 0x3f5
.L_02035bac: .word 0x3f6
.L_02035bb0: .word data_021052fc
.L_02035bb4: .word 0x3f2
.L_02035bb8: .word gType7AuxiliaryPresentationAllocationTag
.L_02035bbc: .word gHeapContext
.L_02035bc0: .word 0x19a
.L_02035bc4: .word 0x3f1
    .size ActorDerivedType1_UpdateFrame, . - ActorDerivedType1_UpdateFrame

    .global Actor_IsAtCachedTerrainHeight
