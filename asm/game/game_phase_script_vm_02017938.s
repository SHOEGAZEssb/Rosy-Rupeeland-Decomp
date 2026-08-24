; Matching retail form; see src/game/game_phase_script_vm_global_object_query_opcodes.c.
.text
.extern data_021f5128
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_StoreResultAndUpdateCondition
.extern RetailRecordManager_GetType1Tier
.global GamePhaseActorScriptVm_QueryRetailRecordTier
GamePhaseActorScriptVm_QueryRetailRecordTier:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    ldr r2, L_02017978
    mov r1, r0
    ldr r0, [r2]
    mov r2, r4
    bl RetailRecordManager_GetType1Tier
    mov r1, r0
    mov r0, r5
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    mov r0, #0
    ldmia sp!, {r3, r4, r5, pc}
L_02017978: .word data_021f5128
    .size GamePhaseActorScriptVm_QueryRetailRecordTier, . - GamePhaseActorScriptVm_QueryRetailRecordTier
