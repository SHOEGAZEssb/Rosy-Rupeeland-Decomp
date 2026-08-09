.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.
.extern func_ov069_02211778

.global func_ov069_022109b0
func_ov069_022109b0:
    ldr ip, .L_022109c0
    add r0, r0, #0x2fc
    add r0, r0, #0x800
    bx ip
.L_022109c0: .word func_ov069_02211778
.size func_ov069_022109b0, . - func_ov069_022109b0
