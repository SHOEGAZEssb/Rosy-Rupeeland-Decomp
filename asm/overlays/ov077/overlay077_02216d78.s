.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.

.global func_ov077_02216d78
func_ov077_02216d78:
    ldr r0, [r0, #0xd0]
    and r0, r0, #0x80
    bx lr
.size func_ov077_02216d78, . - func_ov077_02216d78
