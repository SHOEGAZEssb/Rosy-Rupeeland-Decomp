.text

/* Exact fallback; see src/overlays/ov037/overlay037_render_object_draw.c for documented portable C. */

    .global func_ov037_021fd0a8
func_ov037_021fd0a8:
    orr r0, r0, r1, lsl #0x4
    ldr r1, [sp, #0x4]
    orr r0, r0, r2, lsl #0x6
    orr r0, r1, r0
    ldr r2, [sp, #0x0]
    orr r1, r0, r3, lsl #0x18
    ldr r0, L_021fd0d0
    orr r1, r1, r2, lsl #0x10
    str r1, [r0, #0x0]
    bx lr
L_021fd0d0: .word 0x40004a4
    .size func_ov037_021fd0a8, .-func_ov037_021fd0a8
