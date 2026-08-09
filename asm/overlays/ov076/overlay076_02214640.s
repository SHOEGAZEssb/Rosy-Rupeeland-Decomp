.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.

.global func_ov076_02214640
func_ov076_02214640:
    mov r0, #0x0
    bx lr
.size func_ov076_02214640, . - func_ov076_02214640
