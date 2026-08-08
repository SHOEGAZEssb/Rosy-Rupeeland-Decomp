.text

/* Exact fallback; see src/overlays/ov037/overlay037_actor_controller.c for documented portable C. */

    .global func_ov037_021fd6c0
func_ov037_021fd6c0:
    str r1, [r0, #0x20]
    str r2, [r0, #0x24]
    str r3, [r0, #0x28]
    bx lr
    .size func_ov037_021fd6c0, .-func_ov037_021fd6c0
