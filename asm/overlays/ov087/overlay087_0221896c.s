.text
; Matching fallback for the portable implementation in src/overlays/ov087/overlay087_recovery.c.
.extern func_02033b38

.global func_ov087_0221896c
func_ov087_0221896c:
    ldr ip, .L_02218974
    bx ip
.L_02218974: .word func_02033b38
.size func_ov087_0221896c, . - func_ov087_0221896c
