.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.

.global func_ov075_0221424c
func_ov075_0221424c:
    ldr r0, [r0, #0x260]
    tst r0, #0x8
    movne r0, #0x1
    moveq r0, #0x0
    bx lr
.size func_ov075_0221424c, . - func_ov075_0221424c
