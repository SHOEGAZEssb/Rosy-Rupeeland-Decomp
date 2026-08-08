.text

/* Exact fallback; see src/overlays/ov031/overlay031_effect_runtime.c for documented portable C. */



    .global func_ov031_021fd91c
func_ov031_021fd91c:
    str r1, [r0, #0xa4]
    str r2, [r0, #0xa8]
    ldr r1, [sp, #0x0]
    str r3, [r0, #0xac]
    str r1, [r0, #0xb0]
    bx lr
.size func_ov031_021fd91c, .-func_ov031_021fd91c
