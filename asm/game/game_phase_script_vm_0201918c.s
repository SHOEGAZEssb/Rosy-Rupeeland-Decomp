; Matching retail form; see src/game/game_phase_script_vm_runtime_utility_query_opcodes.c.
.text
.extern GamePhaseScriptVm_StoreResultAndUpdateCondition
.extern RetailSaveContext_BeginRecordOperation
.extern gRuntimeContext
.global GamePhaseActorScriptVm_QueryRuntimeContextFixedMode
GamePhaseActorScriptVm_QueryRuntimeContextFixedMode:
    stmdb sp!, {r4, lr}
    ldr r2, L_020191c0
    mov r4, r0
    mov r1, #0x0
    ldr r0, [r2, #0x0]
    mov r2, r1
    mov r3, #0x1
    bl RetailSaveContext_BeginRecordOperation
    mov r1, r0
    mov r0, r4
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_020191c0: .word gRuntimeContext
.size GamePhaseActorScriptVm_QueryRuntimeContextFixedMode, . - GamePhaseActorScriptVm_QueryRuntimeContextFixedMode
