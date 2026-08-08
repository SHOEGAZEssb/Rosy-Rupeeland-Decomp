.text

/* Exact fallback; see src/overlays/ov025/overlay025_callback_helpers.c. */



    .global func_ov025_021ff23c
func_ov025_021ff23c:
    str r1, [r0, #0xa4]
    str r2, [r0, #0xa8]
    ldr r1, [sp, #0x0]
    str r3, [r0, #0xac]
    str r1, [r0, #0xb0]
    bx lr
.size func_ov025_021ff23c, .-func_ov025_021ff23c

