.text
; Matching fallback for the portable implementation in src/overlays/ov080/overlay080_recovery.c.
.extern func_0203f2ec

.global func_ov080_02212f6c
func_ov080_02212f6c:
    ldr ip, .L_02212f74
    bx ip
.L_02212f74: .word func_0203f2ec
.size func_ov080_02212f6c, . - func_ov080_02212f6c
