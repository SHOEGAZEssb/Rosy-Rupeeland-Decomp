.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.

.global func_ov081_0221359c
func_ov081_0221359c:
    str r1, [r0, #0x210]
    bx lr
.size func_ov081_0221359c, . - func_ov081_0221359c
