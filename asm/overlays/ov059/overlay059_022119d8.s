.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.

.global func_ov059_022119d8
func_ov059_022119d8:
    str r1, [r0, #0x4c]
    mov r0, #0x0
    bx lr
.size func_ov059_022119d8, . - func_ov059_022119d8
