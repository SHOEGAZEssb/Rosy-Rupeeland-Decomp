.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.

.global func_ov088_0221b654
func_ov088_0221b654:
    mov r0, #0x10000
    bx lr
.size func_ov088_0221b654, . - func_ov088_0221b654
