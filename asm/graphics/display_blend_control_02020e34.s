; Matching retail form; see src/graphics/display_blend_control.c.
.text

.global func_02020e34
    .type func_02020e34, @function
func_02020e34: ; 0x02020e34
    stmdb sp!, {r3, lr}
    ldr lr, .L_02020e5c
    ldrh ip, [lr, #0x0]
    and ip, ip, #0x43
    orr r0, ip, r0, lsl #0xe
    orr r0, r0, r1, lsl #0x7
    orr r0, r0, r2, lsl #0x8
    orr r0, r0, r3, lsl #0x2
    strh r0, [lr, #0x0]
    ldmia sp!, {r3, pc}
.L_02020e5c: .word 0x400100c
    .size func_02020e34, .-func_02020e34

