.text

/* Exact fallback for func_ov042_021fe9e4; see the documented portable C in
 * src/overlays/ov042/overlay042_record_helpers.c. */

    .global func_ov042_021fe9e4
func_ov042_021fe9e4:
    add r3, r0, r1, lsl #0x2
    ldr r2, [r3, #0xb3c]
    cmp r2, #0x0
    mvnge r2, #0x0
    strge r2, [r3, #0xb3c]
    ldrge r2, [r0, #0xf24]
    strge r2, [r3, #0xd94]
    strge r1, [r0, #0xf24]
    bx lr
    .size func_ov042_021fe9e4, . - func_ov042_021fe9e4
