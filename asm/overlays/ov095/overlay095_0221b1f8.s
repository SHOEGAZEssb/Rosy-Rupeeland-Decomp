.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.

.global func_ov095_0221b1f8
func_ov095_0221b1f8:
    ldr r1, [r0, #0x260]
    orr r1, r1, #0x80
    str r1, [r0, #0x260]
    bx lr
.size func_ov095_0221b1f8, . - func_ov095_0221b1f8
