.text
; Matching fallback for the portable implementation in src/overlays/ov083/overlay083_recovery.c.
.extern func_02005030

.global func_ov083_02213c6c
func_ov083_02213c6c:
    ldr ip, .L_02213c78
    add r1, r1, #0x18
    bx ip
.L_02213c78: .word func_02005030
.size func_ov083_02213c6c, . - func_ov083_02213c6c
