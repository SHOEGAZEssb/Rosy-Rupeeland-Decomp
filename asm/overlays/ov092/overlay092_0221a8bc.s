.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.
.extern func_02050a78

.global func_ov092_0221a8bc
func_ov092_0221a8bc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02050a78
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov092_0221a8bc, . - func_ov092_0221a8bc
