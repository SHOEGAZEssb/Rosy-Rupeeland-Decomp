.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.

.global func_ov095_0221b060
func_ov095_0221b060:
    ldr r0, [r1, #0x4]
    cmp r0, #0x150000
    movlt r0, #0x150000
    strlt r0, [r1, #0x4]
    blt .L_0221b080
    cmp r0, #0x2b0000
    movgt r0, #0x2b0000
    strgt r0, [r1, #0x4]
.L_0221b080:
    ldr r0, [r1, #0x8]
    cmp r0, #0x1c0000
    movlt r0, #0x1c0000
    strlt r0, [r1, #0x8]
    bxlt lr
    cmp r0, #0x260000
    movgt r0, #0x260000
    strgt r0, [r1, #0x8]
    bx lr
.size func_ov095_0221b060, . - func_ov095_0221b060
