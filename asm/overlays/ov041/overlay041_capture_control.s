.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_display_setup.c. */
    .global func_ov041_021fe2e0
func_ov041_021fe2e0: ; 0x021fe2e0
    mov r1, r1, lsl #0x1d
    orr r1, r1, #0x80000000
    orr r1, r1, r3, lsl #0x19
    orr r1, r1, r2, lsl #0x18
    ldr r2, [sp, #0x0]
    orr r0, r1, r0, lsl #0x14
    ldr r1, [sp, #0x8]
    orr r0, r0, r2, lsl #0x10
    ldr r2, [sp, #0x4]
    orr r1, r0, r1, lsl #0x8
    ldr r0, .L_021fe318
    orr r1, r2, r1
    str r1, [r0, #0x0]
    bx lr
.L_021fe318: .word 0x4000064
    .size func_ov041_021fe2e0, . - func_ov041_021fe2e0

