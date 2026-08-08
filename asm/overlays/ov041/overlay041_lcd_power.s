.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_display_setup.c. */
    .global func_ov041_021fe2c4
func_ov041_021fe2c4: ; 0x021fe2c4
    ldr r2, .L_021fe2dc
    ldrh r1, [r2, #0x0]
    bic r1, r1, #0x8000
    orr r0, r1, r0, lsl #0xf
    strh r0, [r2, #0x0]
    bx lr
.L_021fe2dc: .word 0x4000304
    .size func_ov041_021fe2c4, . - func_ov041_021fe2c4

