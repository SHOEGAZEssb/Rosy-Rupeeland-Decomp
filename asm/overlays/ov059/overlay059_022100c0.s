.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.

.global func_ov059_022100c0
func_ov059_022100c0:
    ldr r2, .L_022100d8
    ldrh r1, [r2, #0x0]
    bic r1, r1, #0x3
    orr r0, r1, r0
    strh r0, [r2, #0x0]
    bx lr
.L_022100d8: .word 0x400100a
.size func_ov059_022100c0, . - func_ov059_022100c0
