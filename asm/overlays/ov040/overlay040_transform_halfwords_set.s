.text
/* Exact fallback; see overlay040_opening_helpers.c for portable C. */
    .global func_ov040_021fceb0
func_ov040_021fceb0:
    strh r1, [r0, #0x3c]
    strh r2, [r0, #0x3e]
    bx lr
    .size func_ov040_021fceb0, .-func_ov040_021fceb0
