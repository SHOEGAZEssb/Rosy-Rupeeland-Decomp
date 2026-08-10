; Matching retail form; see src/game/game_phase_state_lifecycle.c.
.text
.extern GamePhaseState_ResetRuntime
.extern GamePhaseRegionTable_Destroy
.extern ActorCollection_Deinit

    .global GamePhaseState_UnloadPhase
GamePhaseState_UnloadPhase: ; 0x0200e5bc
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x2b4
    add r0, r0, #0x2c00
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    add r0, r4, #0x2f80
    bl GamePhaseRegionTable_Destroy
    mov r0, r4
    bl GamePhaseState_ResetRuntime
    add r0, r4, #0x4
    bl ActorCollection_Deinit
    add r0, r4, #0x2000
    ldr r0, [r0, #0xeb0]
    cmp r0, #0x0
    beq L_0200e60c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0200e60c:
    add r0, r4, #0x2000
    mov r1, #0x0
    str r1, [r0, #0xeb0]
    ldmia sp!, {r4, pc}
    .size GamePhaseState_UnloadPhase, . - GamePhaseState_UnloadPhase

