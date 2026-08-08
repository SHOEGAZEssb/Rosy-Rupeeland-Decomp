.text

/* Exact fallback; see src/overlays/ov037/overlay037_geometry_setup.c for documented portable C. */

    .global func_ov037_021fd520
func_ov037_021fd520:
    mov r1, r1, lsl #0x8
    mov r1, r1, asr #0x10
    mov r0, r0, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r2, r1, lsl #0x10
    ldr r1, L_021fd550
    orr r0, r2, r0, lsr #0x10
    str r0, [r1, #0x0]
    bx lr
L_021fd550: .word 0x4000488
    .size func_ov037_021fd520, .-func_ov037_021fd520
