.text
; Matching fallback for the portable implementation in src/overlays/ov083/overlay083_recovery.c.

.global func_ov083_02213cbc
func_ov083_02213cbc:
    mov r0, #0xc0000
    bx lr
.size func_ov083_02213cbc, . - func_ov083_02213cbc
