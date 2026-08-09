.text
; Matching fallback for the portable implementation in src/overlays/ov057/overlay057_recovery.c.
.extern func_ov057_0220e658

.global func_ov057_0220e774
func_ov057_0220e774:
    ldr ip, .L_0220e77c
    bx ip
.L_0220e77c: .word func_ov057_0220e658
.size func_ov057_0220e774, . - func_ov057_0220e774
