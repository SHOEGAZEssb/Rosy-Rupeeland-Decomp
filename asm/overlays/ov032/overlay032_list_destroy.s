.text

/* Exact fallback; see src/overlays/ov032/overlay032_widget_helpers.c for documented portable C. */
.extern func_02094494

    .global func_ov032_022021f0
func_ov032_022021f0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02094494
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov032_022021f0, .-func_ov032_022021f0

