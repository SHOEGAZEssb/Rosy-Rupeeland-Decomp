.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern func_020520b4

.global func_ov095_0221c8d0
func_ov095_0221c8d0:
    ldr ip, .L_0221c8d8
    bx ip
.L_0221c8d8: .word func_020520b4
.size func_ov095_0221c8d0, . - func_ov095_0221c8d0
