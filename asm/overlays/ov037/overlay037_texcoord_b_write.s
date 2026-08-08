.text

/* Exact fallback; see src/overlays/ov037/overlay037_render_object_draw.c for documented portable C. */

    .global func_ov037_021fd0f8
func_ov037_021fd0f8:
    cmp r2, #0x0
    movne r2, #0x1
    orr r1, r0, r1, lsl #0x10
    moveq r2, #0x0
    ldr r0, L_021fd118
    orr r1, r1, r2, lsl #0xf
    str r1, [r0, #0x0]
    bx lr
L_021fd118: .word 0x40004c4
    .size func_ov037_021fd0f8, .-func_ov037_021fd0f8
