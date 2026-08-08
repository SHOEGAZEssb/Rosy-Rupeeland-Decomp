.text
/* Exact fallback; see overlay040_small_helpers.c for portable C. */
    .global func_ov040_0220255c
func_ov040_0220255c:
    stmdb sp!, {r4, lr}
    ldr lr, L_0220258c
    ldr r4, [sp, #0x8]
    ldrh r12, [lr, #0x0]
    and r12, r12, #0x43
    orr r0, r12, r0, lsl #0xe
    orr r0, r0, r1, lsl #0x7
    orr r0, r0, r2, lsl #0x8
    orr r0, r0, r3, lsl #0x2
    orr r0, r0, r4, lsl #0xd
    strh r0, [lr, #0x0]
    ldmia sp!, {r4, pc}
L_0220258c: .word 0x04001008
    .size func_ov040_0220255c, .-func_ov040_0220255c
