.text
/* Exact fallback; see overlay039_helper_pool2.c for portable C. */
    .extern func_ov069_02211778
    .global func_ov039_022039a4
func_ov039_022039a4:
    ldr ip, L_022039b4
    add r0, r0, #0x30c
    add r0, r0, #0x800
    bx ip
L_022039b4: .word func_ov069_02211778
    .size func_ov039_022039a4, .-func_ov039_022039a4

