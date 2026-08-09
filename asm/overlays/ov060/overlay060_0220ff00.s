.text
; Matching fallback for the portable implementation in src/overlays/ov060/overlay060_recovery.c.

.global func_ov060_0220ff00
func_ov060_0220ff00:
    ldr r2, .L_0220ff18
    ldrh r1, [r2, #0x0]
    bic r1, r1, #0x8000
    orr r0, r1, r0, lsl #0xf
    strh r0, [r2, #0x0]
    bx lr
.L_0220ff18: .word 0x4000304
.size func_ov060_0220ff00, . - func_ov060_0220ff00
