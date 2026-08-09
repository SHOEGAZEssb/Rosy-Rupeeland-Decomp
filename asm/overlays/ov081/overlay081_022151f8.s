.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.

.global func_ov081_022151f8
func_ov081_022151f8:
    ldr r1, [r0, #0xd0]
    orr r1, r1, #0x80
    str r1, [r0, #0xd0]
    bx lr
.size func_ov081_022151f8, . - func_ov081_022151f8
