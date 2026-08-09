.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern func_ov081_02214524

.global func_ov081_02215224
func_ov081_02215224:
    ldr ip, .L_02215230
    add r0, r0, #0x244
    bx ip
.L_02215230: .word func_ov081_02214524
.size func_ov081_02215224, . - func_ov081_02215224
