; Matching retail form; see src/game/game_phase_script_vm_currency_opcodes.c.
.text
.extern GamePhaseCurrencyHud_GetCurrency
.extern func_020127f8
.extern gLupyContext
.global func_020171c4
func_020171c4:
    stmdb sp!, {r4, lr}
    ldr r1, L_020171ec
    mov r4, r0
    ldr r0, [r1]
    bl GamePhaseCurrencyHud_GetCurrency
    mov r1, r0
    mov r0, r4
    bl func_020127f8
    mov r0, #0
    ldmia sp!, {r4, pc}
L_020171ec: .word gLupyContext
    .size func_020171c4, . - func_020171c4
