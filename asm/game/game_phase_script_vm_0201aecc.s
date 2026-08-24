; Matching retail form; see src/game/game_phase_script_vm_runtime_entity_position_opcodes.c.
.text
.extern GamePhaseScriptVm_StoreResultAndUpdateCondition
.extern gGamePhaseRuntime
.global GamePhaseActorScriptVm_GetActiveEntityPositionZ
GamePhaseActorScriptVm_GetActiveEntityPositionZ: ; 0x0201aecc
    stmdb sp!, {r3, lr}
    ldr r2, L_0201aefc
    mov r1, #0x0
    ldr r2, [r2, #0x0]
    add r2, r2, #0x2000
    ldr r2, [r2, #0xea8]
    cmp r2, #0x0
    ldrne r1, [r2, #0x24]
    movne r1, r1, asr #0xc
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_0201aefc: .word gGamePhaseRuntime
.size GamePhaseActorScriptVm_GetActiveEntityPositionZ, . - GamePhaseActorScriptVm_GetActiveEntityPositionZ
