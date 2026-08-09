.text
; Matching fallback for the portable implementation in src/overlays/ov087/overlay087_recovery.c.

.global func_ov087_022188e4
func_ov087_022188e4:
    mov r0, #0x40000
    bx lr
.size func_ov087_022188e4, . - func_ov087_022188e4
