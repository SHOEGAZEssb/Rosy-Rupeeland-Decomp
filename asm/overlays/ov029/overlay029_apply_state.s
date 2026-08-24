.text

/* Exact fallback; see src/overlays/ov029/overlay029_lifecycle_tail.c. */
.extern data_ov029_021fec60
.extern GamePhaseCurrencyHud_GetCurrency
.extern GamePhaseCurrencyHud_AddCurrency
.extern func_ov029_021fce4c
.extern func_ov029_021fd6fc
.extern func_ov029_021fd850
.extern func_ov045_0220b924
.extern func_ov045_0220b9b8
.extern func_ov045_0220bc34
.extern gGamePhaseCurrencyHud


    .global func_ov029_021fe7b0
func_ov029_021fe7b0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq L_021fe7d0
    cmp r1, #0x1
    beq L_021fe828
    b L_021fe858
L_021fe7d0:
    bl func_ov029_021fd850
    cmp r0, #0x0
    beq L_021fe858
    ldr r0, L_021fe868
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_GetCurrency
    mov r1, r0
    ldr r0, [r4, #0xd0]
    ldr r2, [r4, #0xac]
    mov r3, #0x0
    bl func_ov045_0220b924
    ldr r1, L_021fe868
    mov r2, r0
    ldr r0, [r1, #0x0]
    ldr r1, [r4, #0xac]
    bl GamePhaseCurrencyHud_AddCurrency
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe858
L_021fe828:
    ldr r0, [r4, #0xd0]
    bl func_ov045_0220b9b8
    cmp r0, #0x0
    beq L_021fe858
    ldr r0, [r4, #0xd0]
    bl func_ov045_0220bc34
    cmp r0, #0x0
    bne L_021fe858
    ldr r1, L_021fe86c
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov029_021fce4c
L_021fe858:
    mov r0, r4
    bl func_ov029_021fd6fc
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fe868: .word gGamePhaseCurrencyHud
L_021fe86c: .word data_ov029_021fec60
.size func_ov029_021fe7b0, .-func_ov029_021fe7b0
