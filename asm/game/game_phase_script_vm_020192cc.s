; Matching retail form; see src/game/game_phase_script_vm_runtime_utility_query_opcodes.c.
.text
.extern gGameWork
.global GamePhaseActorScriptVm_ClearCurrencyChangeAccumulators
GamePhaseActorScriptVm_ClearCurrencyChangeAccumulators:
    ldr r1, L_020192e8
    mov r0, #0x0
    ldr r2, [r1, #0x0]
    str r0, [r2, #0x44]
    ldr r1, [r1, #0x0]
    str r0, [r1, #0x48]
    bx lr
L_020192e8: .word gGameWork
.size GamePhaseActorScriptVm_ClearCurrencyChangeAccumulators, . - GamePhaseActorScriptVm_ClearCurrencyChangeAccumulators
