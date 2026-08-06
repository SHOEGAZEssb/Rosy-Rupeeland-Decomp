; Matching retail form; see src/graphics/display_blend_control.c.
.text

.global func_02020e00
    .type func_02020e00, @function
func_02020e00: ; 0x02020e00
    stmdb sp!, {r4, lr}
    ldr lr, .L_02020e30
    ldr r4, [sp, #0x8]
    ldrh ip, [lr, #0x0]
    and ip, ip, #0x43
    orr r0, ip, r0, lsl #0xe
    orr r0, r0, r1, lsl #0x7
    orr r0, r0, r2, lsl #0x8
    orr r0, r0, r3, lsl #0x2
    orr r0, r0, r4, lsl #0xd
    strh r0, [lr, #0x0]
    ldmia sp!, {r4, pc}
.L_02020e30: .word 0x400100a
    .size func_02020e00, .-func_02020e00

