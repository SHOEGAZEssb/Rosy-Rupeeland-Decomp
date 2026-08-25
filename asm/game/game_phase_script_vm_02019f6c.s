; Matching retail form; see src/game/game_phase_script_vm_misc_runtime_opcodes.c.
.text
.extern data_021f5f18
.extern GamePhaseScriptVm_Pop
.extern RetailSelectionHistory_SetTrailingValue
.global GamePhaseActorScriptVm_SetSelectionHistoryTrailingValue
GamePhaseActorScriptVm_SetSelectionHistoryTrailingValue:
    stmdb sp!, {r3, lr}
    bl GamePhaseScriptVm_Pop
    mov r1, r0
    ldr r0, L_02019f88
    bl RetailSelectionHistory_SetTrailingValue
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_02019f88: .word data_021f5f18
.size GamePhaseActorScriptVm_SetSelectionHistoryTrailingValue, . - GamePhaseActorScriptVm_SetSelectionHistoryTrailingValue
