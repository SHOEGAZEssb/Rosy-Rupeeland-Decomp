; Matching retail form; see src/game/game_phase_state_runtime.c.
.text
.extern RuntimePresentationManager_DispatchHBlankCallbacks

    .global GamePhaseState_ForwardVCount
GamePhaseState_ForwardVCount: ; 0x0200ea34
    ldr ip, L_0200ea44
    add r0, r0, #0x358
    add r0, r0, #0x2c00
    bx ip
L_0200ea44: .word RuntimePresentationManager_DispatchHBlankCallbacks
    .size GamePhaseState_ForwardVCount, . - GamePhaseState_ForwardVCount

