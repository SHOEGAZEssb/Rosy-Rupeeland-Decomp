    .text

/* Exact fallback; see src/overlays/ov015/overlay015_value_copy.c. */
    .global func_ov015_021fd230

func_ov015_021fd230:
    ldr r2, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r2, [r1, #0x4]
    str r2, [r0, #0x4]
    ldr r1, [r1, #0x8]
    str r1, [r0, #0x8]
    bx lr

    .size func_ov015_021fd230, . - func_ov015_021fd230
