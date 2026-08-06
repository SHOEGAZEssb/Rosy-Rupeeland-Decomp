; Matching retail form; see src/graphics/display_blend_control.c.
.text

.global func_02020dd4
    .type func_02020dd4, @function
func_02020dd4: ; 0x02020dd4
    stmdb sp!, {r3, lr}
    ldr lr, .L_02020dfc
    ldrh ip, [lr, #0x0]
    and ip, ip, #0x43
    orr r0, ip, r0, lsl #0xe
    orr r0, r0, r1, lsl #0x7
    orr r0, r0, r2, lsl #0x8
    orr r0, r0, r3, lsl #0x2
    strh r0, [lr, #0x0]
    ldmia sp!, {r3, pc}
.L_02020dfc: .word 0x400000c
    .size func_02020dd4, .-func_02020dd4

