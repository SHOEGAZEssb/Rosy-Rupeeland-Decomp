.text
/* Exact fallback; see overlay040_small_helpers.c for portable C. */
    .extern func_02072b68
    .global func_ov040_02202214
func_ov040_02202214:
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0xba4]
    cmp r2, #0x0
    ldmgtia sp!, {r3, pc}
    mov r2, #0x96
    str r2, [r0, #0xba4]
    str r1, [r0, #0xba8]
    ldr r0, [r0, #0xba0]
    mov r1, #0x0
    ldr r0, [r0, #0xc]
    bl func_02072b68
    ldmia sp!, {r3, pc}
    .size func_ov040_02202214, .-func_ov040_02202214
