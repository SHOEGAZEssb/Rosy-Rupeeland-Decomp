.text
; Matching fallback for the portable implementation in src/overlays/ov091/overlay091_recovery.c.
.extern func_02031758

.global func_ov091_02218a5c
func_ov091_02218a5c:
    ldr ip, .L_02218a64
    bx ip
.L_02218a64: .word func_02031758
.size func_ov091_02218a5c, . - func_ov091_02218a5c
