.text

/* Exact fallback; see src/overlays/ov025/overlay025_callback_helpers.c. */
.extern func_ov025_021fdec8


    .global func_ov025_021ff1c8
func_ov025_021ff1c8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov025_021fdec8
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov025_021ff1c8, .-func_ov025_021ff1c8

