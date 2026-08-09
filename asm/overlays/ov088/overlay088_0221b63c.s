.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern func_02033b38

.global func_ov088_0221b63c
func_ov088_0221b63c:
    ldr ip, .L_0221b644
    bx ip
.L_0221b644: .word func_02033b38
.size func_ov088_0221b63c, . - func_ov088_0221b63c
