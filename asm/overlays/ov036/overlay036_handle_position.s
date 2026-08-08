.text

/* Exact fallback; see src/overlays/ov036/overlay036_random_effect_update.c for documented portable C. */

    .global func_ov036_021fe978
func_ov036_021fe978:
    str r1, [r0, #0x20]
    str r2, [r0, #0x24]
    str r3, [r0, #0x28]
    bx lr
    .size func_ov036_021fe978, .-func_ov036_021fe978
