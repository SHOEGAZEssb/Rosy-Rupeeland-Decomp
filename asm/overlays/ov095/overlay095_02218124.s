.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern func_ov078_0221361c

.global func_ov095_02218124
func_ov095_02218124:
    ldr ip, .L_0221812c
    bx ip
.L_0221812c: .word func_ov078_0221361c
.size func_ov095_02218124, . - func_ov095_02218124
