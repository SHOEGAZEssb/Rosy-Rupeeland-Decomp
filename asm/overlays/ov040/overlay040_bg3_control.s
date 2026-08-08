.text
/* Exact fallback; see overlay040_opening_helpers.c for portable C. */
    .global func_ov040_021fce74
func_ov040_021fce74:
    stmdb sp!, {r3, lr}
    ldr lr, L_021fce9c
    ldrh r12, [lr, #0x0]
    and r12, r12, #0x43
    orr r0, r12, r0, lsl #0xe
    orr r0, r0, r1, lsl #0x7
    orr r0, r0, r2, lsl #0x8
    orr r0, r0, r3, lsl #0x2
    strh r0, [lr, #0x0]
    ldmia sp!, {r3, pc}
L_021fce9c: .word 0x0400000e
    .size func_ov040_021fce74, .-func_ov040_021fce74
