.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_graphics_lifecycle.c. */
    .global func_ov041_021fdd38
func_ov041_021fdd38: ; 0x021fdd38
    stmdb sp!, {r3, lr}
    ldr lr, .L_021fdd60
    ldrh ip, [lr, #0x0]
    and ip, ip, #0x43
    orr r0, ip, r0, lsl #0xe
    orr r0, r0, r1, lsl #0x7
    orr r0, r0, r2, lsl #0x8
    orr r0, r0, r3, lsl #0x2
    strh r0, [lr, #0x0]
    ldmia sp!, {r3, pc}
.L_021fdd60: .word 0x400000e
    .size func_ov041_021fdd38, . - func_ov041_021fdd38

