.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.

.global func_ov078_02215420
func_ov078_02215420:
    add r0, r0, #0x200
    ldrsh r1, [r0, #0xb2]
    strh r1, [r0, #0xb0]
    ldrsh r1, [r0, #0xb6]
    strh r1, [r0, #0xb4]
    bx lr
.size func_ov078_02215420, . - func_ov078_02215420
