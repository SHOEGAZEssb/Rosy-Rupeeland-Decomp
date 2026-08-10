.text
/* Exact fallback; see overlay040_small_helpers.c for portable C. */
    .extern VecFx32Object_Assign
    .global func_ov040_02200118
func_ov040_02200118:
    ldr r12, L_02200124
    add r0, r0, #0x2c
    bx r12
L_02200124: .word VecFx32Object_Assign
    .size func_ov040_02200118, .-func_ov040_02200118
