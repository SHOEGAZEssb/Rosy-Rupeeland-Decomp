    .text
/* Exact fallback; see src/overlays/ov010/overlay010_polygon_attr_write.c. */
    .global func_ov010_021fe88c
func_ov010_021fe88c: ; 0x021fe88c
    orr r0, r0, r1, lsl #0x4
    ldr r1, [sp, #0x4]
    orr r0, r0, r2, lsl #0x6
    orr r0, r1, r0
    ldr r2, [sp, #0x0]
    orr r1, r0, r3, lsl #0x18
    ldr r0, L_021fe8b4
    orr r1, r1, r2, lsl #0x10
    str r1, [r0, #0x0]
    bx lr
L_021fe8b4: .word 0x40004a4

    .size func_ov010_021fe88c, . - func_ov010_021fe88c
