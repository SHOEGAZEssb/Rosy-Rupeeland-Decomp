.text

/* Exact fallback; see src/overlays/ov036/overlay036_particle_list_render.c for documented portable C. */

    .global func_ov036_021fea04
func_ov036_021fea04:
    str r1, [r0, #0x10]
    str r2, [r0, #0x14]
    str r3, [r0, #0x18]
    bx lr
    .size func_ov036_021fea04, .-func_ov036_021fea04
