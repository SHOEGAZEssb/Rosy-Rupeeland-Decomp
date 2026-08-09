.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.

.global func_ov095_0221c6cc
func_ov095_0221c6cc:
    ldr r1, [r0, #0xd0]
    orr r1, r1, #0x80
    str r1, [r0, #0xd0]
    bx lr
.size func_ov095_0221c6cc, . - func_ov095_0221c6cc
