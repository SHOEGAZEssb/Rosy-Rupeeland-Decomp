.text

/* Exact fallback for func_ov042_021fce00; see the documented portable C in
 * src/overlays/ov042/overlay042_base_lifecycle.c. */
    .global func_ov042_021fce00
func_ov042_021fce00: ; 0x021fce00
    ldr r2, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r2, [r1, #0x4]
    str r2, [r0, #0x4]
    ldr r1, [r1, #0x8]
    str r1, [r0, #0x8]
    bx lr
    .size func_ov042_021fce00, . - func_ov042_021fce00

