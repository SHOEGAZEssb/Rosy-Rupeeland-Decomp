.text
/* Exact fallback; see overlay039_opening_helpers.c for portable C. */
    .extern data_ov039_022083fc
    .global func_ov039_021fce40
func_ov039_021fce40:
    ldr r2, L_021fce58
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    bx lr
L_021fce58: .word data_ov039_022083fc
    .size func_ov039_021fce40, .-func_ov039_021fce40
