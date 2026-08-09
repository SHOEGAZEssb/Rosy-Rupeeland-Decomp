.text
; Matching fallback for the portable implementation in src/overlays/ov093/overlay093_recovery.c.

.global func_ov093_02218750
func_ov093_02218750:
    ldr r0, [r0, #0xd0]
    tst r0, #0x40
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.size func_ov093_02218750, . - func_ov093_02218750
