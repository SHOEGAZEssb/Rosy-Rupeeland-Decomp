    .text
/* Exact fallback; see overlay041_base_construct.c for portable C. */
    .extern data_ov041_02205858

    .global func_ov041_021fd000
func_ov041_021fd000: ; 0x021fd000
    ldr r2, .L_021fd018
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    bx lr
.L_021fd018: .word data_ov041_02205858
    .size func_ov041_021fd000, . - func_ov041_021fd000
