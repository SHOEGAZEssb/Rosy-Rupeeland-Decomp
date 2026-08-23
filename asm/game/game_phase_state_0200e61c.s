; Matching retail form; see src/game/game_phase_state_lifecycle.c.
.text
.extern func_0201df64
.extern RuntimePresentationManager_GetGraphics3dPresentation
.extern ActorCollection_UnregisterAndDestroyAllActors
.extern ActorFeedback_DestroyPresentations
.extern func_020a2324

    .global GamePhaseState_ResetRuntime
GamePhaseState_ResetRuntime: ; 0x0200e61c
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x358
    add r0, r0, #0x2c00
    bl func_0201df64
    add r0, r4, #0x358
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    bl func_020a2324
    bl ActorFeedback_DestroyPresentations
    add r0, r4, #0x4
    bl ActorCollection_UnregisterAndDestroyAllActors
    ldmia sp!, {r4, pc}
    .size GamePhaseState_ResetRuntime, . - GamePhaseState_ResetRuntime

