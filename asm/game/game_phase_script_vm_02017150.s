; Matching retail form; see src/game/game_phase_script_vm_currency_opcodes.c.
.text
.extern GamePhaseCurrencyHud_SetCurrency
.extern func_02012704
.extern gLupyContext
.global func_02017150
func_02017150:
    stmdb sp!, {r3, lr}
    bl func_02012704
    ldr r2, L_02017170
    mov r1, r0
    ldr r0, [r2]
    bl GamePhaseCurrencyHud_SetCurrency
    mov r0, #0
    ldmia sp!, {r3, pc}
L_02017170: .word gLupyContext
    .size func_02017150, . - func_02017150
