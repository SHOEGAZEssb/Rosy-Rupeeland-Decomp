.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.

.global func_ov084_02213708
func_ov084_02213708:
    mov r0, #0xc0000
    bx lr
.size func_ov084_02213708, . - func_ov084_02213708
