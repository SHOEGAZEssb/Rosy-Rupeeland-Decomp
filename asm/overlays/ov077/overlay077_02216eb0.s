.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.

.global func_ov077_02216eb0
func_ov077_02216eb0:
    mov r0, #0x20000
    bx lr
.size func_ov077_02216eb0, . - func_ov077_02216eb0
