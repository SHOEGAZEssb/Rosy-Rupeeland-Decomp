.text
; Matching fallback for the portable implementation in src/overlays/ov090/overlay090_recovery.c.

.global func_ov090_0221c434
func_ov090_0221c434:
    ldr r0, [r0, #0x4]
    ldr r0, [r0, r1, lsl #0x2]
    bx lr
.size func_ov090_0221c434, . - func_ov090_0221c434
