.text
; Matching fallback for the portable implementation in src/overlays/ov054/overlay054_recovery.c.
.extern func_ov054_0220e4f8

.global func_ov054_0220ea24
func_ov054_0220ea24:
    ldr ip, .L_0220ea30
    mov r1, #0x0
    bx ip
.L_0220ea30: .word func_ov054_0220e4f8
.size func_ov054_0220ea24, . - func_ov054_0220ea24
