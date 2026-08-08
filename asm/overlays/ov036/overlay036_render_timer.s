.text

/* Exact fallback; see src/overlays/ov036/overlay036_render_updates.c for documented portable C. */



    .global func_ov036_021fd28c
func_ov036_021fd28c:
    ldr r1, [r0, #0x80]
    ldr r0, [r0, #0x7c]
    cmp r1, r0
    movge r0, #0x1
    movlt r0, #0x0
    bx lr
    .size func_ov036_021fd28c, .-func_ov036_021fd28c

