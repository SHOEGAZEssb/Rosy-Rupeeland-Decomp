.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.

.global func_ov075_02214504
func_ov075_02214504:
    mov r0, #0xc0000
    bx lr
.size func_ov075_02214504, . - func_ov075_02214504
