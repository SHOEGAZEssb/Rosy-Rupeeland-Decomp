.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.

.global func_ov088_0221ad6c
func_ov088_0221ad6c:
    ldrsb r1, [r0, #0x2]
    ldrsb r0, [r0, #0x0]
    sub r0, r1, r0
    mov r0, r0, lsl #0x18
    mov r0, r0, asr #0x18
    bx lr
.size func_ov088_0221ad6c, . - func_ov088_0221ad6c
