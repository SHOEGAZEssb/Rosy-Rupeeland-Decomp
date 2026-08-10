.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern VecFx32Object_InitCopy

.global func_ov081_02213c50
func_ov081_02213c50:
    ldr ip, .L_02213c5c
    add r1, r1, #0x18
    bx ip
.L_02213c5c: .word VecFx32Object_InitCopy
.size func_ov081_02213c50, . - func_ov081_02213c50
