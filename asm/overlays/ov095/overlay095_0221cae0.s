.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.

.global func_ov095_0221cae0
func_ov095_0221cae0:
    ldr r1, [r0, #0x1f4]
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    str r1, [r0, #0x1f4]
    bx lr
.size func_ov095_0221cae0, . - func_ov095_0221cae0
