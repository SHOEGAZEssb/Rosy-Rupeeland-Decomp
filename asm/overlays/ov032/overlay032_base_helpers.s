.text

/* Exact fallback; see src/overlays/ov032/overlay032_base_helpers.c for documented portable C. */

    .global func_ov032_021fce00
func_ov032_021fce00:
    bx lr
.size func_ov032_021fce00, .-func_ov032_021fce00
    .global func_ov032_021fce04
func_ov032_021fce04:
    bx lr
.size func_ov032_021fce04, .-func_ov032_021fce04
    .global func_ov032_021fce08
func_ov032_021fce08:
    str r1, [r0, #0xa4]
    str r2, [r0, #0xa8]
    ldr r1, [sp, #0x0]
    str r3, [r0, #0xac]
    str r1, [r0, #0xb0]
    bx lr
.size func_ov032_021fce08, .-func_ov032_021fce08
