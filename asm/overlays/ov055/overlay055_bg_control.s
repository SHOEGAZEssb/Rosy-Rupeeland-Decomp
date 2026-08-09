.text
; Matching fallback for the portable implementation in src/overlays/ov055/overlay055_recovery.c.

.global func_ov055_0220eee4
func_ov055_0220eee4:
    ldr r0, [r0, #0x20]
    ldr r1, [r0, #0xc]
    ldr r0, [r0, #0x10]
    mul r0, r1, r0
    mov r0, r0, lsl #0x1
    bx lr
.size func_ov055_0220eee4, . - func_ov055_0220eee4
