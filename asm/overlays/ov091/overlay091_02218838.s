.text
; Matching fallback for the portable implementation in src/overlays/ov091/overlay091_recovery.c.

.global func_ov091_02218838
func_ov091_02218838:
    cmp r0, #0x0
    addne r0, r0, #0x4
    stmia r0, {r1, r2, r3}
    bx lr
.size func_ov091_02218838, . - func_ov091_02218838
