.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.
.extern func_020441cc

.global func_ov096_0221865c
func_ov096_0221865c:
    ldr ip, .L_02218664
    bx ip
.L_02218664: .word func_020441cc
.size func_ov096_0221865c, . - func_ov096_0221865c
