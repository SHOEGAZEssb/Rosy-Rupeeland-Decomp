.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern func_02033b38

.global func_ov075_02215038
func_ov075_02215038:
    ldr ip, .L_02215040
    bx ip
.L_02215040: .word func_02033b38
.size func_ov075_02215038, . - func_ov075_02215038
