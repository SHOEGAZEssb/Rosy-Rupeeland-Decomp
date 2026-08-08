.text

/* Exact fallback; see src/overlays/ov032/overlay032_child_controller_base.c for documented portable C. */
.extern func_02073ffc

    .global func_ov032_02201450
func_ov032_02201450:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    mov r0, r4
    mov r1, r2
    str r2, [r5, #0x4]
    mov r2, #0x2
    bl func_02073ffc
    str r0, [r5, #0x0]
    str r4, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov032_02201450, .-func_ov032_02201450

