.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern func_02005030

.global func_ov081_02213c50
func_ov081_02213c50:
    ldr ip, .L_02213c5c
    add r1, r1, #0x18
    bx ip
.L_02213c5c: .word func_02005030
.size func_ov081_02213c50, . - func_ov081_02213c50
