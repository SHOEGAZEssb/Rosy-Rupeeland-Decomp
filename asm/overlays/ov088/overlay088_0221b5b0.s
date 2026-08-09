.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.

.global func_ov088_0221b5b0
func_ov088_0221b5b0:
    mov r0, #0x40000
    bx lr
.size func_ov088_0221b5b0, . - func_ov088_0221b5b0
