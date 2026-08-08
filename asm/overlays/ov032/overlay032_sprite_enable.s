.text

/* Exact fallback; see src/overlays/ov032/overlay032_input_runtime.c for documented portable C. */

    .global func_ov032_021fe0e8
func_ov032_021fe0e8:
    ldr r2, [r0, #0x0]
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x1
    strh r1, [r2, #0x24]
    ldr r1, [r0, #0x0]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    bx lr
.size func_ov032_021fe0e8, .-func_ov032_021fe0e8

