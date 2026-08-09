.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern func_ov078_0221361c

.global func_ov078_02215438
func_ov078_02215438:
    ldr ip, .L_02215440
    bx ip
.L_02215440: .word func_ov078_0221361c
.size func_ov078_02215438, . - func_ov078_02215438
