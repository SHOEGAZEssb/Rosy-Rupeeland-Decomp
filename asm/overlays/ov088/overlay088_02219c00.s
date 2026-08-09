.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern func_02033954

.global func_ov088_02219c00
func_ov088_02219c00:
    ldr ip, .L_02219c08
    bx ip
.L_02219c08: .word func_02033954
.size func_ov088_02219c00, . - func_ov088_02219c00
