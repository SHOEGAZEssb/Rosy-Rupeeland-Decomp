.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.

.global func_ov075_02214ff8
func_ov075_02214ff8:
    mov r0, #0x40000
    bx lr
.size func_ov075_02214ff8, . - func_ov075_02214ff8
