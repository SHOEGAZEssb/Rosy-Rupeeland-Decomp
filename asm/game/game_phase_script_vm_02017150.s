; Matching retail form; see src/game/game_phase_script_vm_currency_opcodes.c.
.text
.extern GamePhaseCurrencyHud_SetCurrency
.extern GamePhaseScriptVm_Pop
.extern gGamePhaseCurrencyHud
.global GamePhaseActorScriptVm_SetCurrency
GamePhaseActorScriptVm_SetCurrency:
    stmdb sp!, {r3, lr}
    bl GamePhaseScriptVm_Pop
    ldr r2, L_02017170
    mov r1, r0
    ldr r0, [r2]
    bl GamePhaseCurrencyHud_SetCurrency
    mov r0, #0
    ldmia sp!, {r3, pc}
L_02017170: .word gGamePhaseCurrencyHud
    .size GamePhaseActorScriptVm_SetCurrency, . - GamePhaseActorScriptVm_SetCurrency
