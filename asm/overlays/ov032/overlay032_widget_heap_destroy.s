.text

/* Exact fallback; see src/overlays/ov032/overlay032_widget_controller.c for documented portable C. */
.extern Heap_Free
.extern InventoryScroll_DestroyAlternate

    .global func_ov032_02201914
func_ov032_02201914:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl InventoryScroll_DestroyAlternate
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov032_02201914, .-func_ov032_02201914

