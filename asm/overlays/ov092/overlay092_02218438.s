.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.
.extern func_02031758

.global func_ov092_02218438
func_ov092_02218438:
    ldr ip, .L_02218440
    bx ip
.L_02218440: .word func_02031758
.size func_ov092_02218438, . - func_ov092_02218438
