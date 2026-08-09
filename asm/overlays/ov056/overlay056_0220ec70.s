.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.

.global func_ov056_0220ec70
func_ov056_0220ec70:
    mov r3, r1, lsr #0x1f
    rsb r1, r3, r1, lsl #0x1e
    adds r1, r3, r1, ror #0x1e
    mov r3, r2, lsr #0x1f
    rsb r2, r3, r2, lsl #0x1e
    addmi r1, r1, #0x4
    adds r2, r3, r2, ror #0x1e
    addmi r2, r2, #0x4
    ldr r3, [r0, #0x814]
    add r0, r1, r2, lsl #0x2
    ldr r0, [r3, r0, lsl #0x2]
    bx lr
.size func_ov056_0220ec70, . - func_ov056_0220ec70
