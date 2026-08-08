.text

/* Exact fallback for func_ov042_0220507c; see the documented portable C in
 * src/overlays/ov042/overlay042_late_helpers.c. */

    .global func_ov042_0220507c
func_ov042_0220507c:
    mov r1, r1, lsl #0x8
    mov r1, r1, asr #0x10
    mov r0, r0, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r2, r1, lsl #0x10
    ldr r1, .L_022050ac
    orr r0, r2, r0, lsr #0x10
    str r0, [r1, #0x0]
    bx lr
.L_022050ac: .word 0x4000488
    .size func_ov042_0220507c, . - func_ov042_0220507c
