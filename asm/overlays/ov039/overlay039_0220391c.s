.text
/* Exact fallback; see overlay039_helper_pool2.c for portable C. */

    .global func_ov039_0220391c
func_ov039_0220391c:
    mov r3, #0x3c
    mla r3, r1, r3, r0
    ldr r1, [r3, #0x484]
    mov r0, #0x0
    str r1, [r2, #0x4]
    ldr r1, [r3, #0x488]
    str r1, [r2, #0x8]
    str r0, [r2, #0xc]
    bx lr
    .size func_ov039_0220391c, .-func_ov039_0220391c

