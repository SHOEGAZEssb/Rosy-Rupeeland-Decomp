.text
; Matching fallback for the portable implementation in src/overlays/ov090/overlay090_recovery.c.

.global func_ov090_0221a3cc
func_ov090_0221a3cc:
    cmp r0, #0x0
    addne r0, r0, #0x4
    stmia r0, {r1, r2, r3}
    bx lr
.size func_ov090_0221a3cc, . - func_ov090_0221a3cc
