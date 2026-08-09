.text
; Matching fallback for the portable implementation in src/overlays/ov086/overlay086_recovery.c.

.global func_ov086_02212d90
func_ov086_02212d90:
    mov r0, #0x20000
    bx lr
.size func_ov086_02212d90, . - func_ov086_02212d90
