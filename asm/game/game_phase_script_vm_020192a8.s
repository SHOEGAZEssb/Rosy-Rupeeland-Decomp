; Matching retail form; see src/game/game_phase_script_vm_runtime_utility_query_opcodes.c.
.text
.extern GamePhaseScriptVm_StoreResultAndUpdateCondition
.extern gGameWork
.global GamePhaseActorScriptVm_GetNegatedCurrencyDecreaseAccumulator
GamePhaseActorScriptVm_GetNegatedCurrencyDecreaseAccumulator:
    stmdb sp!, {r3, lr}
    ldr r1, L_020192c8
    ldr r1, [r1, #0x0]
    ldr r1, [r1, #0x48]
    rsb r1, r1, #0x0
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_020192c8: .word gGameWork
.size GamePhaseActorScriptVm_GetNegatedCurrencyDecreaseAccumulator, . - GamePhaseActorScriptVm_GetNegatedCurrencyDecreaseAccumulator
