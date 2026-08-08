.text

/* Exact fallback; see src/overlays/ov036/overlay036_random_effect_update.c for documented portable C. */

    .global func_ov036_021fe968
func_ov036_021fe968:
    str r1, [r0, #0xa4]
    str r2, [r0, #0xa8]
    str r3, [r0, #0xac]
    bx lr
    .size func_ov036_021fe968, .-func_ov036_021fe968
