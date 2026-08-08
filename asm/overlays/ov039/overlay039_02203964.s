.text
/* Exact fallback; see overlay039_helper_pool2.c for portable C. */
    .extern func_ov049_0220c2dc
    .global func_ov039_02203964
func_ov039_02203964:
    ldr ip, L_02203978
    add r0, r0, #0x64
    add r0, r0, #0x400
    mov r2, #0x1
    bx ip
L_02203978: .word func_ov049_0220c2dc
    .size func_ov039_02203964, .-func_ov039_02203964

