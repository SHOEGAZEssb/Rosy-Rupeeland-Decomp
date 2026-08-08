.text
/* Exact fallback; see overlay039_scene_lifecycle.c for portable C. */
    .extern Heap_Free
    .global func_ov039_02200cc4
func_ov039_02200cc4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov039_02200cc4, .-func_ov039_02200cc4

