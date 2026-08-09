.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.

.global func_ov084_02213700
func_ov084_02213700:
    add r0, r0, #0x18
    bx lr
.size func_ov084_02213700, . - func_ov084_02213700
