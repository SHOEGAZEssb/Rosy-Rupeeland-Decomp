.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.

.global func_ov077_02215f24
func_ov077_02215f24:
    mov r0, #0x800
    bx lr
.size func_ov077_02215f24, . - func_ov077_02215f24
