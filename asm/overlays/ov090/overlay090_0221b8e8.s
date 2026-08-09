.text
; Matching fallback for the portable implementation in src/overlays/ov090/overlay090_recovery.c.

.global func_ov090_0221b8e8
func_ov090_0221b8e8:
    ldr r0, [r0, #0xd0]
    and r0, r0, #0x80
    bx lr
.size func_ov090_0221b8e8, . - func_ov090_0221b8e8
