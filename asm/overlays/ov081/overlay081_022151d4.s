.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.

.global func_ov081_022151d4
func_ov081_022151d4:
    ldr r0, [r0, #0xd0]
    tst r0, #0x40
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.size func_ov081_022151d4, . - func_ov081_022151d4
