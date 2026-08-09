.text
; Matching fallback for the portable implementation in src/overlays/ov083/overlay083_recovery.c.

.global func_ov083_02213cb4
func_ov083_02213cb4:
    add r0, r0, #0x18
    bx lr
.size func_ov083_02213cb4, . - func_ov083_02213cb4
