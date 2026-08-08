.text

/* Exact fallback for func_ov042_021ffd30; see the documented portable C in
 * src/overlays/ov042/overlay042_secondary_geometry.c. */

    .global func_ov042_021ffd30
func_ov042_021ffd30:
    ldr r2, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r1, [r1, #0x4]
    str r1, [r0, #0x4]
    bx lr
    .size func_ov042_021ffd30, . - func_ov042_021ffd30
