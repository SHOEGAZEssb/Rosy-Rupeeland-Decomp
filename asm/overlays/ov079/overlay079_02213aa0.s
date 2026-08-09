.text
; Matching fallback for the portable implementation in src/overlays/ov079/overlay079_recovery.c.

.global func_ov079_02213aa0
func_ov079_02213aa0:
    mov r0, #0x800
    bx lr
.size func_ov079_02213aa0, . - func_ov079_02213aa0
