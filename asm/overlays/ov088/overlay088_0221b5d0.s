.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.

.global func_ov088_0221b5d0
func_ov088_0221b5d0:
    ldr r0, [r0, #0xd0]
    and r0, r0, #0x80
    bx lr
.size func_ov088_0221b5d0, . - func_ov088_0221b5d0
