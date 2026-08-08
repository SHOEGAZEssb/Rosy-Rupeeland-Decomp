.text

/* Exact fallback for func_ov042_021ffd00; see the documented portable C in
 * src/overlays/ov042/overlay042_secondary_geometry.c. */

    .global func_ov042_021ffd00
func_ov042_021ffd00:
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r3, r1, lsl #0x10
    mov r1, r2, lsl #0x10
    ldr r2, .L_021ffd2c
    orr r0, r3, r0, lsr #0x10
    str r0, [r2, #0x0]
    mov r0, r1, lsr #0x10
    str r0, [r2, #0x0]
    bx lr
.L_021ffd2c: .word 0x400048c
    .size func_ov042_021ffd00, . - func_ov042_021ffd00
