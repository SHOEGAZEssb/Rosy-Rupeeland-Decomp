.text
; Matching fallback for the portable implementation in src/overlays/ov090/overlay090_recovery.c.

.global func_ov090_0221b96c
func_ov090_0221b96c:
    mov r0, #0x200
    bx lr
.size func_ov090_0221b96c, . - func_ov090_0221b96c
