; Matching retail form; see src/game/game_phase_script_vm_currency_opcodes.c.
.text
.extern GamePhaseCurrencyHud_SetVisible
.extern func_02012704
.extern gLupyContext
.global func_02017174
func_02017174:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    bl func_02012704
    mov r5, r0
    mov r0, r6
    bl func_02012704
    mov r4, r0
    mov r0, r6
    bl func_02012704
    ldr r2, L_020171c0
    mov r1, r0
    ldr r0, [r2]
    bl GamePhaseCurrencyHud_SetVisible
    ldr r1, L_020171c0
    mov r0, #0
    ldr r1, [r1]
    strh r4, [r1, #0xbc]
    strh r5, [r1, #0xbe]
    ldmia sp!, {r4, r5, r6, pc}
L_020171c0: .word gLupyContext
    .size func_02017174, . - func_02017174
