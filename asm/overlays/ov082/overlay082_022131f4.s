.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.
.extern Actor_GetGravityAcceleration
.extern func_020befec

.global func_ov082_022131f4
func_ov082_022131f4:
    stmdb sp!, {r3, lr}
    bl Actor_GetGravityAcceleration
    mov r1, #0x3
    bl func_020befec
    ldmia sp!, {r3, pc}
.size func_ov082_022131f4, . - func_ov082_022131f4
