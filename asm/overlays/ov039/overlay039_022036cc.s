.text
/* Exact fallback; see overlay039_helper_pool2.c for portable C. */

    .global func_ov039_022036cc
func_ov039_022036cc:
    mov r1, #0xa
    sub r3, r1, #0x1
    mov r2, #0x4
L_022036d8:
    add r1, r0, r3, lsl #0x2
    ldr r1, [r1, #0x74]
    subs r3, r3, #0x1
    str r2, [r1, #0x18]
    bpl L_022036d8
    bx lr
    .size func_ov039_022036cc, .-func_ov039_022036cc

