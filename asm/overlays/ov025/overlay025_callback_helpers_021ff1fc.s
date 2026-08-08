.text

/* Exact fallback; see src/overlays/ov025/overlay025_callback_helpers.c. */
.extern data_ov025_02203318
.extern func_02095308


    .global func_ov025_021ff1fc
func_ov025_021ff1fc:
    stmdb sp!, {r4, lr}
    ldr r1, L_021ff218
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_02095308
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021ff218: .word data_ov025_02203318
.size func_ov025_021ff1fc, .-func_ov025_021ff1fc

