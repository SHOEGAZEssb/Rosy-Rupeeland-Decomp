.text
; Matching fallback for the portable implementation in src/overlays/ov091/overlay091_recovery.c.
.extern Actor_UpdatePresentation

.global func_ov091_02218a5c
func_ov091_02218a5c:
    ldr ip, .L_02218a64
    bx ip
.L_02218a64: .word Actor_UpdatePresentation
.size func_ov091_02218a5c, . - func_ov091_02218a5c
