; Matching retail form; see src/game/game_phase_script_vm_currency_opcodes.c.
.text
.extern GamePhaseCurrencyHud_GetCurrency
.extern GamePhaseScriptVm_SetResult
.extern gLupyContext
.global GamePhaseActorScriptVm_GetCurrency
GamePhaseActorScriptVm_GetCurrency:
    stmdb sp!, {r4, lr}
    ldr r1, L_020171ec
    mov r4, r0
    ldr r0, [r1]
    bl GamePhaseCurrencyHud_GetCurrency
    mov r1, r0
    mov r0, r4
    bl GamePhaseScriptVm_SetResult
    mov r0, #0
    ldmia sp!, {r4, pc}
L_020171ec: .word gLupyContext
    .size GamePhaseActorScriptVm_GetCurrency, . - GamePhaseActorScriptVm_GetCurrency
