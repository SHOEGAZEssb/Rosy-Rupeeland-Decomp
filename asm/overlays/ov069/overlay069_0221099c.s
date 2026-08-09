.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.
.extern func_ov069_022115c0

.global func_ov069_0221099c
func_ov069_0221099c:
    ldr ip, .L_022109ac
    add r0, r0, #0x2fc
    add r0, r0, #0x800
    bx ip
.L_022109ac: .word func_ov069_022115c0
.size func_ov069_0221099c, . - func_ov069_0221099c
