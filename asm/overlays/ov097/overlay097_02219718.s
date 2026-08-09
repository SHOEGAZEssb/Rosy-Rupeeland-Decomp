.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern func_ov078_02212ba0

.global func_ov097_02219718
func_ov097_02219718:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov078_02212ba0
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov097_02219718, . - func_ov097_02219718
