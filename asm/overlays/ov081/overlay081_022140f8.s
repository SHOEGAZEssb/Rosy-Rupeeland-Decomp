.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern func_ov081_02212d64

.global func_ov081_022140f8
func_ov081_022140f8:
    ldr ip, .L_02214100
    bx ip
.L_02214100: .word func_ov081_02212d64
.size func_ov081_022140f8, . - func_ov081_022140f8
