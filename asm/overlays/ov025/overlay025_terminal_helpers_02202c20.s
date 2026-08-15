.text

/* Exact fallback; see src/overlays/ov025/overlay025_terminal_helpers.c. */
.extern SpritePresentation_Destroy
.extern Heap_Free


    .global func_ov025_02202c20
func_ov025_02202c20:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl SpritePresentation_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov025_02202c20, .-func_ov025_02202c20

