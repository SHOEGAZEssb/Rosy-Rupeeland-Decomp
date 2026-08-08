.text
/* Exact fallback; see overlay039_helper_reset.c for portable C. */
    .global func_ov039_021fdb78
func_ov039_021fdb78:
    mov r1, #0x1e
    sub r3, r1, #0x1
    mov r2, #0x4
L_021fdb84:
    add r1, r0, r3, lsl #0x2
    ldr r1, [r1, #0xa0]
    subs r3, r3, #0x1
    str r2, [r1, #0x18]
    bpl L_021fdb84
    bx lr
    .size func_ov039_021fdb78, .-func_ov039_021fdb78
