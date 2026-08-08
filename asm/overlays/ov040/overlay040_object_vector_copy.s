.text
/* Exact fallback; see overlay040_small_helpers.c for portable C. */
    .extern func_02005030
    .global func_ov040_02200108
func_ov040_02200108:
    ldr r12, L_02200114
    add r1, r1, #0x2c
    bx r12
L_02200114: .word func_02005030
    .size func_ov040_02200108, .-func_ov040_02200108
