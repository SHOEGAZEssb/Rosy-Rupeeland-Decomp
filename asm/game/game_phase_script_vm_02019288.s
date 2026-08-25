; Matching retail form; see src/game/game_phase_script_vm_runtime_utility_query_opcodes.c.
.text
.extern GamePhaseScriptVm_StoreResultAndUpdateCondition
.extern gGameWork
.global GamePhaseActorScriptVm_GetCurrencyIncreaseAccumulator
GamePhaseActorScriptVm_GetCurrencyIncreaseAccumulator:
    stmdb sp!, {r3, lr}
    ldr r1, L_020192a4
    ldr r1, [r1, #0x0]
    ldr r1, [r1, #0x44]
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_020192a4: .word gGameWork
.size GamePhaseActorScriptVm_GetCurrencyIncreaseAccumulator, . - GamePhaseActorScriptVm_GetCurrencyIncreaseAccumulator
