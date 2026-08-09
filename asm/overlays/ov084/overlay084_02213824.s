.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.

.global func_ov084_02213824
func_ov084_02213824:
    mov r0, #0x800
    bx lr
.size func_ov084_02213824, . - func_ov084_02213824
