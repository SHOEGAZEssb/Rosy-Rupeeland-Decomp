.text

/* Exact fallback for func_ov042_021fda0c; see the documented portable C in
 * src/overlays/ov042/overlay042_record_helpers.c. */

    .global func_ov042_021fda0c
func_ov042_021fda0c:
    cmp r1, r0
    ldrne r2, [r1, #0x4]
    strne r2, [r0, #0x4]
    ldrne r1, [r1, #0x8]
    strne r1, [r0, #0x8]
    bx lr
    .size func_ov042_021fda0c, . - func_ov042_021fda0c
