.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.

.global func_ov097_02217934
func_ov097_02217934:
    strb r1, [r0, #0x0]
    strb r2, [r0, #0x1]
    ldr r1, [sp, #0x0]
    strb r3, [r0, #0x2]
    strb r1, [r0, #0x3]
    bx lr
.size func_ov097_02217934, . - func_ov097_02217934
