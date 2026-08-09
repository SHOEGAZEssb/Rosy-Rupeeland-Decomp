.text
; Matching fallback for the portable implementation in src/overlays/ov086/overlay086_recovery.c.
.extern func_020441ac

.global func_ov086_02212b00
func_ov086_02212b00:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_020441ac
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov086_02212b00, . - func_ov086_02212b00
