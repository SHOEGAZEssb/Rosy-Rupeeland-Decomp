.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.

.global func_ov078_02215bdc
func_ov078_02215bdc:
    mov r0, #0x800
    bx lr
.size func_ov078_02215bdc, . - func_ov078_02215bdc
