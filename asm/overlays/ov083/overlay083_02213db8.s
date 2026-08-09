.text
; Matching fallback for the portable implementation in src/overlays/ov083/overlay083_recovery.c.

.global func_ov083_02213db8
func_ov083_02213db8:
    mov r0, #0x800
    bx lr
.size func_ov083_02213db8, . - func_ov083_02213db8
