.text

/* Exact fallback for func_ov042_02203658; see the documented portable C in
 * src/overlays/ov042/overlay042_base_lifecycle.c. */
.extern data_ov042_0220b500

    .global func_ov042_02203658
func_ov042_02203658:
    ldr r2, .L_02203674
    str r2, [r0, #0x0]
    ldr r2, [r1, #0x4]
    str r2, [r0, #0x4]
    ldr r1, [r1, #0x8]
    str r1, [r0, #0x8]
    bx lr
.L_02203674: .word data_ov042_0220b500
    .size func_ov042_02203658, . - func_ov042_02203658
