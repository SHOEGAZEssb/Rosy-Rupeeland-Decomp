.text
; Matching fallback for the portable implementation in src/overlays/ov083/overlay083_recovery.c.

.global func_ov083_02213afc
func_ov083_02213afc:
    cmp r0, #0x0
    addne r0, r0, #0x4
    stmia r0, {r1, r2, r3}
    bx lr
.size func_ov083_02213afc, . - func_ov083_02213afc
