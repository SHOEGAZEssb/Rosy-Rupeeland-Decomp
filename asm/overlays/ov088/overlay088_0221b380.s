.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.

.global func_ov088_0221b380
func_ov088_0221b380:
    ldr r1, [r0, #0x238]
    mov r0, #0x3c
    ldrsh r1, [r1, #0x16]
    smulbb r0, r1, r0
    bx lr
.size func_ov088_0221b380, . - func_ov088_0221b380
