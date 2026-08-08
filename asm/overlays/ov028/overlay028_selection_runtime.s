.text

/* Exact fallback; see src/overlays/ov028/overlay028_selection_runtime.c. */



    .global func_ov028_021fe540
func_ov028_021fe540:
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    str r1, [r0, #0x7c]
    mov r1, #0x0
    str r1, [r0, #0x80]
    bx lr
.size func_ov028_021fe540, .-func_ov028_021fe540
