.text
; Matching fallback for the portable implementation in src/overlays/ov055/overlay055_recovery.c.

.global func_ov055_0220e8a0
func_ov055_0220e8a0:
    ldr r1, [r0, #0x24]
    mov r2, #0x1
    str r2, [r1, #0x20]
    ldr r0, [r0, #0x28]
    str r2, [r0, #0x20]
    bx lr
.size func_ov055_0220e8a0, . - func_ov055_0220e8a0
