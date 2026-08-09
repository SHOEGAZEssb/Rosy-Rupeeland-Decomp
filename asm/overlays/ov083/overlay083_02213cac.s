.text
; Matching fallback for the portable implementation in src/overlays/ov083/overlay083_recovery.c.

.global func_ov083_02213cac
func_ov083_02213cac:
    mov r0, #0x10
    bx lr
.size func_ov083_02213cac, . - func_ov083_02213cac
