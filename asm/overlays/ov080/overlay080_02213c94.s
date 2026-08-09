.text
; Matching fallback for the portable implementation in src/overlays/ov080/overlay080_recovery.c.
.extern func_02005030

.global func_ov080_02213c94
func_ov080_02213c94:
    ldr ip, .L_02213ca0
    add r1, r1, #0x18
    bx ip
.L_02213ca0: .word func_02005030
.size func_ov080_02213c94, . - func_ov080_02213c94
