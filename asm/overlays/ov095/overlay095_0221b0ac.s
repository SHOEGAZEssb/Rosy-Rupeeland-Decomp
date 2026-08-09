.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern func_02005030

.global func_ov095_0221b0ac
func_ov095_0221b0ac:
    ldr ip, .L_0221b0b8
    add r1, r1, #0x18
    bx ip
.L_0221b0b8: .word func_02005030
.size func_ov095_0221b0ac, . - func_ov095_0221b0ac
