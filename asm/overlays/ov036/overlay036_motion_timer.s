.text

/* Exact fallback; see src/overlays/ov036/overlay036_motion_primitive.c for documented portable C. */



    .global func_ov036_021fd4b0
func_ov036_021fd4b0:
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    str r1, [r0, #0x7c]
    mov r1, #0x0
    str r1, [r0, #0x80]
    bx lr
    .size func_ov036_021fd4b0, .-func_ov036_021fd4b0

