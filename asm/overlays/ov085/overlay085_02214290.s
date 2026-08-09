.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.

.global func_ov085_02214290
func_ov085_02214290:
    mov r0, #0x0
    bx lr
.size func_ov085_02214290, . - func_ov085_02214290
