    .text

/* Exact fallback; see src/overlays/ov014/overlay014_value_helpers.c. */
    .global func_ov014_021fce00

func_ov014_021fce00:
    mov r1, #0x0
    str r1, [r0, #0x8]
    str r1, [r0, #0x4]
    str r1, [r0, #0x0]
    bx lr
    .size func_ov014_021fce00, . - func_ov014_021fce00
