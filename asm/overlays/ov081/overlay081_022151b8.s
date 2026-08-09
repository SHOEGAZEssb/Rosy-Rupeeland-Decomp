.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.

.global func_ov081_022151b8
func_ov081_022151b8:
    mov r0, #0x40000
    bx lr
.size func_ov081_022151b8, . - func_ov081_022151b8
