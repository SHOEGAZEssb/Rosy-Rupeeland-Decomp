.text

/* Exact fallback; see src/overlays/ov032/overlay032_unlock_effect.c for documented portable C. */
.extern func_02072b68

    .global func_ov032_02200180
func_ov032_02200180:
    mov r1, #0x0
    str r1, [r0, #0xc]
    ldr r1, [r0, #0x14]
    ldr ip, L_0220019c
    ldr r0, [r0, #0x0]
    and r1, r1, #0xff
    bx ip
L_0220019c: .word func_02072b68
.size func_ov032_02200180, .-func_ov032_02200180

