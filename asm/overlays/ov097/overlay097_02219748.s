.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern func_0203fc48

.global func_ov097_02219748
func_ov097_02219748:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0203fc48
    mov r0, #0x0
    str r0, [r4, #0x2bc]
    ldmia sp!, {r4, pc}
.size func_ov097_02219748, . - func_ov097_02219748
