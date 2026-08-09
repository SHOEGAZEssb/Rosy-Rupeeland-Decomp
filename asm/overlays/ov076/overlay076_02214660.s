.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.

.global func_ov076_02214660
func_ov076_02214660:
    mov r0, #0xc0000
    bx lr
.size func_ov076_02214660, . - func_ov076_02214660
