; Matching retail form; see src/game/game_phase_script_vm_currency_opcodes.c.
.text
.extern GamePhaseCurrencyHud_AddCurrency
.extern GamePhaseScriptVm_Pop
.extern gGamePhaseCurrencyHud
.global GamePhaseActorScriptVm_AddCurrency
GamePhaseActorScriptVm_AddCurrency:
    stmdb sp!, {r3, lr}
    bl GamePhaseScriptVm_Pop
    ldr r2, L_0201714c
    mov r1, r0
    ldr r0, [r2]
    mov r2, #0
    bl GamePhaseCurrencyHud_AddCurrency
    mov r0, #0
    ldmia sp!, {r3, pc}
L_0201714c: .word gGamePhaseCurrencyHud
    .size GamePhaseActorScriptVm_AddCurrency, . - GamePhaseActorScriptVm_AddCurrency
