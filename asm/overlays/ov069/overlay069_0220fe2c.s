.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.
.extern func_020050a4

.global func_ov069_0220fe2c
func_ov069_0220fe2c:
    ldr ip, .L_0220fe38
    add r0, r0, #0x310
    bx ip
.L_0220fe38: .word func_020050a4
.size func_ov069_0220fe2c, . - func_ov069_0220fe2c
