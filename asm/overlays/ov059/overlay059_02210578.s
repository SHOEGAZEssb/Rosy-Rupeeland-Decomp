.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern func_02004b54

.global func_ov059_02210578
func_ov059_02210578:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02004b54
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov059_02210578, . - func_ov059_02210578
