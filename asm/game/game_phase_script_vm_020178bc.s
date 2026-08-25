; Matching retail form; see src/game/game_phase_script_vm_global_object_query_opcodes.c.
.text
.extern data_021f5128
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_StoreResultAndUpdateCondition
.extern RetailRecordManager_IsSelectorAvailable
.global GamePhaseActorScriptVm_IsRetailRecordSelectorAvailable
GamePhaseActorScriptVm_IsRetailRecordSelectorAvailable:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    ldr r2, L_020178f8
    mov r1, r0
    ldr r0, [r2]
    mov r4, #0
    bl RetailRecordManager_IsSelectorAvailable
    cmp r0, #0
    movne r4, #1
    mov r0, r5
    mov r1, r4
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    mov r0, #0
    ldmia sp!, {r3, r4, r5, pc}
L_020178f8: .word data_021f5128
    .size GamePhaseActorScriptVm_IsRetailRecordSelectorAvailable, . - GamePhaseActorScriptVm_IsRetailRecordSelectorAvailable
