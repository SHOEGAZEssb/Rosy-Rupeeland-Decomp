.text
.extern data_020d431c
.extern gGamePhaseTouchPromptAllocationTag
.extern data_021052fc
.extern gActorRuntimeCollection
.extern FrameTaskList_Add
.extern DisplayController_SetVerticalOffset
.extern VecFx32Object_Assign
.extern TouchPoint_InitZero
.extern OverlaySlot_Init
.extern GamePhaseRuntime_SetDisplayRouting
.extern GamePhaseRuntime_CreateFieldLoader
.extern GamePhaseRuntime_CreateSecondaryActorSubsystem
.extern GamePhaseRuntime_SetPlacementMode
.extern GamePhaseRuntime_GetActiveAreaPlacementVariant
.extern GamePhaseRuntime_RefreshAreaAuxiliaryObject
.extern GamePhaseRuntime_RecreateDualScreenUiPresentation
.extern ActorMotion_Reset
.extern ActorMotion_BindActor
.extern ActorMotionGameWork_Init
.extern ActorMotion_GetPosition
.extern ActorMotionAreaFollower_Init
.extern ActorMotionAreaFollower_GetPosition
.extern ActorMotionAreaFollower_BindActor
.extern ActorMotionAreaFollower_RefreshCurrentArea
.extern ActorMotionAreaFollower_Reset
.extern ActorRuntimeCollection_Reset
.extern GamePhaseState_Init
.extern GamePhaseState_ConfigureForPhase
.extern GamePhaseState_SetEnabled
.extern GamePhaseTouchPrompt_Init
.extern GamePhaseTouchPrompt_SetEnabled
.extern GamePhaseCurrencyHud_SetVisible
.extern GamePhaseAreaScene_RegisterEnabledRegions
.extern func_02020060
.extern ActorCollection_DispatchEventToActors
.extern Actor_AdjustPositionForTerrainHeight
.extern ActorDerivedType1_ResetToDisabledState
.extern ActorDerivedType1_UpdateGameWorkRuntimeFlags
.extern ActorInteractionRuntime_Start
.extern func_020ae90c
.extern GameWork_TestFlag
.extern gGameWork
.extern gHeapContext
.extern gLupyContext
.extern GXS_SetGraphicsMode
.extern Heap_Alloc
.extern Scene_ClearFlags03
.extern Scene_Init
.extern Scene_SetFlags03

    .global GamePhaseRuntime_Init
