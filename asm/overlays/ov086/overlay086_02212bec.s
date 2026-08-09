.text
; Matching fallback for the portable implementation in src/overlays/ov086/overlay086_recovery.c.

.global func_ov086_02212bec
func_ov086_02212bec:
    mov r0, #0x0
    bx lr
.size func_ov086_02212bec, . - func_ov086_02212bec
