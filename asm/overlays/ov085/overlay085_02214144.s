.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.
.extern func_02005030

.global func_ov085_02214144
func_ov085_02214144:
    ldr ip, .L_02214150
    add r1, r1, #0x18
    bx ip
.L_02214150: .word func_02005030
.size func_ov085_02214144, . - func_ov085_02214144
