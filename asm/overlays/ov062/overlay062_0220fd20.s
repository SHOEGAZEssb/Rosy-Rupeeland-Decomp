.text
; Matching fallback for the portable implementation in src/overlays/ov062/overlay062_recovery.c.

.global func_ov062_0220fd20
func_ov062_0220fd20:
    cmp r0, #0x0
    addne r0, r0, #0x4
    stmia r0, {r1, r2, r3}
    bx lr
.size func_ov062_0220fd20, . - func_ov062_0220fd20
