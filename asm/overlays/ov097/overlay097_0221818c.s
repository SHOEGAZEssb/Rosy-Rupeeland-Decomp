.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.

.global func_ov097_0221818c
func_ov097_0221818c:
    cmp r0, #0x0
    addne r0, r0, #0x4
    stmia r0, {r1, r2, r3}
    bx lr
.size func_ov097_0221818c, . - func_ov097_0221818c
