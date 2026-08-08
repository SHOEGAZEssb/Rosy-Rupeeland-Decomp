.text

/* Exact fallback; see src/overlays/ov036/overlay036_oscillating_object_lifecycle.c for documented portable C. */

    .global func_ov036_02201d60
func_ov036_02201d60:
    str r1, [r0, #0xb4]
    str r1, [r0, #0xb0]
    str r1, [r0, #0xac]
    bx lr
    .size func_ov036_02201d60, .-func_ov036_02201d60

