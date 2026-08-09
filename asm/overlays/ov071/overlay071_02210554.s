.text
; Matching fallback for the portable implementation in src/overlays/ov071/overlay071_recovery.c.
.extern func_ov071_0221083c

.global func_ov071_02210554
func_ov071_02210554:
    ldr ip, .L_0221055c
    bx ip
.L_0221055c: .word func_ov071_0221083c
.size func_ov071_02210554, . - func_ov071_02210554
