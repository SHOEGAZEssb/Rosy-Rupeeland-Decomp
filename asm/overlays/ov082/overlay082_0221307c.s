.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.

.global func_ov082_0221307c
func_ov082_0221307c:
    ldr r0, [r0, #0xd0]
    tst r0, #0x40
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.size func_ov082_0221307c, . - func_ov082_0221307c
