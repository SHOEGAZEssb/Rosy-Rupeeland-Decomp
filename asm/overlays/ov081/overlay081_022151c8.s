.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.

.global func_ov081_022151c8
func_ov081_022151c8:
    ldr r0, [r0, #0xd0]
    and r0, r0, #0x80
    bx lr
.size func_ov081_022151c8, . - func_ov081_022151c8
