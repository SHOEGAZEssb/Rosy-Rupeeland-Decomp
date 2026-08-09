.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.

.global func_ov096_02217ea4
func_ov096_02217ea4:
    ldr r0, [r0, #0xd0]
    and r0, r0, #0x80
    bx lr
.size func_ov096_02217ea4, . - func_ov096_02217ea4
