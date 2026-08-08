.text
/* Exact fallback; see overlay039_helper_pool2.c for portable C. */

    .global func_ov039_02203940
func_ov039_02203940:
    add r0, r0, r1, lsl #0x4
    add r0, r0, #0x1000
    ldr r3, [r0, #0x5a0]
    mov r1, #0x0
    str r3, [r2, #0x4]
    ldr r0, [r0, #0x5a8]
    str r0, [r2, #0x8]
    str r1, [r2, #0xc]
    bx lr
    .size func_ov039_02203940, .-func_ov039_02203940

