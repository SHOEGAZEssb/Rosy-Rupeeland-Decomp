.text
; Matching fallback for the portable implementation in src/overlays/ov086/overlay086_recovery.c.

.global func_ov086_02212c44
func_ov086_02212c44:
    mov r0, #0xc0000
    bx lr
.size func_ov086_02212c44, . - func_ov086_02212c44
