.text
/* Exact fallback; see overlay040_small_helpers.c for portable C. */
    .global func_ov040_021fe18c
func_ov040_021fe18c:
    ldr r2, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r2, [r1, #0x4]
    str r2, [r0, #0x4]
    ldr r2, [r1, #0x8]
    str r2, [r0, #0x8]
    ldr r1, [r1, #0xc]
    str r1, [r0, #0xc]
    bx lr
    .size func_ov040_021fe18c, .-func_ov040_021fe18c
