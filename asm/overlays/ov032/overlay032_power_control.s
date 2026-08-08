.text

/* Exact fallback; see src/overlays/ov032/overlay032_runtime_setup.c for documented portable C. */

    .global func_ov032_021fde1c
func_ov032_021fde1c:
    ldr r2, L_021fde34
    ldrh r1, [r2, #0x0]
    bic r1, r1, #0x8000
    orr r0, r1, r0, lsl #0xf
    strh r0, [r2, #0x0]
    bx lr
L_021fde34: .word 0x4000304
.size func_ov032_021fde1c, .-func_ov032_021fde1c

