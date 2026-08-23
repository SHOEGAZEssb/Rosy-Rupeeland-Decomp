; Matching retail form; see src/game/game_phase_state_lifecycle.c.
.text
.extern RuntimePresentationManager_DestroyAllEffects
.extern RuntimePresentationManager_GetGraphics3dPresentation
.extern ActorCollection_UnregisterAndDestroyAllActors
.extern ActorFeedback_DestroyPresentations
.extern Graphics3dPresentation_Clear

    .global GamePhaseState_ResetRuntime
GamePhaseState_ResetRuntime: ; 0x0200e61c
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x358
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_DestroyAllEffects
    add r0, r4, #0x358
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    bl Graphics3dPresentation_Clear
    bl ActorFeedback_DestroyPresentations
    add r0, r4, #0x4
    bl ActorCollection_UnregisterAndDestroyAllActors
    ldmia sp!, {r4, pc}
    .size GamePhaseState_ResetRuntime, . - GamePhaseState_ResetRuntime

