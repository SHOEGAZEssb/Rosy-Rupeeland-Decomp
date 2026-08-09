.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern func_02051e04

.global func_ov095_0221c3a0
func_ov095_0221c3a0:
    ldr ip, .L_0221c3a8
    bx ip
.L_0221c3a8: .word func_02051e04
.size func_ov095_0221c3a0, . - func_ov095_0221c3a0
