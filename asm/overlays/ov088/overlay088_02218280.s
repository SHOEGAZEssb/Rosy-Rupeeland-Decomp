.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.

.global func_ov088_02218280
func_ov088_02218280:
    cmp r0, #0x0
    addne r0, r0, #0x4
    stmia r0, {r1, r2, r3}
    bx lr
.size func_ov088_02218280, . - func_ov088_02218280
