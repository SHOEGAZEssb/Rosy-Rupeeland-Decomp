.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.

.global func_ov059_02211854
func_ov059_02211854:
    ldr r2, .L_0221186c
    ldrh r1, [r2, #0x0]
    bic r1, r1, #0x8000
    orr r0, r1, r0, lsl #0xf
    strh r0, [r2, #0x0]
    bx lr
.L_0221186c: .word 0x4000304
.size func_ov059_02211854, . - func_ov059_02211854
