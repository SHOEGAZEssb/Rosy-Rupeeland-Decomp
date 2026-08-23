; Matching retail form; see src/game/game_phase_state_runtime.c.
.text
.extern DebugText_BeginFrame
.extern GameWork_SetFlag
.extern GamePhaseRegionTable_Destroy
.extern RuntimePresentationManager_DestroyAllEffects
.extern RuntimePresentationManager_GetGraphics3dPresentation
.extern ActorCollection_DestroyUnretainedActors
.extern ActorDerivedType1_ClearFailureCounter
.extern ActorFeedback_DestroyPresentations
.extern Graphics3dPresentation_Clear
.extern gGameWork

    .global GamePhaseState_ResetActivePhase
GamePhaseState_ResetActivePhase: ; 0x0200ea48
    stmdb sp!, {r4, lr}
    ldr r1, L_0200eb08
    mov r3, #0x0
    ldr r2, [r1, #0x0]
    mov r4, r0
    add r0, r2, #0x200
    strh r3, [r0, #0x28]
    ldr r0, [r1, #0x0]
    mov r1, #0x3ec
    bl GameWork_SetFlag
    ldr r2, L_0200eb08
    mov r3, #0x0
    ldr r1, [r2, #0x0]
    add r0, r4, #0x2f80
    add r1, r1, #0x200
    strh r3, [r1, #0xc]
    ldr r1, [r2, #0x0]
    add r1, r1, #0x200
    strh r3, [r1, #0xe]
    bl GamePhaseRegionTable_Destroy
    add r0, r4, #0x358
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_DestroyAllEffects
    add r0, r4, #0x358
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    bl Graphics3dPresentation_Clear
    bl ActorFeedback_DestroyPresentations
    add r0, r4, #0x2000
    ldr r0, [r0, #0xeb0]
    mov r1, #0x0
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    add r0, r4, #0x2000
    ldr r0, [r0, #0xeb0]
    cmp r0, #0x0
    beq L_0200eaec
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0200eaec:
    add r0, r4, #0x4
    bl ActorCollection_DestroyUnretainedActors
    add r0, r4, #0x2000
    ldr r0, [r0, #0xe80]
    bl ActorDerivedType1_ClearFailureCounter
    bl DebugText_BeginFrame
    ldmia sp!, {r4, pc}
L_0200eb08: .word gGameWork
    .size GamePhaseState_ResetActivePhase, . - GamePhaseState_ResetActivePhase

