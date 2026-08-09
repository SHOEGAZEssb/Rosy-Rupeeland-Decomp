.text
; Matching fallback for the portable implementation in src/overlays/ov093/overlay093_recovery.c.

.global func_ov093_022177e0
func_ov093_022177e0:
    cmp r0, #0x0
    addne r0, r0, #0x4
    stmia r0, {r1, r2, r3}
    bx lr
.size func_ov093_022177e0, . - func_ov093_022177e0
