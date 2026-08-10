; Matching retail form; see src/game/game_phase_currency_hud_values.c.
.text
.extern data_021052fc
.extern GamePhaseCurrencyHud_UpdateDigits
.extern gGameWork

    .global GamePhaseCurrencyHud_SetCurrency
GamePhaseCurrencyHud_SetCurrency: ; 0x02010b78
    stmdb sp!, {r3, lr}
    ldr r2, L_02010bf4
    ldr r2, [r2, #0x0]
    add r2, r2, #0x2000
    ldr r2, [r2, #0xea4]
    ldr r2, [r2, #0xd0]
    tst r2, #0x100
    ldmneia sp!, {r3, pc}
    ldr r2, L_02010bf8
    cmp r1, r2
    movgt r1, r2
    ldr r2, L_02010bfc
    ldr ip, [r2, #0x0]
    ldr r2, [ip, #0x40]
    sub r3, r1, r2
    cmp r3, #0x0
    ldrgt r2, [ip, #0x44]
    addgt r2, r2, r3
    strgt r2, [ip, #0x44]
    ldrle r2, [ip, #0x48]
    addle r2, r2, r3
    strle r2, [ip, #0x48]
    ldr r2, L_02010bfc
    ldr r3, [r2, #0x0]
    mov r2, #0x0
    str r1, [r3, #0x40]
    str r1, [r0, #0xc4]
    str r1, [r0, #0xc0]
    strh r2, [r0, #0xb4]
    bl GamePhaseCurrencyHud_UpdateDigits
    ldmia sp!, {r3, pc}
L_02010bf4: .word data_021052fc
L_02010bf8: .word 0x98967f
L_02010bfc: .word gGameWork
    .size GamePhaseCurrencyHud_SetCurrency, . - GamePhaseCurrencyHud_SetCurrency

