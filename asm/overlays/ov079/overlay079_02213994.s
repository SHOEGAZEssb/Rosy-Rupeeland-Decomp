.text
; Matching fallback for the portable implementation in src/overlays/ov079/overlay079_recovery.c.

.global func_ov079_02213994
func_ov079_02213994:
    mov r0, #0xc0000
    bx lr
.size func_ov079_02213994, . - func_ov079_02213994
