.text

/* Exact fallback; see src/overlays/ov025/overlay025_callback_helpers.c. */
.extern data_ov025_02203318


    .global func_ov025_021ff1dc
func_ov025_021ff1dc:
    ldr r2, L_021ff1f8
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x8]
    str r1, [r0, #0x4]
    str r1, [r0, #0xc]
    bx lr
L_021ff1f8: .word data_ov025_02203318
.size func_ov025_021ff1dc, .-func_ov025_021ff1dc

