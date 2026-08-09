.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.

.global func_ov088_02217a18
func_ov088_02217a18:
    ldrsb r2, [r1, #0x0]
    strb r2, [r0, #0x0]
    ldrsb r2, [r1, #0x1]
    strb r2, [r0, #0x1]
    ldrsb r2, [r1, #0x2]
    strb r2, [r0, #0x2]
    ldrsb r1, [r1, #0x3]
    strb r1, [r0, #0x3]
    bx lr
.size func_ov088_02217a18, . - func_ov088_02217a18
