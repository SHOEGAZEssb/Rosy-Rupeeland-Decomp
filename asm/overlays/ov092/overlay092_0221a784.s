.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.
.extern func_02005030

.global func_ov092_0221a784
func_ov092_0221a784:
    ldr ip, .L_0221a790
    add r1, r1, #0x18
    bx ip
.L_0221a790: .word func_02005030
.size func_ov092_0221a784, . - func_ov092_0221a784
