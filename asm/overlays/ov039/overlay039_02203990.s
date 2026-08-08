.text
/* Exact fallback; see overlay039_helper_pool2.c for portable C. */
    .extern func_ov069_022115c0
    .global func_ov039_02203990
func_ov039_02203990:
    ldr ip, L_022039a0
    add r0, r0, #0x30c
    add r0, r0, #0x800
    bx ip
L_022039a0: .word func_ov069_022115c0
    .size func_ov039_02203990, .-func_ov039_02203990

