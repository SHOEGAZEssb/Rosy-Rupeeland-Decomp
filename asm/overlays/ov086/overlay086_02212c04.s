.text
; Matching fallback for the portable implementation in src/overlays/ov086/overlay086_recovery.c.

.global func_ov086_02212c04
func_ov086_02212c04:
    ldr r0, [r0, #0xd0]
    and r0, r0, #0x80
    bx lr
.size func_ov086_02212c04, . - func_ov086_02212c04
