.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_touch_helpers.c. */
    .global func_ov041_021fec04
func_ov041_021fec04: ; 0x021fec04
    cmp r1, r0
    ldrne r2, [r1, #0x4]
    strne r2, [r0, #0x4]
    ldrne r1, [r1, #0x8]
    strne r1, [r0, #0x8]
    bx lr
    .size func_ov041_021fec04, . - func_ov041_021fec04

