.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.

.global func_ov088_02219154
func_ov088_02219154:
    str r1, [r0, #0x4]
    mov r1, #0x0
    str r1, [r0, #0x0]
    str r1, [r0, #0x8]
    bx lr
.size func_ov088_02219154, . - func_ov088_02219154
