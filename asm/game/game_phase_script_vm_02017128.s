; Matching retail form; see src/game/game_phase_script_vm_currency_opcodes.c.
.text
.extern GamePhaseCurrencyHud_AddCurrency
.extern func_02012704
.extern gLupyContext
.global func_02017128
func_02017128:
    stmdb sp!, {r3, lr}
    bl func_02012704
    ldr r2, L_0201714c
    mov r1, r0
    ldr r0, [r2]
    mov r2, #0
    bl GamePhaseCurrencyHud_AddCurrency
    mov r0, #0
    ldmia sp!, {r3, pc}
L_0201714c: .word gLupyContext
    .size func_02017128, . - func_02017128
