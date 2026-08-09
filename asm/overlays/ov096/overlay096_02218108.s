.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.

.global func_ov096_02218108
func_ov096_02218108:
    ldr r0, [r0, #0x260]
    tst r0, #0x2000
    movne r0, #0x15
    moveq r0, #0x10
    bx lr
.size func_ov096_02218108, . - func_ov096_02218108
