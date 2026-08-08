.text

/* Exact fallback; see src/overlays/ov037/overlay037_geometry_setup.c for documented portable C. */

    .global func_ov037_021fd4e0
func_ov037_021fd4e0:
    ldr ip, [sp, #0xc]
    mov r0, r0, lsl #0x1a
    orr r0, r0, ip, lsr #0x3
    orr r0, r0, r1, lsl #0x1e
    orr r0, r0, r2, lsl #0x14
    ldr r1, [sp, #0x0]
    orr r0, r0, r3, lsl #0x17
    ldr r2, [sp, #0x4]
    orr r0, r0, r1, lsl #0x10
    ldr r3, [sp, #0x8]
    orr r1, r0, r2, lsl #0x12
    ldr r0, L_021fd51c
    orr r1, r1, r3, lsl #0x1d
    str r1, [r0, #0x0]
    bx lr
L_021fd51c: .word 0x40004a8
    .size func_ov037_021fd4e0, .-func_ov037_021fd4e0
