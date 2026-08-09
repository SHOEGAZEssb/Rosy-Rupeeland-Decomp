.text
; Matching fallback for the portable implementation in src/overlays/ov083/overlay083_recovery.c.

.global func_ov083_02213c7c
func_ov083_02213c7c:
    ldr r0, [r0, #0xd0]
    and r0, r0, #0x80
    bx lr
.size func_ov083_02213c7c, . - func_ov083_02213c7c
