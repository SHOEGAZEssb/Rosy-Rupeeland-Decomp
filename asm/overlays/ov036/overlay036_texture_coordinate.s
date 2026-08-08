.text

/* Exact fallback; see src/overlays/ov036/overlay036_motion_primitive_render.c for documented portable C. */



    .global func_ov036_021fd660
func_ov036_021fd660:
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r3, r1, lsl #0x10
    mov r1, r2, lsl #0x10
    ldr r2, L_021fd68c
    orr r0, r3, r0, lsr #0x10
    str r0, [r2, #0x0]
    mov r0, r1, lsr #0x10
    str r0, [r2, #0x0]
    bx lr
L_021fd68c: .word 0x400048c
    .size func_ov036_021fd660, .-func_ov036_021fd660

