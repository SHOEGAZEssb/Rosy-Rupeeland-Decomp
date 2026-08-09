.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.

.global func_ov077_02214cd4
func_ov077_02214cd4:
    cmp r0, #0x0
    addne r0, r0, #0x4
    stmia r0, {r1, r2, r3}
    bx lr
.size func_ov077_02214cd4, . - func_ov077_02214cd4
