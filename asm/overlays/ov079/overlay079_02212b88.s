.text
; Matching fallback for the portable implementation in src/overlays/ov079/overlay079_recovery.c.
.extern func_0203e56c

.global func_ov079_02212b88
func_ov079_02212b88:
    ldr ip, .L_02212b90
    bx ip
.L_02212b90: .word func_0203e56c
.size func_ov079_02212b88, . - func_ov079_02212b88
