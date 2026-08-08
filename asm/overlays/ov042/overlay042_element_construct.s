.text

/* Exact fallback for func_ov042_021fcf80; see the documented portable C in
 * src/overlays/ov042/overlay042_base_lifecycle.c. */
.extern data_ov042_0220b500

    .global func_ov042_021fcf80
func_ov042_021fcf80: ; 0x021fcf80
    ldr r2, .L_021fcf98
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    bx lr
.L_021fcf98: .word data_ov042_0220b500
    .size func_ov042_021fcf80, . - func_ov042_021fcf80

