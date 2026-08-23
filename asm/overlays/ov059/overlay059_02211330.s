.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern Scene_ClearFlags03
.extern Scene_GetEmbedded10
.extern Scene_SetFlags03
.extern Sound_Play
.extern TouchRegionManager_NotifyAll
.extern TouchRegionManager_SetEnabled
.extern TouchRegionManager_Tick
.extern data_021052fc
.extern DisplayBrightness_StartMainTransition
.extern DisplayBrightness_StartSubTransition
.extern DisplayBrightness_IsSubTransitionIncreasing
.extern DisplayBrightness_IsSubTransitionDecreasing
.extern VecFx32Object_Destroy
.extern DebugSpriteText_SetTextResource
.extern DebugSpriteText_DrawCentered
.extern SplineMover_Update
.extern SplineMover_Evaluate2D
.extern GamePhaseRuntime_PrepareActorCollections
.extern GamePhaseRuntime_CreateSecondaryActorSubsystem
.extern GamePhaseRuntime_DestroySecondaryActorSubsystem
.extern GamePhaseRuntime_ApplyScreenMode
.extern GamePhaseRuntime_UpdateActorPresentationState
.extern func_02008f2c
.extern GamePhaseAreaScene_GetConfig
.extern GamePhaseAreaScene_ApplyRevealedRegions
.extern GamePhaseMetadata_GetTextResourceId
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern func_ov059_02210c24
.extern func_ov059_02210cb8
.extern func_ov059_02210cf8
.extern func_ov059_02210db0
.extern func_ov059_02210dfc
.extern func_ov059_02210f34
.extern func_ov059_02211854
.extern func_ov059_02211920
.extern func_ov059_022119e4
.extern func_ov059_02211a14
.extern gDebugFont
.extern gSoundContext

