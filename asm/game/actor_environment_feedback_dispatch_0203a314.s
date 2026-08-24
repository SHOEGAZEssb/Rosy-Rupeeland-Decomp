; Matching retail form; see src/game/actor_environment_feedback_dispatch.c.
.text
.extern Heap_Alloc
.extern Sound_Play
.extern data_020c9670
.extern data_020df4f0
.extern gGamePhaseRuntime
.extern gActorInteractionResourceState
.extern gActorFeedbackPresentations
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern func_02008514
.extern RuntimePresentationManager_AppendFirstListEffect
.extern TimedSpriteOffsetPresentation_Init
.extern TimedSpriteSampledArcPresentation_Init
.extern Actor_QueryTerrainHeight
.extern ActorFeedbackResources_GetResource
.extern GraphicsSpriteState_SetFrameIndex
.extern gHeapContext
.extern gSceneTouchInitialData
.extern gSoundContext
    .global ActorFeedback_DispatchEnvironment
ActorFeedback_DispatchEnvironment: ; 0x0203a314
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x4c
    mov r10, r0
    mov r0, #0x0
    str r0, [sp, #0x20]
    ldr r2, [sp, #0x20]
    add r0, sp, #0x3c
    add r1, r10, #0x18
    str r2, [sp, #0x1c]
    str r2, [sp, #0x18]
    mov r4, r2
    str r2, [sp, #0x14]
    bl VecFx32Object_InitCopy
    ldrb r0, [r10, #0xd4]
    ldr r5, .L_0203a890
    ldr r6, [sp, #0x40]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    mov r2, r1, lsl #0x1
    add r0, r1, #0x1
    mov r1, #0x1000
    ldr r3, .L_0203a894
    ldrsh r2, [r5, r2]
    mov r0, r0, lsl #0x1
    ldrsh r5, [r5, r0]
    mvn r0, #0xb
    smlabb r0, r2, r0, r6
    rsb r1, r1, #0x0
    and r0, r0, r1
    mov r2, r0, asr #0xc
    str r0, [sp, #0x40]
    ldr r6, [sp, #0x44]
    mov r0, #0xc
    smlabb r0, r5, r0, r6
    and r5, r0, r1
    mov r0, r5, asr #0xc
    str r5, [sp, #0x44]
    str r3, [sp, #0x30]
    str r2, [sp, #0x34]
    str r0, [sp, #0x38]
    mov r5, r1, asr #0x9
    b .L_0203a4c4
.L_0203a3c4:
    ldr r0, [sp, #0x34]
    mvn r6, #0x7
    add r0, r0, r5
    mov r7, r0, asr #0x4
    mov r0, r7, lsl #0x10
    ldr r11, [sp, #0x38]
    str r0, [sp, #0x24]
    b .L_0203a4b8
.L_0203a3e4:
    add r0, r11, r6
    mov r8, r0, asr #0x4
    mov r0, r10
    mov r1, r7
    mov r2, r8
    bl Actor_QueryTerrainHeight
    mov r1, r0, lsl #0x4
    mov r2, r1, lsl #0xc
    ldr r0, [sp, #0x48]
    cmp r0, r1, lsl #0xc
    bne .L_0203a4a8
    ldr r0, .L_0203a898
    mov r1, r7
    ldr r0, [r0, #0x0]
    mov r2, r8
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed4]
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0x2c]
    blx r3
    mov r1, r0, lsl #0x16
    str r0, [sp, #0x28]
    str r0, [sp, #0x2c]
    mov r0, r0, lsl #0x12
    mov r1, r1, lsr #0x1b
    mov r9, r0, lsr #0x1c
    sub r0, r1, #0x18
    cmp r0, #0x1
    bhi .L_0203a484
    mov r0, #0x1
    cmp r1, #0x18
    str r0, [sp, #0x20]
    streq r0, [sp, #0x1c]
    ldr r0, .L_0203a898
    ldr r1, [sp, #0x24]
    ldr r0, [r0, #0x0]
    mov r2, r8, lsl #0x10
    bl func_02008514
    cmp r0, #0x0
    bne .L_0203a4cc
.L_0203a484:
    cmp r9, #0x4
    moveq r0, #0x1
    streq r0, [sp, #0x18]
    beq .L_0203a49c
    cmp r9, #0x5
    moveq r4, #0x1
.L_0203a49c:
    mov r0, #0x1
    str r0, [sp, #0x14]
    b .L_0203a4b4
.L_0203a4a8:
    cmp r2, r0
    movgt r0, #0x1
    strgt r0, [sp, #0x14]
.L_0203a4b4:
    add r6, r6, #0x8
.L_0203a4b8:
    cmp r6, #0x8
    ble .L_0203a3e4
    add r5, r5, #0x8
.L_0203a4c4:
    cmp r5, #0x8
    ble .L_0203a3c4
.L_0203a4cc:
    ldr r0, [sp, #0x20]
    mov r2, #0x0
    cmp r0, #0x0
    sub r6, r2, #0x1
    beq .L_0203a6ec
    ldr r0, [sp, #0x1c]
    mov r6, r2
    cmp r0, #0x0
    beq .L_0203a6dc
    mov r0, #0x2
    bl ActorFeedbackResources_GetResource
    movs r4, r0
    beq .L_0203a6dc
    mov r5, r6
    mov r7, r5
    mov r3, r5
    ldr r2, .L_0203a89c
    b .L_0203a550
.L_0203a514:
    ldr r0, [r2, r3, lsl #0x2]
    cmp r0, #0x0
    addeq r7, r2, r3, lsl #0x2
    beq .L_0203a558
    cmp r5, #0x0
    beq .L_0203a548
    ldr r1, [r5, #0x0]
    ldr r0, [r0, #0x8]
    ldr r1, [r1, #0x8]
    ldr r0, [r0, #0x28]
    ldr r1, [r1, #0x28]
    cmp r1, r0
    ble .L_0203a54c
.L_0203a548:
    add r5, r2, r3, lsl #0x2
.L_0203a54c:
    add r3, r3, #0x1
.L_0203a550:
    cmp r3, #0x6
    blt .L_0203a514
.L_0203a558:
    ldr r1, .L_0203a8a0
    ldr r3, .L_0203a8a4
    mov r0, #0xc
    mov r2, #0x4
    bl Heap_Alloc
    movs r10, r0
    beq .L_0203a5b4
    ldr r1, [r4, #0x8]
    ldr r2, .L_0203a8a8
    str r1, [sp, #0x0]
    ldr r3, [r4, #0xc]
    ldr r1, .L_0203a898
    str r3, [sp, #0x4]
    str r2, [sp, #0x8]
    ldr r1, [r1, #0x0]
    ldr r3, [r4, #0x4]
    add r1, r1, #0x2000
    ldr r2, [r1, #0xea4]
    add r1, sp, #0x3c
    ldr r2, [r2, #0x54]
    ldr r2, [r2, #0x0]
    bl TimedSpriteSampledArcPresentation_Init
    mov r10, r0
.L_0203a5b4:
    cmp r7, #0x0
    bne .L_0203a5e0
    ldr r0, [r5, #0x0]
    cmp r0, #0x0
    beq .L_0203a5d4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0203a5d4:
    mov r0, #0x0
    mov r7, r5
    str r0, [r5, #0x0]
.L_0203a5e0:
    ldr r5, .L_0203a89c
    ldr r4, .L_0203a8ac
    mov r8, #0x0
    mov r11, #0x3
.L_0203a5f0:
    ldr r0, [r5, r8, lsl #0x2]
    cmp r0, #0x0
    beq .L_0203a63c
    ldr r0, [r0, #0x8]
    ldr r9, [r0, #0x4]
    ldrh r1, [r9, #0x28]
    add r0, r1, #0x1
    strh r0, [r9, #0x28]
    cmp r1, r4
    blt .L_0203a63c
    ldrb r0, [r9, #0x39]
    cmp r0, #0x2
    bgt .L_0203a63c
    mov r0, r9
    mov r1, r11
    bl GraphicsSpriteState_SetFrameIndex
    ldrh r0, [r9, #0x24]
    bic r0, r0, #0x1
    strh r0, [r9, #0x24]
.L_0203a63c:
    add r8, r8, #0x1
    cmp r8, #0x6
    blt .L_0203a5f0
    mov r0, #0x3
    str r10, [r7, #0x0]
    bl ActorFeedbackResources_GetResource
    movs r4, r0
    beq .L_0203a6dc
    ldr r1, .L_0203a8a0
    ldr r3, .L_0203a8a4
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq .L_0203a6c8
    ldr r1, [r4, #0x4]
    mvn r3, #0x3
    str r1, [sp, #0x0]
    ldr r1, [r4, #0x8]
    add r2, r3, #0x3
    str r1, [sp, #0x4]
    ldr r4, [r4, #0xc]
    ldr r1, .L_0203a898
    str r4, [sp, #0x8]
    str r3, [sp, #0xc]
    str r2, [sp, #0x10]
    ldr r2, [r1, #0x0]
    add r1, sp, #0x3c
    add r2, r2, #0x2000
    ldr r3, [r2, #0xea4]
    mov r2, #0x0
    ldr r3, [r3, #0x54]
    ldr r3, [r3, #0x0]
    bl TimedSpriteOffsetPresentation_Init
    mov r1, r0
.L_0203a6c8:
    ldr r0, .L_0203a898
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_AppendFirstListEffect
.L_0203a6dc:
    ldr r0, .L_0203a8b0
    ldr r0, [r0, #0x4]
    ldrh r2, [r0, #0xe]
    b .L_0203a860
.L_0203a6ec:
    cmp r4, #0x0
    ldreq r0, [sp, #0x18]
    cmpeq r0, #0x0
    beq .L_0203a7b4
    cmp r4, #0x0
    movne r4, #0x5
    moveq r4, #0x4
    mov r0, r4
    mov r6, #0x1
    bl ActorFeedbackResources_GetResource
    movs r5, r0
    beq .L_0203a79c
    ldr r1, .L_0203a8a0
    ldr r3, .L_0203a8a4
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq .L_0203a788
    ldr r1, [r5, #0x4]
    mvn r3, #0x3
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x8]
    add r2, r3, #0x3
    str r1, [sp, #0x4]
    ldr r5, [r5, #0xc]
    ldr r1, .L_0203a898
    str r5, [sp, #0x8]
    str r3, [sp, #0xc]
    str r2, [sp, #0x10]
    ldr r2, [r1, #0x0]
    add r1, sp, #0x3c
    add r2, r2, #0x2000
    ldr r3, [r2, #0xea4]
    mov r2, #0x0
    ldr r3, [r3, #0x54]
    ldr r3, [r3, #0x0]
    bl TimedSpriteOffsetPresentation_Init
    mov r1, r0
.L_0203a788:
    ldr r0, .L_0203a898
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_AppendFirstListEffect
.L_0203a79c:
    ldr r0, .L_0203a8b0
    sub r1, r4, #0x1
    ldr r0, [r0, #0x4]
    add r0, r0, r1, lsl #0x3
    ldrh r2, [r0, #0x6]
    b .L_0203a860
.L_0203a7b4:
    ldr r0, [sp, #0x14]
    cmp r0, #0x0
    beq .L_0203a860
    mov r0, #0xf
    mov r6, #0x2
    bl ActorFeedbackResources_GetResource
    movs r4, r0
    beq .L_0203a854
    ldr r1, .L_0203a8a0
    ldr r3, .L_0203a8a4
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq .L_0203a840
    ldr r1, [r4, #0x4]
    mvn r3, #0x3
    str r1, [sp, #0x0]
    ldr r1, [r4, #0x8]
    add r2, r3, #0x3
    str r1, [sp, #0x4]
    ldr r4, [r4, #0xc]
    ldr r1, .L_0203a898
    str r4, [sp, #0x8]
    str r3, [sp, #0xc]
    str r2, [sp, #0x10]
    ldr r2, [r1, #0x0]
    add r1, sp, #0x3c
    add r2, r2, #0x2000
    ldr r3, [r2, #0xea4]
    mov r2, #0x0
    ldr r3, [r3, #0x54]
    ldr r3, [r3, #0x0]
    bl TimedSpriteOffsetPresentation_Init
    mov r1, r0
.L_0203a840:
    ldr r0, .L_0203a898
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_AppendFirstListEffect
.L_0203a854:
    ldr r0, .L_0203a8b0
    ldr r0, [r0, #0x4]
    ldrh r2, [r0, #0x76]
.L_0203a860:
    cmp r2, #0x0
    beq .L_0203a87c
    ldr r0, .L_0203a8b4
    mov r1, r2, asr #0x7
    ldr r0, [r0, #0x0]
    and r2, r2, #0x7f
    bl Sound_Play
.L_0203a87c:
    add r0, sp, #0x3c
    bl VecFx32Object_Destroy
    mov r0, r6
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0203a890: .word data_020c9670
.L_0203a894: .word gSceneTouchInitialData
.L_0203a898: .word gGamePhaseRuntime
.L_0203a89c: .word gActorFeedbackPresentations
.L_0203a8a0: .word data_020df4f0
.L_0203a8a4: .word gHeapContext
.L_0203a8a8: .word 0xfde8
.L_0203a8ac: .word 0xfdec
.L_0203a8b0: .word gActorInteractionResourceState
.L_0203a8b4: .word gSoundContext


    .size ActorFeedback_DispatchEnvironment, . - ActorFeedback_DispatchEnvironment
