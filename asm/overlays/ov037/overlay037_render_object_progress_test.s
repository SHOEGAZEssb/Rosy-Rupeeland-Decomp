.text

/* Exact fallback; see src/overlays/ov037/overlay037_render_object_state.c for documented portable C. */

    .global func_ov037_021fd1b4
func_ov037_021fd1b4:
    ldr r1, [r0, #0x80]
    ldr r0, [r0, #0x7c]
    cmp r1, r0
    movge r0, #0x1
    movlt r0, #0x0
    bx lr
    .size func_ov037_021fd1b4, .-func_ov037_021fd1b4
