.text

/* Exact fallback for func_ov042_02203678; see the documented portable C in
 * src/overlays/ov042/overlay042_base_lifecycle.c. */
.extern data_ov042_0220b500

    .global func_ov042_02203678
func_ov042_02203678:
    ldr r3, .L_02203688
    str r3, [r0, #0x0]
    stmib r0, {r1, r2}
    bx lr
.L_02203688: .word data_ov042_0220b500
    .size func_ov042_02203678, . - func_ov042_02203678
