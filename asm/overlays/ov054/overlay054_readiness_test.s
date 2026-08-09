.text
; Matching fallback for the portable implementation in src/overlays/ov054/overlay054_recovery.c.
.extern func_ov054_0220e4f8

.global func_ov054_0220ea18
func_ov054_0220ea18:
    ldr ip, .L_0220ea20
    bx ip
.L_0220ea20: .word func_ov054_0220e4f8
.size func_ov054_0220ea18, . - func_ov054_0220ea18
