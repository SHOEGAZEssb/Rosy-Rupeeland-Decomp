.text
/* Exact fallback; see overlay039_resource_objects.c for portable C. */
    .extern Heap_Free
    .global func_ov039_022058c4
func_ov039_022058c4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov039_022058c4, .-func_ov039_022058c4

