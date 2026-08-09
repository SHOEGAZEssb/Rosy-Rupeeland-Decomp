.text
; Matching fallback for the portable implementation in src/overlays/ov090/overlay090_recovery.c.

.global func_ov090_0221c728
func_ov090_0221c728:
    ldr r2, [r0, #0x4]
    strh r1, [r2, #0x30]
    ldr r0, [r0, #0x8]
    strh r1, [r0, #0x30]
    bx lr
.size func_ov090_0221c728, . - func_ov090_0221c728
