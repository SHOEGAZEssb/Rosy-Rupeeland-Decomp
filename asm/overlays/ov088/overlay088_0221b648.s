.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern func_02033b38

.global func_ov088_0221b648
func_ov088_0221b648:
    ldr ip, .L_0221b650
    bx ip
.L_0221b650: .word func_02033b38
.size func_ov088_0221b648, . - func_ov088_0221b648
