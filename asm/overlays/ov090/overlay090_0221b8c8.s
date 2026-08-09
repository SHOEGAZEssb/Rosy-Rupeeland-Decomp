.text
; Matching fallback for the portable implementation in src/overlays/ov090/overlay090_recovery.c.

.global func_ov090_0221b8c8
func_ov090_0221b8c8:
    mov r0, #0x40000
    bx lr
.size func_ov090_0221b8c8, . - func_ov090_0221b8c8
