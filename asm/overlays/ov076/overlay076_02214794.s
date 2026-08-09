.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.

.global func_ov076_02214794
func_ov076_02214794:
    mov r0, #0x20000
    bx lr
.size func_ov076_02214794, . - func_ov076_02214794
