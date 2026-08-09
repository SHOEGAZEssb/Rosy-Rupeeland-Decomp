.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.

.global func_ov096_0221881c
func_ov096_0221881c:
    ldr r1, [r0, #0xd0]
    tst r1, #0x10
    ldreq r1, [r0, #0x24]
    ldreq r0, [r0, #0x1dc]
    cmpeq r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.size func_ov096_0221881c, . - func_ov096_0221881c
