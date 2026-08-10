.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern Actor_TestQueryPointAndClearFlag2000

.global func_ov088_02219c00
func_ov088_02219c00:
    ldr ip, .L_02219c08
    bx ip
.L_02219c08: .word Actor_TestQueryPointAndClearFlag2000
.size func_ov088_02219c00, . - func_ov088_02219c00
