; Matching retail form; see src/game/game_phase_script_vm_misc_runtime_opcodes.c.
.text
.extern data_021f5f18
.extern GamePhaseScriptVm_Pop
.extern RetailSelectionHistory_InsertUniqueId
.global GamePhaseActorScriptVm_InsertSelectionHistoryId
GamePhaseActorScriptVm_InsertSelectionHistoryId:
    stmdb sp!, {r3, lr}
    bl GamePhaseScriptVm_Pop
    mov r1, r0
    ldr r0, L_02019f68
    bl RetailSelectionHistory_InsertUniqueId
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_02019f68: .word data_021f5f18
.size GamePhaseActorScriptVm_InsertSelectionHistoryId, . - GamePhaseActorScriptVm_InsertSelectionHistoryId
