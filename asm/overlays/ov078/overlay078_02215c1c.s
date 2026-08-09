.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.

.global func_ov078_02215c1c
func_ov078_02215c1c:
    ldr r1, [r0, #0x260]
    orr r1, r1, #0x80
    str r1, [r0, #0x260]
    bx lr
.size func_ov078_02215c1c, . - func_ov078_02215c1c
