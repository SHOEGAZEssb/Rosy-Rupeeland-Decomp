.text

/* Exact fallback; see src/overlays/ov027/overlay027_geometry_commands.c. */



    .global func_ov027_021fd0b0
func_ov027_021fd0b0:
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
    ldr r0, L_021fd0ec
    orr r1, r1, r3, lsl #0x1d
    str r1, [r0, #0x0]
    bx lr
L_021fd0ec: .word 0x40004a8
.size func_ov027_021fd0b0, .-func_ov027_021fd0b0

