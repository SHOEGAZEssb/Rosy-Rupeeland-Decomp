.text
; Matching fallback for the portable implementation in src/overlays/ov086/overlay086_recovery.c.

.global func_ov086_02212c10
func_ov086_02212c10:
    ldr r0, [r0, #0xd0]
    tst r0, #0x40
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.size func_ov086_02212c10, . - func_ov086_02212c10
