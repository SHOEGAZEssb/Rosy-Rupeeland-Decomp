.text
; Matching fallback for the portable implementation in src/overlays/ov087/overlay087_recovery.c.
.extern func_02005030

.global func_ov087_022188f4
func_ov087_022188f4:
    ldr ip, .L_02218900
    add r1, r1, #0x18
    bx ip
.L_02218900: .word func_02005030
.size func_ov087_022188f4, . - func_ov087_022188f4
