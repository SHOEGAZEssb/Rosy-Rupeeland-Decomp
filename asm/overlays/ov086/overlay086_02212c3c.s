.text
; Matching fallback for the portable implementation in src/overlays/ov086/overlay086_recovery.c.

.global func_ov086_02212c3c
func_ov086_02212c3c:
    add r0, r0, #0x18
    bx lr
.size func_ov086_02212c3c, . - func_ov086_02212c3c
