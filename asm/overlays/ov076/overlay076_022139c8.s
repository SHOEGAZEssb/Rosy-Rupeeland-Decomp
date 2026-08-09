.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern func_0203392c

.global func_ov076_022139c8
func_ov076_022139c8:
    ldr ip, .L_022139d0
    bx ip
.L_022139d0: .word func_0203392c
.size func_ov076_022139c8, . - func_ov076_022139c8
