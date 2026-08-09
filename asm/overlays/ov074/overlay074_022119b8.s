.text
; Matching fallback for the portable implementation in src/overlays/ov074/overlay074_recovery.c.

.global func_ov074_022119b8
func_ov074_022119b8:
    cmp r1, #0x0
    mov r2, #0x4000000
    beq .L_022119e8
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x1
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    bx lr
.L_022119e8:
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x1
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    bx lr
.size func_ov074_022119b8, . - func_ov074_022119b8
