.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.

.global func_ov085_02214298
func_ov085_02214298:
    ldr r0, [r0, #0xd0]
    and r0, r0, #0x80
    bx lr
.size func_ov085_02214298, . - func_ov085_02214298
