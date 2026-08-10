; Matching retail form; see src/game/game_phase_currency_hud_values.c.
.text
.extern gGameWork

    .global GamePhaseCurrencyHud_GetCurrency
GamePhaseCurrencyHud_GetCurrency: ; 0x02010b64
    ldr r0, L_02010b74
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x40]
    bx lr
L_02010b74: .word gGameWork
    .size GamePhaseCurrencyHud_GetCurrency, . - GamePhaseCurrencyHud_GetCurrency

