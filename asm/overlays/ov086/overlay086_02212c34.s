.text
; Matching fallback for the portable implementation in src/overlays/ov086/overlay086_recovery.c.

.global func_ov086_02212c34
func_ov086_02212c34:
    mov r0, #0x10
    bx lr
.size func_ov086_02212c34, . - func_ov086_02212c34
