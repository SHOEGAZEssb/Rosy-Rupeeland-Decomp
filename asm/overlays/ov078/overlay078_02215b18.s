.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.

.global func_ov078_02215b18
func_ov078_02215b18:
    add r0, r0, #0x18
    bx lr
.size func_ov078_02215b18, . - func_ov078_02215b18
