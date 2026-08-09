.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.
.extern func_ov049_0220c2dc

.global func_ov069_02210970
func_ov069_02210970:
    ldr ip, .L_02210984
    add r0, r0, #0x54
    add r0, r0, #0x400
    mov r2, #0x1
    bx ip
.L_02210984: .word func_ov049_0220c2dc
.size func_ov069_02210970, . - func_ov069_02210970
