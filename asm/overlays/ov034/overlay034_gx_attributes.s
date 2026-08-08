.text

/* Exact fallback; see src/overlays/ov034/overlay034_owner_render.c for documented portable C. */

    .global func_ov034_021fd90c
func_ov034_021fd90c:
    orr r0, r0, r1, lsl #0x4
    ldr r1, [sp, #0x4]
    orr r0, r0, r2, lsl #0x6
    orr r0, r1, r0
    ldr r2, [sp, #0x0]
    orr r1, r0, r3, lsl #0x18
    ldr r0, L_021fd934
    orr r1, r1, r2, lsl #0x10
    str r1, [r0, #0x0]
    bx lr
L_021fd934: .word 0x40004a4
.size func_ov034_021fd90c, .-func_ov034_021fd90c

    .global func_ov034_021fd938
func_ov034_021fd938:
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
    ldr r0, L_021fd974
    orr r1, r1, r3, lsl #0x1d
    str r1, [r0, #0x0]
    bx lr
L_021fd974: .word 0x40004a8
.size func_ov034_021fd938, .-func_ov034_021fd938
