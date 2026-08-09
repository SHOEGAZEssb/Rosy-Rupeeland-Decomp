.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.

.global func_ov078_02213c30
func_ov078_02213c30:
    ldrsh r0, [r1, #0x12]
    smulbb r0, r0, r0
    bx lr
.size func_ov078_02213c30, . - func_ov078_02213c30
