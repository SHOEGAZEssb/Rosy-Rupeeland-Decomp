.text
/* Exact fallback; see overlay039_script_render.c for portable C. */

    .global func_ov039_0220346c
func_ov039_0220346c:
    ldr r2, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r1, [r1, #0x4]
    str r1, [r0, #0x4]
    bx lr
    .size func_ov039_0220346c, .-func_ov039_0220346c

