.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.
.extern Actor_UpdatePresentation

.global func_ov092_02218438
func_ov092_02218438:
    ldr ip, .L_02218440
    bx ip
.L_02218440: .word Actor_UpdatePresentation
.size func_ov092_02218438, . - func_ov092_02218438
