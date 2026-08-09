.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.

.global func_ov085_022142c8
func_ov085_022142c8:
    ldr r1, [r0, #0xd0]
    orr r1, r1, #0x80
    str r1, [r0, #0xd0]
    bx lr
.size func_ov085_022142c8, . - func_ov085_022142c8
