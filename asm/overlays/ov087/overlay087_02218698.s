.text
; Matching fallback for the portable implementation in src/overlays/ov087/overlay087_recovery.c.

.global func_ov087_02218698
func_ov087_02218698:
    cmp r0, #0x0
    addne r0, r0, #0x4
    stmia r0, {r1, r2, r3}
    bx lr
.size func_ov087_02218698, . - func_ov087_02218698
