.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.

.global func_ov076_0221462c
func_ov076_0221462c:
    ldr r0, [r0, #0xd0]
    tst r0, #0x40
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.size func_ov076_0221462c, . - func_ov076_0221462c
