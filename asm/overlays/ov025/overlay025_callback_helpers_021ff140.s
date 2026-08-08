.text

/* Exact fallback; see src/overlays/ov025/overlay025_callback_helpers.c. */



    .global func_ov025_021ff140
func_ov025_021ff140:
    ldr r1, [r0, #0xe0]
    mov r2, #0x1
    str r2, [r1, #0x20]
    ldr r0, [r0, #0xe4]
    str r2, [r0, #0x20]
    bx lr
.size func_ov025_021ff140, .-func_ov025_021ff140

