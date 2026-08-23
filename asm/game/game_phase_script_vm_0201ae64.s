; Matching retail form; see src/game/game_phase_script_vm_runtime_entity_position_opcodes.c.
.text
.extern GamePhaseScriptVm_StoreResultAndUpdateCondition
.extern data_021052fc
.global GamePhaseActorScriptVm_GetActiveEntityPositionX
GamePhaseActorScriptVm_GetActiveEntityPositionX: ; 0x0201ae64
    stmdb sp!, {r3, lr}
    ldr r2, L_0201ae94
    mov r1, #0x0
    ldr r2, [r2, #0x0]
    add r2, r2, #0x2000
    ldr r2, [r2, #0xea8]
    cmp r2, #0x0
    ldrne r1, [r2, #0x1c]
    movne r1, r1, asr #0xc
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_0201ae94: .word data_021052fc
.size GamePhaseActorScriptVm_GetActiveEntityPositionX, . - GamePhaseActorScriptVm_GetActiveEntityPositionX
