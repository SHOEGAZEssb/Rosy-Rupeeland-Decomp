.text
/* Exact fallback; see overlay040_small_helpers.c for portable C. */
    .extern func_020050a4
    .global func_ov040_02200118
func_ov040_02200118:
    ldr r12, L_02200124
    add r0, r0, #0x2c
    bx r12
L_02200124: .word func_020050a4
    .size func_ov040_02200118, .-func_ov040_02200118
