.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern func_0204a4f0
.extern func_0204ff40

.global func_ov095_0221c6a4
func_ov095_0221c6a4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_0204a4f0
    mov r0, r5
    mov r1, r4
    bl func_0204ff40
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov095_0221c6a4, . - func_ov095_0221c6a4
