.text
/* Exact fallback; see overlay039_opening_helpers.c for portable C. */
    .extern func_ov039_021fce40
    .global func_ov039_021fce60
func_ov039_021fce60:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov039_021fce40
    add r0, r4, #0xc
    bl func_ov039_021fce40
    mov r1, #0x4
    mov r0, r4
    str r1, [r4, #0x18]
    ldmia sp!, {r4, pc}
    .size func_ov039_021fce60, .-func_ov039_021fce60
