.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.

.global func_ov075_02214608
func_ov075_02214608:
    mov r0, #0x20000
    bx lr
.size func_ov075_02214608, . - func_ov075_02214608
