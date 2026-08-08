.text
/* Exact fallback; see overlay039_secondary_effects.c for portable C. */

    .global func_ov039_022040f4
func_ov039_022040f4:
    mov r1, #0x3
    sub r3, r1, #0x1
    mov r2, #0x0
L_02204100:
    add r1, r0, r3, lsl #0x2
    ldr r1, [r1, #0x9c]
    subs r3, r3, #0x1
    str r2, [r1, #0x0]
    bpl L_02204100
    bx lr
    .size func_ov039_022040f4, .-func_ov039_022040f4

