.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern func_02005030

.global func_ov097_02219b60
func_ov097_02219b60:
    ldr ip, .L_02219b6c
    add r1, r1, #0x18
    bx ip
.L_02219b6c: .word func_02005030
.size func_ov097_02219b60, . - func_ov097_02219b60
