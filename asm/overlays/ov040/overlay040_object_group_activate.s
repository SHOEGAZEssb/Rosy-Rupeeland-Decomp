.text
/* Exact fallback; see overlay040_small_helpers.c for portable C. */
    .global func_ov040_02202a10
func_ov040_02202a10:
    ldr r1, [r0, #0x58]
    mov r3, #0x4
    strh r3, [r1, #0x42]
    ldr r2, [r0, #0x5c]
    mov r1, #0x1
    strh r3, [r2, #0x42]
    ldr r2, [r0, #0x60]
    strh r3, [r2, #0x42]
    ldr r2, [r0, #0x64]
    strh r3, [r2, #0x42]
    ldr r2, [r0, #0x68]
    strh r3, [r2, #0x42]
    ldr r2, [r0, #0x6c]
    strh r3, [r2, #0x42]
    str r1, [r0, #0x50]
    bx lr
    .size func_ov040_02202a10, .-func_ov040_02202a10
