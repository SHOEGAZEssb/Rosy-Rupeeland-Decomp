.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.

.global func_ov077_02216f0c
func_ov077_02216f0c:
    mov r0, #0xc0000
    bx lr
.size func_ov077_02216f0c, . - func_ov077_02216f0c
