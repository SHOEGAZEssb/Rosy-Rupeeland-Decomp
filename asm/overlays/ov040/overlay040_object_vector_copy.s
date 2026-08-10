.text
/* Exact fallback; see overlay040_small_helpers.c for portable C. */
    .extern VecFx32Object_InitCopy
    .global func_ov040_02200108
func_ov040_02200108:
    ldr r12, L_02200114
    add r1, r1, #0x2c
    bx r12
L_02200114: .word VecFx32Object_InitCopy
    .size func_ov040_02200108, .-func_ov040_02200108
