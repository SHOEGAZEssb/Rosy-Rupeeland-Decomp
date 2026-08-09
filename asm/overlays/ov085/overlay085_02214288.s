.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.

.global func_ov085_02214288
func_ov085_02214288:
    mov r0, #0x40000
    bx lr
.size func_ov085_02214288, . - func_ov085_02214288
