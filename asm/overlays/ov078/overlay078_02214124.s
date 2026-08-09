.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.

.global func_ov078_02214124
func_ov078_02214124:
    strb r1, [r0, #0x0]
    strb r2, [r0, #0x1]
    ldr r1, [sp, #0x0]
    strb r3, [r0, #0x2]
    strb r1, [r0, #0x3]
    bx lr
.size func_ov078_02214124, . - func_ov078_02214124
