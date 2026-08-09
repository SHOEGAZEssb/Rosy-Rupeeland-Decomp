.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.

.global func_ov056_0220ee20
func_ov056_0220ee20:
    cmp r1, #0x0
    ldr r2, .L_0220ee74
    beq .L_0220ee50
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x8
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    bx lr
.L_0220ee50:
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x8
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    bx lr
.L_0220ee74: .word 0x4001000
.size func_ov056_0220ee20, . - func_ov056_0220ee20
