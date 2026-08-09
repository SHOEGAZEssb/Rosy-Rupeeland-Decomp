.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.

.global func_ov088_0221ad84
func_ov088_0221ad84:
    ldrsb r1, [r0, #0x3]
    ldrsb r0, [r0, #0x1]
    sub r0, r1, r0
    mov r0, r0, lsl #0x18
    mov r0, r0, asr #0x18
    bx lr
.size func_ov088_0221ad84, . - func_ov088_0221ad84
