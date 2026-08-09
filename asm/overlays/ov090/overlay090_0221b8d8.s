.text
; Matching fallback for the portable implementation in src/overlays/ov090/overlay090_recovery.c.
.extern func_02005030

.global func_ov090_0221b8d8
func_ov090_0221b8d8:
    ldr ip, .L_0221b8e4
    add r1, r1, #0x18
    bx ip
.L_0221b8e4: .word func_02005030
.size func_ov090_0221b8d8, . - func_ov090_0221b8d8
