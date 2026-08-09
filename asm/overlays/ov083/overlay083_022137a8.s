.text
; Matching fallback for the portable implementation in src/overlays/ov083/overlay083_recovery.c.
.extern func_02043e68

.global func_ov083_022137a8
func_ov083_022137a8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02043e68
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov083_022137a8, . - func_ov083_022137a8
