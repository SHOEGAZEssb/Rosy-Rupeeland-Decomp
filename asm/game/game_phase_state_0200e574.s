; Matching retail form; see src/game/game_phase_state_lifecycle.c.
.text
.extern OverlaySlot_Destroy
.extern GamePhaseState_UnloadPhase
.extern GamePhaseVisualEffect_Destroy
.extern func_0201155c
.extern func_0201dc98
.extern ActorCollection_Destructor

    .global GamePhaseState_Destroy
GamePhaseState_Destroy: ; 0x0200e574
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseState_UnloadPhase
    add r0, r4, #0x2f80
    bl func_0201155c
    add r0, r4, #0x358
    add r0, r0, #0x2c00
    bl func_0201dc98
    add r0, r4, #0x2b4
    add r0, r0, #0x2c00
    bl GamePhaseVisualEffect_Destroy
    add r0, r4, #0x2a4
    add r0, r0, #0x2c00
    bl OverlaySlot_Destroy
    add r0, r4, #0x4
    bl ActorCollection_Destructor
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size GamePhaseState_Destroy, . - GamePhaseState_Destroy

