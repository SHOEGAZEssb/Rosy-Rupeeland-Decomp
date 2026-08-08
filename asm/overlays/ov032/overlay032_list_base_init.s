.text

/* Exact fallback; see src/overlays/ov032/overlay032_widget_helpers.c for documented portable C. */
.extern data_020f263c
.extern func_02071ea4
.extern func_02093cb4

    .global func_ov032_02201f58
func_ov032_02201f58:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02093cb4
    ldr r1, L_02201f7c
    add r0, r4, #0x54
    str r1, [r4, #0x0]
    bl func_02071ea4
    mov r0, r4
    ldmia sp!, {r4, pc}
L_02201f7c: .word data_020f263c
.size func_ov032_02201f58, .-func_ov032_02201f58

