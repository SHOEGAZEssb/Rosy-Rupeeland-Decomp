.text
/* Exact fallback; see overlay040_opening_helpers.c for portable C. */
    .global func_ov040_021fcea0
func_ov040_021fcea0:
    str r1, [r0, #0x30]
    str r2, [r0, #0x34]
    str r3, [r0, #0x38]
    bx lr
    .size func_ov040_021fcea0, .-func_ov040_021fcea0
