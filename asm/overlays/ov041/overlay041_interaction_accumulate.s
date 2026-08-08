.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_touch_helpers.c. */
    .global func_ov041_021fec84
func_ov041_021fec84: ; 0x021fec84
    ldr r3, [r0, #0x1dc]
    cmp r2, #0x0
    add r1, r3, r1
    str r1, [r0, #0x1dc]
    ldreq r1, [r0, #0x1e8]
    addeq r1, r1, #0x1
    streq r1, [r0, #0x1e8]
    ldrne r1, [r0, #0x1e4]
    addne r1, r1, #0x1
    strne r1, [r0, #0x1e4]
    bx lr
    .size func_ov041_021fec84, . - func_ov041_021fec84

