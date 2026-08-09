.text
; Matching fallback for the portable implementation in src/overlays/ov071/overlay071_recovery.c.

.global func_ov071_02212090
func_ov071_02212090:
    ldr r2, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r1, [r1, #0x4]
    str r1, [r0, #0x4]
    bx lr
.size func_ov071_02212090, . - func_ov071_02212090
