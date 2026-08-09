.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.

.global func_ov078_02215b20
func_ov078_02215b20:
    mov r0, #0xc0000
    bx lr
.size func_ov078_02215b20, . - func_ov078_02215b20
