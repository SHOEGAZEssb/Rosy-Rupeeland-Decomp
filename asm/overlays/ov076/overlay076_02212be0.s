.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern func_0203e56c

.global func_ov076_02212be0
func_ov076_02212be0:
    ldr ip, .L_02212be8
    bx ip
.L_02212be8: .word func_0203e56c
.size func_ov076_02212be0, . - func_ov076_02212be0
