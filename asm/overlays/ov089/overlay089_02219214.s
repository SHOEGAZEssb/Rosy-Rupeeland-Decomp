.text
; Matching fallback for the portable implementation in src/overlays/ov089/overlay089_recovery.c.

.global func_ov089_02219214
func_ov089_02219214:
    cmp r0, #0x0
    addne r0, r0, #0x4
    stmia r0, {r1, r2, r3}
    bx lr
.size func_ov089_02219214, . - func_ov089_02219214
