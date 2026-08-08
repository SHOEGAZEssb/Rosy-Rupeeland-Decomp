.text
/* Exact fallback; see overlay040_small_helpers.c for portable C. */
    .extern func_02099fb0
    .global func_ov040_0220262c
func_ov040_0220262c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02099fb0
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov040_0220262c, .-func_ov040_0220262c