.global func_ov059_02211330
func_ov059_02211330:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x20
    ldr r1, .L_02211840
    mov r5, r0
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    bl func_02008f2c
    ldr r1, [r5, #0x24]
    cmp r1, #0x64
    bgt .L_02211390
    bge .L_02211588
    cmp r1, #0x2
    bgt .L_02211384
    cmp r1, #0x0
    blt .L_022117f0
    beq .L_022113b8
    cmp r1, #0x1
    beq .L_022113c4
    cmp r1, #0x2
    beq .L_02211424
    b .L_022117f0
.L_02211384:
    cmp r1, #0xa
    beq .L_02211448
    b .L_022117f0
.L_02211390:
    cmp r1, #0x12c
    bgt .L_022113a8
    bge .L_02211728
    cmp r1, #0xc8
    beq .L_02211658
    b .L_022117f0
.L_022113a8:
    ldr r0, .L_02211844
    cmp r1, r0
    beq .L_02211740
    b .L_022117f0
.L_022113b8:
    add r0, r1, #0x1
    str r0, [r5, #0x24]
    b .L_022117f0
.L_022113c4:
    mov r0, #0x1
    bl func_ov059_02211854
    ldr r1, [r5, #0x28]
    mov r0, r5
    bl func_ov059_02211920
    mov r0, r5
    bl Scene_GetEmbedded10
    mov r1, #0x1
    bl TouchRegionManager_SetEnabled
    mov r0, r5
    bl Scene_GetEmbedded10
    mov r1, #0x1
    bl TouchRegionManager_NotifyAll
    mov r0, r5
    bl Scene_SetFlags03
    mov r0, #0x1
    mov r1, #0x10
    bl DisplayBrightness_StartSubTransition
    mov r0, #0x1
    mov r1, #0x10
    bl DisplayBrightness_StartMainTransition
    ldr r0, [r5, #0x24]
    add r0, r0, #0x1
    str r0, [r5, #0x24]
.L_02211424:
    ldr r0, [r5, #0x3c]
    ldr r2, [r5, #0x50]
    mov r1, #0x0
    bl func_ov059_02210db0
    bl DisplayBrightness_IsSubTransitionIncreasing
    cmp r0, #0x0
    bne .L_022117f0
    mov r0, #0xa
    str r0, [r5, #0x24]
.L_02211448:
    ldr r0, [r5, #0x3c]
    ldr r2, [r5, #0x50]
    mov r1, #0x0
    bl func_ov059_02210db0
    ldr r0, [r5, #0x4c]
    cmp r0, #0x66
    bne .L_0221149c
    ldr r0, .L_02211848
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    bl Sound_Play
    mov r0, #0x2
    mov r1, #0x10
    bl DisplayBrightness_StartSubTransition
    mov r0, #0x2
    mov r1, #0x10
    bl DisplayBrightness_StartMainTransition
    mov r0, #0x12c
    str r0, [r5, #0x24]
    b .L_022117f0
.L_0221149c:
    cmp r0, #0x64
    ldr r4, [r5, #0x28]
    bne .L_022114cc
    ldr r0, .L_02211848
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, r1
    bl Sound_Play
    mvn r0, #0x0
    str r0, [r5, #0x4c]
    sub r4, r4, #0x1
    b .L_022114f4
.L_022114cc:
    cmp r0, #0x65
    bne .L_022114f4
    ldr r0, .L_02211848
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, r1
    bl Sound_Play
    mvn r0, #0x0
    str r0, [r5, #0x4c]
    add r4, r4, #0x1
.L_022114f4:
    cmp r4, #0x0
    movlt r4, #0x0
    blt .L_0221150c
    ldr r0, [r5, #0x2c]
    cmp r4, r0
    subge r4, r0, #0x1
.L_0221150c:
    ldr r0, [r5, #0x28]
    cmp r4, r0
    ble .L_02211544
    ldr r1, [r5, #0x50]
    mov r0, r5
    add r2, r1, #0x80
    bl func_ov059_02211a14
    ldr r1, [r5, #0x28]
    ldr r0, [r5, #0x3c]
    add r1, r1, #0x1
    bl func_ov059_02210dfc
    mov r0, #0x64
    str r0, [r5, #0x24]
    b .L_022117f0
.L_02211544:
    bge .L_02211574
    ldr r1, [r5, #0x50]
    mov r0, r5
    sub r2, r1, #0x80
    bl func_ov059_02211a14
    ldr r1, [r5, #0x28]
    ldr r0, [r5, #0x3c]
    sub r1, r1, #0x1
    bl func_ov059_02210dfc
    mov r0, #0xc8
    str r0, [r5, #0x24]
    b .L_022117f0
.L_02211574:
    add r0, r5, #0x40
    mov r1, #0x68
    mov r2, #0xab
    bl DebugSpriteText_DrawCentered
    b .L_022117f0
.L_02211588:
    ldr r1, [r5, #0x28]
    mov r0, r5
    add r1, r1, #0x1
    bl func_ov059_022119e4
    cmp r0, #0x0
    beq .L_022115d4
    ldr r1, [r5, #0x28]
    ldr r0, [r5, #0x3c]
    sub r1, r1, #0x1
    bl func_ov059_02210cb8
    ldr r0, [r5, #0x28]
    add r1, r0, #0x1
    str r1, [r5, #0x28]
    ldr r0, [r5, #0x3c]
    add r1, r1, #0x1
    bl func_ov059_02210cf8
    ldr r0, [r5, #0x3c]
    mov r1, #0x1
    bl func_ov059_02210c24
.L_022115d4:
    add r0, r5, #0x54
    bl SplineMover_Update
    mov r4, r0
    add r0, sp, #0x10
    add r1, r5, #0x54
    bl SplineMover_Evaluate2D
    ldr r1, [sp, #0x18]
    add r0, sp, #0x10
    mov r1, r1, asr #0xc
    str r1, [r5, #0x50]
    bl VecFx32Object_Destroy
    ldr r0, [r5, #0x3c]
    ldr r2, [r5, #0x50]
    mov r1, #0x0
    bl func_ov059_02210db0
    cmp r4, #0x0
    bne .L_022117f0
    ldr r0, .L_0221184c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfb8]
    bl GamePhaseAreaScene_GetConfig
    bl GamePhaseMetadata_GetTextResourceId
    mov r1, r0, lsl #0x10
    add r0, r5, #0x40
    mov r1, r1, lsr #0x10
    bl DebugSpriteText_SetTextResource
    ldr r0, [r5, #0x3c]
    mov r1, #0x1
    bl func_ov059_02210f34
    mov r0, #0xa
    str r0, [r5, #0x24]
    b .L_022117f0
.L_02211658:
    ldr r1, [r5, #0x28]
    mov r0, r5
    sub r1, r1, #0x1
    bl func_ov059_022119e4
    cmp r0, #0x0
    beq .L_022116a4
    ldr r1, [r5, #0x28]
    ldr r0, [r5, #0x3c]
    add r1, r1, #0x1
    bl func_ov059_02210cb8
    ldr r0, [r5, #0x28]
    sub r1, r0, #0x1
    str r1, [r5, #0x28]
    ldr r0, [r5, #0x3c]
    sub r1, r1, #0x1
    bl func_ov059_02210cf8
    ldr r0, [r5, #0x3c]
    mov r1, #0x1
    bl func_ov059_02210c24
.L_022116a4:
    add r0, r5, #0x54
    bl SplineMover_Update
    mov r4, r0
    add r0, sp, #0x0
    add r1, r5, #0x54
    bl SplineMover_Evaluate2D
    ldr r1, [sp, #0x8]
    add r0, sp, #0x0
    mov r1, r1, asr #0xc
    str r1, [r5, #0x50]
    bl VecFx32Object_Destroy
    ldr r0, [r5, #0x3c]
    ldr r2, [r5, #0x50]
    mov r1, #0x0
    bl func_ov059_02210db0
    cmp r4, #0x0
    bne .L_022117f0
    ldr r0, .L_0221184c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfb8]
    bl GamePhaseAreaScene_GetConfig
    bl GamePhaseMetadata_GetTextResourceId
    mov r1, r0, lsl #0x10
    add r0, r5, #0x40
    mov r1, r1, lsr #0x10
    bl DebugSpriteText_SetTextResource
    ldr r0, [r5, #0x3c]
    mov r1, #0x1
    bl func_ov059_02210f34
    mov r0, #0xa
    str r0, [r5, #0x24]
    b .L_022117f0
.L_02211728:
    bl DisplayBrightness_IsSubTransitionDecreasing
    cmp r0, #0x0
    bne .L_022117f0
    ldr r0, [r5, #0x24]
    add r0, r0, #0x1
    str r0, [r5, #0x24]
.L_02211740:
    mov r0, r5
    bl Scene_ClearFlags03
    mov r0, #0x0
    bl func_ov059_02211854
    ldr r2, .L_02211850
    ldr r0, .L_0221184c
    ldr r1, [r2, #0x0]
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1000
    str r1, [r2, #0x0]
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_DestroySecondaryActorSubsystem
    ldr r0, .L_0221184c
    mov r2, #0x1
    ldr r0, [r0, #0x0]
    add r1, r0, #0x3000
    ldr r1, [r1, #0xbc]
    bl GamePhaseRuntime_CreateSecondaryActorSubsystem
    ldr r0, .L_0221184c
    ldr r1, [r0, #0x0]
    add r0, r1, #0x2000
    ldr r0, [r0, #0xfb8]
    add r1, r1, #0x3a4
    add r1, r1, #0x2c00
    bl GamePhaseAreaScene_ApplyRevealedRegions
    ldr r0, .L_0221184c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    mov r2, r1
    bl GamePhaseRuntime_ApplyScreenMode
    mov r0, #0x1
    mov r1, #0x10
    bl DisplayBrightness_StartSubTransition
    mov r0, #0x1
    mov r1, #0x10
    bl DisplayBrightness_StartMainTransition
    cmp r5, #0x0
    beq .L_022117e8
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_022117e8:
    mov r0, #0x1
    b .L_02211838
.L_022117f0:
    ldr r0, [r5, #0x48]
    cmp r0, #0x0
    beq .L_02211810
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroup_AdvanceAnimations
    mov r0, r5
    bl Scene_GetEmbedded10
    bl TouchRegionManager_Tick
.L_02211810:
    ldr r0, .L_0221184c
    ldr r1, [r5, #0x4]
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    bl GamePhaseRuntime_PrepareActorCollections
    ldr r0, .L_0221184c
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_UpdateActorPresentationState
    mov r0, #0x0
.L_02211838:
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, pc}
.L_02211840: .word gDebugFont
.L_02211844: .word 0x12d
.L_02211848: .word gSoundContext
.L_0221184c: .word data_021052fc
.L_02211850: .word 0x4001000
.size func_ov059_02211330, . - func_ov059_02211330
