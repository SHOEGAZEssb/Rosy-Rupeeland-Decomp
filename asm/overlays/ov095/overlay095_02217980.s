.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.

.global func_ov095_02217980
func_ov095_02217980:
    strb r1, [r0, #0x0]
    strb r2, [r0, #0x1]
    ldr r1, [sp, #0x0]
    strb r3, [r0, #0x2]
    strb r1, [r0, #0x3]
    bx lr
.size func_ov095_02217980, . - func_ov095_02217980
