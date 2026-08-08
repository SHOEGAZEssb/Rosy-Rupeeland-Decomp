.text

/* Exact fallback for func_ov041_02202a3c; see the documented portable C in
 * src/overlays/ov041/overlay041_effect_record_helpers.c. */
    .global func_ov041_02202a3c
func_ov041_02202a3c: ; 0x02202a3c
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0x48]
    mov r1, #0x5b
    ldr ip, [r2, #0x194]
    sub lr, r1, #0x1
    mov r1, #0xc
.L_02202a54:
    mla r3, lr, r1, r0
    ldr r2, [r3, #0x70]
    subs lr, lr, #0x1
    sub r2, r2, ip
    str r2, [r3, #0x70]
    bpl .L_02202a54
    ldmia sp!, {r3, pc}
    .size func_ov041_02202a3c, . - func_ov041_02202a3c

