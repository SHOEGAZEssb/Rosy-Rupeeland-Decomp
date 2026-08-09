.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.

.global func_ov081_0221312c
func_ov081_0221312c:
    cmp r0, #0x0
    addne r0, r0, #0x4
    stmia r0, {r1, r2, r3}
    bx lr
.size func_ov081_0221312c, . - func_ov081_0221312c
