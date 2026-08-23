; Matching retail form; see src/game/game_phase_state_controls.c.
.text
.extern GamePhaseVisualEffect_UpdatePosition
.extern GamePhaseVisualEffect_SetEnabled
.extern RuntimePresentationManager_SetEnabled
.extern ActorCollection_SetEnabled

    .global GamePhaseState_SetEnabled
GamePhaseState_SetEnabled: ; 0x0200ec6c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    add r0, r5, #0x2000
    ldr r0, [r0, #0xeb0]
    mov r4, r1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r1, r4
    add r0, r5, #0x4
    bl ActorCollection_SetEnabled
    add r0, r5, #0x2b4
    mov r1, r4
    add r0, r0, #0x2c00
    bl GamePhaseVisualEffect_SetEnabled
    add r0, r5, #0x358
    mov r1, r4
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_SetEnabled
    ldmia sp!, {r3, r4, r5, pc}
    .size GamePhaseState_SetEnabled, . - GamePhaseState_SetEnabled

    .global GamePhaseState_ApplyPlacementState
GamePhaseState_ApplyPlacementState: ; 0x0200ecbc
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    add r0, r5, #0x2000
    ldr r0, [r0, #0xeb0]
    mov r4, r1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x18]
    blx r2
    add r0, r5, #0x2b4
    mov r1, r4
    add r0, r0, #0x2c00
    bl GamePhaseVisualEffect_UpdatePosition
    ldmia sp!, {r3, r4, r5, pc}
    .size GamePhaseState_ApplyPlacementState, . - GamePhaseState_ApplyPlacementState

