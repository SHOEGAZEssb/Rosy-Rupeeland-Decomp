.text

/* Exact fallback; see src/overlays/ov032/overlay032_widget_controller.c for documented portable C. */
.extern Heap_Free
.extern func_02094494

    .global func_ov032_02201914
func_ov032_02201914:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02094494
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov032_02201914, .-func_ov032_02201914

