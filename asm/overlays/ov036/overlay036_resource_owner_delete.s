.text

/* Exact fallback; see src/overlays/ov036/overlay036_scene_lifecycle.c for documented portable C. */

    .extern GraphicsResourceSetVariant_Destroy
    .extern Heap_Free

    .global func_ov036_022049a8
func_ov036_022049a8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0xcc
    bl GraphicsResourceSetVariant_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov036_022049a8, .-func_ov036_022049a8

