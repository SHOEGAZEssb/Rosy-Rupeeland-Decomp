.text
/* Exact fallback; see overlay039_helper_pool2.c for portable C. */

    .global func_ov039_02203770
func_ov039_02203770:
    ldr r3, [r0, #0x4]
    ldr r2, [r1, #0x4]
    add r2, r3, r2
    str r2, [r0, #0x4]
    ldr r2, [r0, #0x8]
    ldr r1, [r1, #0x8]
    add r1, r2, r1
    str r1, [r0, #0x8]
    bx lr
    .size func_ov039_02203770, .-func_ov039_02203770

