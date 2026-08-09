.text
; Matching fallback for the portable implementation in src/overlays/ov090/overlay090_recovery.c.

.global func_ov090_0221c170
func_ov090_0221c170:
    ldr r2, [r0, #0x4]
    strb r1, [r2, #0x3a]
    ldr r0, [r0, #0x8]
    strb r1, [r0, #0x3a]
    bx lr
.size func_ov090_0221c170, . - func_ov090_0221c170
