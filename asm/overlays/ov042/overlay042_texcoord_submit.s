.text

/* Exact fallback for func_ov042_021fd624; see the documented portable C in
 * src/overlays/ov042/overlay042_geometry_fifo.c. */

    .global func_ov042_021fd624
func_ov042_021fd624:
    mov r1, r1, lsl #0x8
    mov r1, r1, asr #0x10
    mov r0, r0, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r2, r1, lsl #0x10
    ldr r1, .L_021fd654
    orr r0, r2, r0, lsr #0x10
    str r0, [r1, #0x0]
    bx lr
.L_021fd654: .word 0x4000488
    .size func_ov042_021fd624, . - func_ov042_021fd624
