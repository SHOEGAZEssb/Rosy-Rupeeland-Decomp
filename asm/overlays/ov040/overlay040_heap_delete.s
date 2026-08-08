.text
/* Exact fallback; see overlay040_small_helpers.c for portable C. */
    .extern Heap_Free
    .global func_ov040_02202e90
func_ov040_02202e90:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov040_02202e90, .-func_ov040_02202e90
