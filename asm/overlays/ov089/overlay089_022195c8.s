.text
; Matching fallback for the portable implementation in src/overlays/ov089/overlay089_recovery.c.
.extern func_02033b38

.global func_ov089_022195c8
func_ov089_022195c8:
    ldr ip, .L_022195d0
    bx ip
.L_022195d0: .word func_02033b38
.size func_ov089_022195c8, . - func_ov089_022195c8
