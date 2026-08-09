.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.

.global func_ov088_02217c3c
func_ov088_02217c3c:
    strb r1, [r0, #0x0]
    strb r2, [r0, #0x1]
    ldrsb r1, [sp, #0x0]
    strb r3, [r0, #0x2]
    strb r1, [r0, #0x3]
    bx lr
.size func_ov088_02217c3c, . - func_ov088_02217c3c