.type GamePhaseRuntime_Init, @function
GamePhaseRuntime_Init:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Scene_Init
    ldr r1, L_02006bcc
    add r0, r4, #0x24
    str r1, [r4, #0x0]
    bl GamePhaseState_Init
    add r0, r4, #0x3bc
    add r1, r4, #0x3a4
    add r2, r4, #0x2000
    mov r3, #0x0
    add r0, r0, #0x2c00
    add r1, r1, #0x2c00
    str r3, [r2, #0xfb8]
    bl ActorMotionAreaFollower_Init
    add r0, r4, #0x44
    add r0, r0, #0x3000
    bl ActorMotionGameWork_Init
    add r0, r4, #0xa8
    add r0, r0, #0x3000
    bl TouchPoint_InitZero
    mov r1, #0x0
    add r0, r4, #0x3000
    str r1, [r0, #0xb4]
    str r1, [r0, #0xb8]
    str r1, [r0, #0xbc]
    add r0, r4, #0x30c0
    bl OverlaySlot_Init
    mov r2, #0x0
    add r0, r4, #0x3000
    strb r2, [r0, #0xcc]
    sub r1, r2, #0x1
    str r1, [r0, #0xe4]
    str r2, [r0, #0xe8]
    str r2, [r0, #0xec]
    str r2, [r0, #0xf0]
    str r2, [r0, #0xf4]
    bl func_020ae90c
    ldr r0, L_02006bd0
    mov r1, #0x1
    str r4, [r0, #0x0]
    str r1, [r4, #0x4]
    mov r0, #0x30
    ldr r1, L_02006bd4
    mov r2, #0x4
    ldr r3, L_02006bd8
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02006bac
    mov r1, r4
    bl GamePhaseTouchPrompt_Init
L_02006bac:
    mov r1, #0x0
    bl FrameTaskList_Add
    ldr r1, L_02006bd0
    str r0, [r1, #0x4]
    mov r0, r4
    bl GamePhaseRuntime_CreateFieldLoader
    mov r0, r4
    ldmia sp!, {r4, pc}
L_02006bcc: .word data_020d431c
L_02006bd0: .word data_021052fc
L_02006bd4: .word gGamePhaseTouchPromptAllocationTag
L_02006bd8: .word gHeapContext
    .size GamePhaseRuntime_Init, .-GamePhaseRuntime_Init

    .global GamePhaseRuntime_Configure
.type GamePhaseRuntime_Configure, @function
GamePhaseRuntime_Configure:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r4, r0
    mov r6, r1
    mov r8, r2
    mov r5, r3
    bl Scene_ClearFlags03
    add r1, r4, #0x3000
    mov r0, #0x0
    str r6, [r1, #0xbc]
    bl GXS_SetGraphicsMode
    mov r1, #0x4000000
    ldr r0, [r1, #0x0]
    add r2, r1, #0x1000
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1000
    str r0, [r1, #0x0]
    ldr r1, [r2, #0x0]
    add r0, r4, #0x3000
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1000
    str r1, [r2, #0x0]
    ldr r0, [r0, #0xbc]
    ldrsh r0, [r0, #0x54]
    bl DisplayController_SetVerticalOffset
    add r0, r4, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_Reset
    add r0, r4, #0x44
    add r0, r0, #0x3000
    bl ActorMotion_Reset
    ldr r0, L_02006fc0
    bl ActorRuntimeCollection_Reset
    mov r0, r4
    add r1, r4, #0x3000
    ldr r1, [r1, #0xbc]
    mov r2, #0x1
    bl GamePhaseRuntime_CreateSecondaryActorSubsystem
    add r0, r4, #0x24
    add r1, r4, #0x3000
    ldr r1, [r1, #0xbc]
    bl GamePhaseState_ConfigureForPhase
    mov r0, r4
    add r1, r4, #0x3000
    ldr r1, [r1, #0xbc]
    mov r2, #0x1
    bl GamePhaseRuntime_RefreshAreaAuxiliaryObject
    mov r0, #0x0
    add r1, r4, #0x3000
    ldr r1, [r1, #0xbc]
    ldr r1, [r1, #0x24]
    blx r1
    bl ActorInteractionRuntime_Start
    mov r6, r5, lsl #0xc
    add r0, r4, #0x2000
    ldr r5, [r0, #0xea4]
    mov r0, r8, lsl #0xc
    str r0, [r5, #0x1c]
    str r6, [r5, #0x20]
    ldr r1, [sp, #0x18]
    add r0, r5, #0x28
    mov r7, r1, lsl #0xc
    str r7, [r5, #0x24]
    add r1, r5, #0x18
    bl VecFx32Object_Assign
    ldr r0, L_02006fc4
    ldr r1, L_02006fc8
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_02006d08
    mov r1, #0x60000
    mov r0, r5
    str r1, [r5, #0x24]
    bl ActorDerivedType1_ResetToDisabledState
    b L_02006d1c
L_02006d08:
    ldr r0, [r5, #0x24]
    cmp r0, #0x0
    bne L_02006d1c
    mov r0, r5
    bl Actor_AdjustPositionForTerrainHeight
L_02006d1c:
    add r0, r4, #0x2000
    ldr r5, [r0, #0xea8]
    cmp r5, #0x0
    beq L_02006da0
    ldr r0, [r5, #0x268]
    tst r0, #0x10
    movne r1, #0x1
    moveq r1, #0x0
    cmp r1, #0x0
    beq L_02006da0
    tst r0, #0x20
    bne L_02006da0
    add r0, r8, #0x14
    mov r0, r0, lsl #0xc
    str r0, [r5, #0x1c]
    str r6, [r5, #0x20]
    add r0, r5, #0x28
    add r1, r5, #0x18
    str r7, [r5, #0x24]
    bl VecFx32Object_Assign
    ldr r0, L_02006fc4
    ldr r1, L_02006fc8
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    movne r0, #0x60000
    strne r0, [r5, #0x24]
    bne L_02006da0
    ldr r0, [r5, #0x24]
    cmp r0, #0x0
    bne L_02006da0
    mov r0, r5
    bl Actor_AdjustPositionForTerrainHeight
L_02006da0:
    add r0, r4, #0x3000
    ldr r0, [r0, #0xbc]
    ldr r0, [r0, #0x0]
    sub r0, r0, #0x2
    cmp r0, #0x2
    add r0, r4, #0x2000
    movls r1, #0x1
    ldr r0, [r0, #0xea4]
    movhi r1, #0x0
    bl ActorDerivedType1_UpdateGameWorkRuntimeFlags
    add r1, r4, #0x2000
    add r0, r4, #0x3bc
    ldr r1, [r1, #0xea4]
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_BindActor
    add r1, r4, #0x2000
    add r0, r4, #0x44
    ldr r1, [r1, #0xea4]
    add r0, r0, #0x3000
    bl ActorMotion_BindActor
    add r0, r4, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_RefreshCurrentArea
    mov r0, r4
    bl GamePhaseRuntime_GetActiveAreaPlacementVariant
    add r2, r4, #0x3000
    mov r1, r0
    ldr r2, [r2, #0xbc]
    mov r0, r4
    bl GamePhaseRuntime_RecreateDualScreenUiPresentation
    mov r1, #0x1
    add r0, r4, #0x3000
    str r1, [r0, #0xfc]
    mov r0, r4
    mov r2, #0x0
    bl GamePhaseRuntime_SetPlacementMode
    add r0, r4, #0x24
    mov r1, #0x1
    bl GamePhaseState_SetEnabled
    add r0, r4, #0x2000
    ldr r5, [r0, #0xfb8]
    add r0, r4, #0x44
    add r0, r0, #0x3000
    bl ActorMotion_GetPosition
    mov r1, r0
    add r0, r5, #0x8
    bl ActorCollection_DispatchEventToActors
    add r0, r4, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    mov r1, r0
    add r0, r4, #0x28
    bl ActorCollection_DispatchEventToActors
    add r0, r4, #0x3000
    ldr r0, [r0, #0xbc]
    ldr r0, [r0, #0x40]
    mov r0, r0, lsl #0x9
    movs r0, r0, asr #0x1f
    beq L_02006e98
    mov r0, #0x0
    bl GamePhaseRuntime_SetDisplayRouting
    b L_02006ea0
L_02006e98:
    mov r0, #0x1
    bl GamePhaseRuntime_SetDisplayRouting
L_02006ea0:
    add r0, r4, #0x3000
    ldr r5, [r0, #0xbc]
    ldr r0, [r5, #0x40]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    beq L_02006ec8
    cmp r0, #0x2
    beq L_02006eec
    b L_02006f0c
L_02006ec8:
    ldrsh r0, [r5, #0x12]
    cmp r0, #0x0
    blt L_02006f0c
    add r0, r4, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    mov r1, r5
    bl func_02020060
    b L_02006f0c
L_02006eec:
    ldrsh r0, [r5, #0x12]
    cmp r0, #0x0
    blt L_02006f0c
    add r0, r4, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    mov r1, r5
    bl func_02020060
L_02006f0c:
    add r0, r4, #0x3000
    mvn r2, #0x0
    ldr r1, L_02006fcc
    str r2, [r0, #0xe4]
    ldr r0, [r1, #0x0]
    mov r1, #0x1
    bl GamePhaseCurrencyHud_SetVisible
    ldr r0, L_02006fcc
    mov r1, #0xfa
    ldr r0, [r0, #0x0]
    mov r2, #0x1e
    strh r1, [r0, #0xbc]
    strh r2, [r0, #0xbe]
    add r0, r4, #0x3000
    ldr r1, [r0, #0xbc]
    ldr r0, [r1, #0x40]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    bne L_02006f80
    ldr r1, [r1, #0x48]
    sub r0, r2, #0x1f
    cmp r1, r0
    beq L_02006f80
    add r0, r4, #0x2000
    add r1, r4, #0x3a4
    ldr r0, [r0, #0xfb8]
    add r1, r1, #0x2c00
    bl GamePhaseAreaScene_RegisterEnabledRegions
L_02006f80:
    add r0, r4, #0x2000
    ldr r2, [r0, #0xea4]
    add r0, r4, #0x3000
    ldr r1, L_02006fd0
    str r2, [r0, #0xf0]
    ldr r0, [r1, #0x4]
    mov r1, #0x1
    ldr r0, [r0, #0x8]
    bl GamePhaseTouchPrompt_SetEnabled
    add r1, r4, #0x3000
    ldr r2, [r1, #0xb8]
    mov r0, r4
    orr r2, r2, #0x30
    str r2, [r1, #0xb8]
    bl Scene_SetFlags03
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
L_02006fc0: .word gActorRuntimeCollection
L_02006fc4: .word gGameWork
L_02006fc8: .word 0x3f2
L_02006fcc: .word gLupyContext
L_02006fd0: .word data_021052fc
    .size GamePhaseRuntime_Configure, .-GamePhaseRuntime_Configure
